import os
from ranger.api.commands import Command
from ranger.core.loader import CommandLoader

class select(Command):
    """
    :select

    Select a file or a directory under current working directory with `find` and `fzf`.
    """

    def execute(self):
        import subprocess

        command=" \
            rg . \
                --files \
                --no-messages \
                --no-ignore \
                --hidden \
                --follow \
                --smart-case \
                --glob '!\.git' \
                --glob '!node_modules' \
            | fzf \
                --exact \
                --no-multi \
                --no-mouse \
                --height='100%' \
                --layout='reverse' \
                --margin='2,6' \
                --prompt='select ' \
                --no-bold \
                --preview-window='bottom:60%' \
                --preview=' \
                    if [ -d {} ]; then; \
                        ls -l --si --almost-all --classify --color=always --group-directories-first --literal {} 2>/dev/null; \
                    else \
                        cat {} 2>/dev/null; \
                    fi \
                ' \
        " \

        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()

        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('UTF-8').rstrip('\n'))

            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

class locate(Command):
    """
    :locate

    Find a file system-wide with `ripgrep` and `fzf`.
    """

    def execute(self):
        import subprocess

        command=" \
            rg / \
                --files \
                --no-messages \
                --no-ignore \
                --hidden \
                --follow \
                --smart-case \
                --glob '!\.git' \
                --glob '!node_modules' \
            | fzf \
                --exact \
                --no-multi \
                --no-mouse \
                --height='100%' \
                --layout='reverse' \
                --margin='2,6' \
                --prompt='locate ' \
                --no-bold \
                --preview-window='bottom:60%' \
                --preview='cat {} 2>/dev/null' \
        " \

        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()

        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('UTF-8').rstrip('\n'))

            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)
