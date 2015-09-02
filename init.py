import argparse
import os


def create_arguments():
    parser = argparse.ArgumentParser(description='init script for dotfiles')

    group = parser.add_argument_group('category')
    group.add_argument('--graphical', help='graphical dotfiles like i3 config', action='store_true')
    group.add_argument('--terminal', help='terminal dotfiles like zsh', action='store_true')
    group.add_argument('--editor', help='editor dotfiles like vim', action='store_true')
    group.add_argument('--tools', help='configfiles for tools like ssh', action='store_true')
    group.add_argument('--fonts', help='fonts for user', action='store_true')
    group.add_argument('--bin', help='binaries/scripts', action='store_true')
    group.add_argument('--jetbrains', help='jetbrains ide settings', action='store_true')

    group = parser.add_argument_group('output')
    group.add_argument('--print', help='only print link command', action='store_true')
    group.add_argument('--verbose', help='show output', action='store_true')

    parser.add_argument('--check', help='check if link allready set', action='store_true')
    parser.add_argument('--test', help='only test', action='store_true')

    args = parser.parse_args()
    return args


def get_links():
    current_links = {}
    current_skipped_links = {}

    links = {}
    skipped_links = {}

    if args.graphical:
        graphical_dir = os.path.join(SCRIPT_DIR, 'graphical')

        current_links, current_skipped_links = get_links_from_dir(graphical_dir, ['.config'])

        links = dict(list(links.items()) + list(current_links.items()))
        skipped_links = dict(list(skipped_links.items()) + list(current_skipped_links.items()))

        graphical_config_dir = os.path.join(SCRIPT_DIR, 'graphical', '.config')
        current_links, current_skipped_links = get_links_from_dir(graphical_config_dir, destination_dir='.config')

        links = dict(list(links.items()) + list(current_links.items()))
        skipped_links = dict(list(skipped_links.items()) + list(current_skipped_links.items()))

    if args.terminal:
        terminal_dir = os.path.join(SCRIPT_DIR, 'terminal')

        current_links, current_skipped_links = get_links_from_dir(terminal_dir)

        links = dict(list(links.items()) + list(current_links.items()))
        skipped_links = dict(list(skipped_links.items()) + list(current_skipped_links.items()))

    if args.editor:
        editor_dir = os.path.join(SCRIPT_DIR, 'editor')

        current_links, current_skipped_links = get_links_from_dir(editor_dir)

        links = dict(list(links.items()) + list(current_links.items()))
        skipped_links = dict(list(skipped_links.items()) + list(current_skipped_links.items()))

    if args.tools:
        tools_dir = os.path.join(SCRIPT_DIR, 'tools')

        current_links, current_skipped_links = get_links_from_dir(tools_dir)

        links = dict(list(links.items()) + list(current_links.items()))
        skipped_links = dict(list(skipped_links.items()) + list(current_skipped_links.items()))

    if args.fonts:
        fonts_dir = os.path.join(SCRIPT_DIR, 'fonts')

        current_links, current_skipped_links = get_links_from_dir(fonts_dir, ['.local/share/fonts'])

        links = dict(list(links.items()) + list(current_links.items()))
        skipped_links = dict(list(skipped_links.items()) + list(current_skipped_links.items()))

        font_config_dir = os.path.join(SCRIPT_DIR, 'fonts')
        current_links, current_skipped_links = get_links_from_dir(font_config_dir, destination_dir='.local/share/fonts')

        links = dict(list(links.items()) + list(current_links.items()))
        skipped_links = dict(list(skipped_links.items()) + list(current_skipped_links.items()))

    if args.bin:
        binaries_dir = os.path.join(SCRIPT_DIR, 'bin')
        current_links, current_skipped_links = get_links_from_dir(binaries_dir, destination_dir='.bin', link_subdirs=False)
        links = dict(list(links.items()) + list(current_links.items()))
        skipped_links = dict(list(skipped_links.items()) + list(current_skipped_links.items()))

    return links, skipped_links


def get_links_from_dir(dir_path, excludes=[], destination_dir=None, link_subdirs=True):
    links = {}
    skipped_links = {}

    destination_link_dir = USER_HOME_DIR

    if destination_dir != None:
        destination_link_dir = os.path.join(destination_link_dir, destination_dir)

    if link_subdirs:
        for item in os.listdir(dir_path):
            if item not in excludes:
                source_file = os.path.join(dir_path, os.path.basename(item))
                dest_file = os.path.join(destination_link_dir, os.path.basename(item))

                if not args.check or (args.check and not os.path.islink(dest_file)):
                    links[source_file] = dest_file
                else:
                    skipped_links[source_file] = dest_file
    else:
        source_file = dir_path
        dest_file = destination_link_dir

        if not args.check or (args.check and not os.path.islink(dest_file)):
            links[source_file] = dest_file
        else:
            skipped_links[source_file] = dest_file


    return links, skipped_links


def print_link():
    links, skipped_links = get_links()

    for key, value in links.items():
        print('ln -s ' + key + ' ' + value)

    for key, value in skipped_links.items():
        print('link for ' + key + ' skipped')


def link_files():
    links, skipped_links = get_links()

    for key, value in links.items():
        if args.verbose:
            print('linking ' + key + ' to ' + value)

        if not args.test:
            os.symlink(key, value)

    if args.verbose:
        for key, value in skipped_links.items():
            print('link for ' + key + ' skipped')

if __name__ == "__main__":
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    USER_HOME_DIR = os.path.expanduser('~')

    args = create_arguments()

    if args.print:
        print_link()
    else:
        link_files()
