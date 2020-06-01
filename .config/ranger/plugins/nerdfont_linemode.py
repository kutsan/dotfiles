# -*- coding: UTF-8 -*-

import ranger.api
from ranger.core.linemode import LinemodeBase
import re
import os

file_node_extensions = {
                   'styl': '',
                   'scss': '',
                   'html': '',
                   'slim': '',
                    'css': '',
                     'md': '',
                   'json': '',
                     'js': '',
                    'jsx': '',
                     'rb': '',
                    'php': '',
                     'py': '',
                    'pyc': '',
                    'pyo': '',
                    'pyd': '',
                 'coffee': '',
               'mustache': '',
                    'hbs': '',
                   'conf': '',
                    'ini': '',
                    'yml': '',
                    'bat': '',
                    'jpg': '',
                   'jpeg': '',
                    'bmp': '',
                    'png': '',
                    'gif': '',
                    'ico': '',
                    'svg': '',
                   'twig': '',
                    'cpp': '',
                    'c++': '',
                    'cxx': '',
                     'cc': '',
                     'cp': '',
                      'c': '',
                     'hs': '',
                    'lhs': '',
                    'lua': '',
                   'java': '',
                     'sh': '',
                   'fish': '',
                     'ml': 'λ',
                    'mli': 'λ',
                   'diff': '',
                     'db': '',
                    'sql': '',
                   'dump': '',
                    'clj': '',
                   'cljc': '',
                   'cljs': '',
                    'edn': '',
                  'scala': '',
                     'go': '',
                   'dart': '',
                    'xul': '',
                    'sln': '',
                    'suo': '',
                     'pl': '',
                     'pm': '',
                      't': '',
                    'rss': '',
                     'f#': '',
               'fsscript': '',
                    'fsx': '',
                     'fs': '',
                    'fsi': '',
                     'rs': '',
                   'rlib': '',
                      'd': '',
                    'erl': '',
                    'hrl': '',
                    'vim': '',
                  'vimrc': '',
                     'ai': '',
                    'psd': '',
                    'psb': '',
                     'ts': '',
                     'jl': '',
                     'rc': '',
                    'xml': '',
                    'log': '',
                    'avi': '',
                   'mpeg': '',
                    'mpg': '',
                    'mkv': '',
                    'flv': '',
                    'mp4': '',
                    'mp3': '',
                   'flac': '',
                    'wav': '',
                    'ogg': '',
                   'epub': '',
                    'pdf': '',
                     '7z': '',
                    'apk': '',
                    'bz2': '',
                    'cab': '',
                   'cpio': '',
                    'deb': '',
                    'gem': '',
                     'gz': '',
                   'gzip': '',
                    'lha': '',
                    'lzh': '',
                   'lzma': '',
                    'rar': '',
                    'rpm': '',
                    'tar': '',
                    'tgz': '',
                     'xz': '',
                    'zip': ''
}

dir_node_exact_matches = {
                '.config': '',
                   '.git': '',
                 '.gnupg': '',
                  '.mutt': '',
              '.newsboat': '',
                   '.npm': '',
                   '.ssh': '',
                  '.tmux': '',
                 '.Trash': '',
                   '.vim': '',
                   '.zsh': '',
                'Desktop': '',
              'Documents': '',
              'Downloads': '',
               'Pictures': '',
               'Projects': '',
}

file_node_exact_matches = {
           'gruntfile.js': '',
            'gulpfile.js': '',
                'dropbox': '',
              '.DS_Store': '',
             '.gitconfig': '',
             '.gitignore': '',
                '.bashrc': '',
           '.bashprofile': '',
            'favicon.ico': '',
                'LICENSE': '',
           'node_modules': '',
               'procfile': '',
             '.Xdefaults': '',
            '.Xresources': '',
                  '.dmrc': '',
             '.gitconfig': '',
               '.profile': '',
         '.recently-used': '',
       '.selected_editor': '',
              '.xinputrc': '',
          'mimeapps.list': '',
         'user-dirs.dirs': '',
                    'ini': '',
                 'config': ''
}

def get_icon(file):
    if file.is_directory:
        return dir_node_exact_matches.get(file.relative_path, '')

    return file_node_exact_matches.get(file.relative_path, file_node_extensions.get(file.extension, ''))

@ranger.api.register_linemode
class NerdFontLinemodeFilename(LinemodeBase):
    name = 'filename'

    def filetitle(self, fobj, metadata):
        return f' {get_icon(fobj)} {fobj.relative_path}'
