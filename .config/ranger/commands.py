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
			| fzf --no-multi --exact --height='100%'"

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

	Find a file by using `fzf` with mlocate.
	"""

	def execute(self):
		import subprocess

		command="locate / | fzf --no-multi --exact --height='100%'"

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

		command="fasd -l -d | fzf --exact --tac --no-sort --prompt='jump ' --height='100%'"

		fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
		stdout, stderr = fzf.communicate()

		if fzf.returncode == 0:
			fzf_file = os.path.abspath(stdout.decode('UTF-8').rstrip('\n'))

			if os.path.isdir(fzf_file):
				self.fm.cd(fzf_file)
			else:
				self.fm.select_file(fzf_file)
