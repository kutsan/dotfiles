" Automatically install vim-plug itself if it's not installed.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl
		\ --fail
		\ --location
		\ --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		\ --output
		\ ~/.vim/autoload/plug.vim

	augroup vimplugselfinstallation
		autocmd!
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	augroup end
endif
