import argparse
import os


def create_arguments():
    parser = argparse.ArgumentParser(description='init script for dotfiles')

    group = parser.add_argument_group('category')
    group.add_argument('--graphical', help='graphical dotfiles like i3 config', action='store_true')
    group.add_argument('--terminal', help='terminal dotfiles like zsh', action='store_true')
    group.add_argument('--editor', help='editor dotfiles like vim', action='store_true')

    group = parser.add_argument_group('output')
    group.add_argument('--print', help='only print link command', action='store_true')
    group.add_argument('--verbose', help='show output', action='store_true')

    parser.add_argument('--check', help='check if link allready set', action='store_true')

    args = parser.parse_args()
    return args


def get_links():
    links = {}

    if args.graphical:
        graphical_dir = os.path.join(SCRIPT_DIR, 'graphical')
        links = dict(list(links.items()) + list(get_links_from_dir(graphical_dir).items()))

    if args.terminal:
        terminal_dir = os.path.join(SCRIPT_DIR, 'terminal')
        links = dict(list(links.items()) + list(get_links_from_dir(terminal_dir).items()))

    if args.editor:
        editor_dir = os.path.join(SCRIPT_DIR, 'editor')
        links = dict(list(links.items()) + list(get_links_from_dir(editor_dir).items()))

    return links


def get_links_from_dir(dir_path):
    links = {}
    for item in os.listdir(dir_path):
        source_file = os.path.join(dir_path, os.path.basename(item))
        dest_file = os.path.join(USER_HOME_DIR, os.path.basename(item))

        if not args.check or (args.check and not os.path.islink(dest_file)):
            links[source_file] = dest_file

    return links


def print_link():
    links = get_links()

    for key, value in links.items():
        print('ln -s ' + key + ' ' + value)


def link_files():
    links = get_links()

    for key, value in links.items():
        if args.verbose:
            print('linking ' + key + ' to ' + value)
        os.symlink(key, value)


if __name__ == "__main__":
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    USER_HOME_DIR = os.path.expanduser('~')

    args = create_arguments()

    if args.print:
        print_link()
    else:
        link_files()
