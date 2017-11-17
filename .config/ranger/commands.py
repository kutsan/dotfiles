import os
from ranger.api.commands import Command
from ranger.core.loader import CommandLoader

class fzf_select(Command):
	"""
	:fzf_select

	Find a file using `fzf` with a prefix argument select only directories.
	"""

	def execute(self):
		import subprocess

		if self.quantifier:
			# Match only directories
			command="find -L . .* \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
				-o -type d -print 2>/dev/null | sed 1d | cut -b3- | fzf +m"
		else:
			# Match files and directories
			command="find -L . .* \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
				-o -print 2>/dev/null | sed 1d | cut -b3- | fzf +m"

			fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
			stdout, stderr = fzf.communicate()

			if fzf.returncode == 0:
				fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))

				if os.path.isdir(fzf_file):
					self.fm.cd(fzf_file)
				else:
					self.fm.select_file(fzf_file)

class fzf_locate(Command):
	"""
	:fzf_locate

	Find a file using `fzf` with mlocate.
	"""

	def execute(self):
		import subprocess

		if self.quantifier:
			command="locate home media | fzf --exact -i"
		else:
			command="locate / | fzf --exact -i"

		fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
		stdout, stderr = fzf.communicate()

		if fzf.returncode == 0:
			fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))

			if os.path.isdir(fzf_file):
				self.fm.cd(fzf_file)
			else:
				self.fm.select_file(fzf_file)

class reveal(Command):
	"""
	:reveal

	Present selected files in file explorer.
	"""

	def execute(self):
		self.fm.run('xdg-open .')

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
