import os
from ranger.api.commands import Command
from ranger.core.loader import CommandLoader

class select(Command):
    """
    :select

    Find a file or a directory by using `fzf`.
    """

    def execute(self):
        import subprocess

        command="find -L . \( -fstype 'dev' -or -fstype 'proc' \) -prune -or -print 2>/dev/null \
                        | sed 1d \
                        | cut --bytes=3- \
                        | fzf --no-multi --exact --prompt='select ' --height='100%'"

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

    Find a file by using `fzf` with `ripgrep`.
    """

    def execute(self):
        import subprocess

        command="rg --files --no-messages --no-ignore --hidden --follow --smart-case --glob '!{.git,node_modules}/*' / \
            | fzf --no-multi --exact --prompt='locate ' --height='100%'"

        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()

        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('UTF-8').rstrip('\n'))

            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

class compress(Command):
    """
    :compress

    Compress marked files to current directory.
    """

    def execute(self):
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

            original_path = cwd.path
            parts = self.line.split()
            au_flags = parts[1:]

            descr = "Compressing files in: " + os.path.basename(parts[1])
            obj = CommandLoader(args=['apack'] + au_flags + \
                [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr)

            obj.signal_bind('after', refresh)
            self.fm.loader.add(obj)

        def tab(self):
            extension = ['.zip', '.tar.gz', '.rar', '.7z']
            return ['compress ' + os.path.basename(self.fm.thisdir.path) + ext for ext in extension]

class jump(Command):
    """
    :jump

    Jump to a most used directory using `fasd` and `fzf`.
    """

    def execute(self):
        import subprocess

        command="fasd -l | fzf --exact --tac --no-sort --prompt='jump ' --height='100%'"

        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()

        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('UTF-8').rstrip('\n'))

            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

class toggle_alternate_view(Command):
    """
    :toggle_alternate_view

    Enable and disable alternative column ratios.
    """

    def execute(self):
        MAIN_RATIOUS = '2,2,3,3'
        ALTERNATE_RATIOUS = '2,3'

        def get_current_column_ratios():
            return ','.join(str(e) for e in self.fm.settings['column_ratios'])

        if (self.fm.settings['viewmode'] == 'miller'):
            if (get_current_column_ratios() == MAIN_RATIOUS):
                self.fm.set_option_from_string('column_ratios', ALTERNATE_RATIOUS)
            elif (get_current_column_ratios() == ALTERNATE_RATIOUS):
                self.fm.set_option_from_string('column_ratios', MAIN_RATIOUS)
