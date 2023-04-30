import yaml
import logging
import os
import requests
import re
import urllib.request
import tarfile
import glob
import pystache

config = None
schemelists = {}
templatelists = {}
schemes = {}

def config_get_schemes():
    return config['schemes']

def config_get_output_dir():
    return os.path.expanduser(config['output_dir'])

def config_get_scheme_dir():
    return os.path.expanduser(config['scheme_dir'])

def config_get_template_dir():
    return os.path.expanduser(config['template_dir'])

def config_get_cache_dir():
    return os.path.expanduser(config['cache_dir'])

def config_get_scheme_lists():
    return config['scheme_lists']

def config_get_template_lists():
    return config['template_lists']

def config_get_templates():
    return config['templates']

def schemelist_download(url):
    logging.debug(f'Schemelist download: {url}')

    req = requests.get(url)
    if req.status_code != 200:
        logging.warning(f'Schemelist not found: {url}')
        return None

    return yaml.full_load(req.text)

def schemelist_download_all():
    scheme_lists = config_get_scheme_lists()
    for schemelist_name in scheme_lists:
        data = schemelist_download(scheme_lists[schemelist_name])
        schemelists[schemelist_name] = data

def output_dir_create():
    output_dir = config_get_output_dir()
    if not os.path.exists(output_dir):
        os.mkdir(output_dir)

def scheme_dir_create():
    scheme_dir = config_get_scheme_dir()
    if not os.path.exists(scheme_dir):
        os.mkdir(scheme_dir)

def template_dir_create():
    template_dir = config_get_template_dir()
    if not os.path.exists(template_dir):
        os.mkdir(template_dir)

def cache_dir_create():
    cache_dir = config_get_cache_dir()
    if not os.path.exists(cache_dir):
        os.mkdir(cache_dir)

def scheme_exists(scheme_name):
    return os.path.exists(os.path.join(config_get_scheme_dir(), f'{scheme_name}'))


def schemelist_get_scheme_url(scheme_name):
    for schemelist_name in schemelists:
        for scheme in schemelists[schemelist_name]:
            if scheme == scheme_name:
                return schemelists[schemelist_name][scheme]

def templatelist_get_template_url(template_name):
    for templatelist_name in templatelists:
        for template in templatelists[templatelist_name]:
            if template == template_name:
                return templatelists[templatelist_name][template]


def github_get_repo_data(repo_url):
    result = re.search(r"^https://github\.com/(?P<owner>[A-Za-z0-9-_]+)/(?P<repo>[A-Za-z0-9-_]+)$", repo_url)
    owner = result.group('owner')
    repo = result.group('repo')

    req = requests.get(f'https://api.github.com/repos/{owner}/{repo}')
    return req.json()

def gitlab_get_repo_data(repo_url):
    result = re.search(r"^https://gitlab\.com/(?P<owner>[A-Za-z0-9-_]+)/(?P<repo>[A-Za-z0-9-_]+)$", repo_url)
    owner = result.group('owner')
    repo = result.group('repo')

    req = requests.get(f'https://gitlab.com/api/v4/projects?search={repo}')

    data = req.json()
    namespace_name = f'{owner}/{repo}'
    for repo in data:
        namespace = repo['path_with_namespace']

        if namespace == namespace_name:
            return repo

def get_repo_data(repo_url):
    data = {}

    if repo_url.startswith('https://github.com'):
        gh_data = github_get_repo_data(repo_url)

        data['full_name'] = gh_data['full_name']
        data['branch'] = gh_data['default_branch']
        data['targz_url'] = f"https://github.com/{data['full_name']}/archive/refs/heads/{data['branch']}.tar.gz"
        data['targz_folder'] = f"{gh_data['name']}-{data['branch']}"

    if repo_url.startswith('https://gitlab.com'):
        gl_data = gitlab_get_repo_data(repo_url)

        data['full_name'] = gl_data['path_with_namespace']
        data['branch'] = gl_data['default_branch']
        data['targz_url'] = f"https://gitlab.com/{data['full_name']}/-/archive/{data['branch']}/{gl_data['name']}-{data['branch']}.tar.gz"
        data['targz_folder'] = f"{gl_data['name']}-{data['branch']}"

    return data

def scheme_download(scheme_name):
    scheme_repo_url = schemelist_get_scheme_url(scheme_name)
    logging.debug(f'Scheme download url is: {scheme_repo_url}')

    repo_data = get_repo_data(scheme_repo_url)
    logging.debug(f'Scheme data: {repo_data}')

    logging.info(f'Scheme download: {scheme_name}')
    tar_path = os.path.join(config_get_cache_dir(), f'scheme_{scheme_name}.tar.gz')
    urllib.request.urlretrieve(repo_data['targz_url'], tar_path)

    scheme_path = os.path.join(config_get_scheme_dir(), scheme_name)

    if not os.path.exists(scheme_path):
        logging.debug(f'Scheme creating directory: {scheme_path}')
        os.mkdir(scheme_path)

    with tarfile.open(name=tar_path) as scheme_tar:
        members = scheme_tar.getmembers()
        yaml_members = []

        for member in members:
            if member.isfile() and member.name.endswith('.yaml'):
                member.name = os.path.basename(member.name)
                yaml_members.append(member)

        scheme_tar.extractall(scheme_path, members=yaml_members)

def templatelist_download(url):
    logging.debug(f'Templatelist download: {url}')

    req = requests.get(url)
    if req.status_code != 200:
        logging.warning(f'Templatelist not found: {url}')
        return None

    return yaml.full_load(req.text)

def templatelist_download(url):
    logging.debug(f'Schemelist download: {url}')

    req = requests.get(url)
    if req.status_code != 200:
        logging.warning(f'Schemelist not found: {url}')
        return None

    return yaml.full_load(req.text)

def templatelist_download_all():
    template_lists = config_get_template_lists()
    for templatelist_name in template_lists:
        data = templatelist_download(template_lists[templatelist_name])
        templatelists[templatelist_name] = data


def template_download(template_name):
    template_repo_url = templatelist_get_template_url(template_name)
    logging.debug(f'Template download url is: {template_repo_url}')

    repo_data = get_repo_data(template_repo_url)
    logging.debug(f'Template data: {repo_data}')

    logging.info(f'Template download: {template_name}')
    tar_path = os.path.join(config_get_cache_dir(), f'template_{template_name}.tar.gz')
    urllib.request.urlretrieve(repo_data['targz_url'], tar_path)

    template_path = os.path.join(config_get_template_dir(), template_name)

    if not os.path.exists(template_name):
        logging.debug(f'Template creating directory: {template_path}')
        os.mkdir(template_path)

    with tarfile.open(name=tar_path) as template_tar:
        members = template_tar.getmembers()
        updated_members = []
        for member in members:
            if member.isreg():
                member.name = member.name.replace(f"{repo_data['targz_folder']}/", '')
                updated_members.append(member)

        template_tar.extractall(template_path, members=updated_members)

def template_exists(template_name):
    return os.path.exists(os.path.join(config_get_template_dir(), f'{template_name}'))

def template_download_all():
    template_dir_create()
    logging.info('templates download')
    templates = config_get_templates()

    for template_name in templates:
        if not template_exists(template_name):
            template_download(template_name)

    logging.info('templates downloaded')

def scheme_get_data(scheme_name):
    files = glob.glob(os.path.join(config_get_scheme_dir(), scheme_name, '*.yaml'))

    for file in files:
        scheme_variant_name = os.path.basename(file).replace('.yaml', '')

        with open(file, 'r') as f:
            data = yaml.full_load(f.read())
            schemes[scheme_variant_name] = data

def scheme_load():
    logging.info('schemes load')
    scheme_dir_create()

    for scheme_name in config_get_schemes():
        if not scheme_exists(scheme_name):
            scheme_download(scheme_name)

        scheme_get_data(scheme_name)

    logging.info('schemes loaded')


def load_config(config_file_path):
    logging.debug(f'Read config from path: {config_file_path}')

    with open(config_file_path, 'r') as f:
        config_content = f.read()

    config = yaml.full_load(config_content)

    return config

def build_templates():
    output_dir_create()

    for template_path in glob.glob(os.path.join(config_get_template_dir(), '*')):
        template_name = os.path.basename(template_path)

        build_template(template_name)

def reverse_hex(hex_str):
    hex_str = "".join([hex_str[i : i + 2] for i in range(0, len(hex_str), 2)][::-1])
    return hex_str

def scheme_prepare(scheme_data):
    scheme = {
        'scheme-name': scheme_data['scheme'],
        'scheme-author': scheme_data['author'],
    }

    bases = ["base{:02X}".format(x) for x in range(0, 16)]
    for base in bases:
        scheme["{}-hex".format(base)] = scheme_data[base]
        scheme["{}-hex-r".format(base)] = scheme["{}-hex".format(base)][0:2]
        scheme["{}-hex-g".format(base)] = scheme["{}-hex".format(base)][2:4]
        scheme["{}-hex-b".format(base)] = scheme["{}-hex".format(base)][4:6]
        scheme["{}-hex-bgr".format(base)] = reverse_hex(scheme["{}-hex".format(base)])

        scheme["{}-rgb-r".format(base)] = str(int(scheme["{}-hex-r".format(base)], 16))
        scheme["{}-rgb-g".format(base)] = str(int(scheme["{}-hex-g".format(base)], 16))
        scheme["{}-rgb-b".format(base)] = str(int(scheme["{}-hex-b".format(base)], 16))

        scheme["{}-dec-r".format(base)] = str(
            int(scheme["{}-rgb-r".format(base)]) / 255
        )
        scheme["{}-dec-g".format(base)] = str(
            int(scheme["{}-rgb-g".format(base)]) / 255
        )
        scheme["{}-dec-b".format(base)] = str(
            int(scheme["{}-rgb-b".format(base)]) / 255
        )

    return scheme


def build_template(template_name):
    template_path = os.path.join(config_get_template_dir(), template_name, 'templates')
    template_config_path = os.path.join(template_path, 'config.yaml')
    template_output_path = os.path.join(config_get_output_dir(), template_name)

    if not os.path.exists(template_output_path):
        os.mkdir(template_output_path)

    with open(template_config_path, 'r') as f:
        template_config = yaml.full_load(f.read())

    scheme_data = {}
    for scheme_name in schemes:
        scheme_data[scheme_name] = scheme_prepare(schemes[scheme_name])

    for template_config_key in template_config:
        mustache_path = os.path.join(template_path, f'{template_config_key}.mustache')

        with open(mustache_path, 'r') as f:
            mustache_content = f.read()

        for scheme_name in schemes:
            output_filename = f"base16-{scheme_name}{template_config[template_config_key]['extension']}"

            rendered = pystache.render(mustache_content, scheme_data[scheme_name])

            output_filepath = os.path.join(template_output_path, output_filename)
            with open(output_filepath, 'w') as f:
                f.write(rendered)

            logging.info(f'Output written: {output_filepath}')


if __name__ == '__main__':
    logging.basicConfig(level=logging.DEBUG)

    config_file_path = os.path.expanduser('~/.config/base16/config.yaml')
    config = load_config(config_file_path)

    cache_dir_create()

    schemelist_download_all()
    templatelist_download_all()
    scheme_load()
    template_download_all()

    build_templates()
