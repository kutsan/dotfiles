# kutsan's dotfiles

![screenshot](./.github/screenshot.png?raw=true)

> running **neovim** inside **tmux** that is inside **kitty** terminal emulator with **furacode** font on

## Overview

- [zsh](https://github.com/zsh-users/zsh) - Highly customizable interactive login shell and command interpreter for shell scripting
	- [pure](https://github.com/sindresorhus/pure) - Minimal and fast Zsh prompt with asynchronous git fetch
	- [autopair](https://github.com/hlissner/zsh-autopair) - Auto-close and delete matching delimiters
	- [system-clipboard](https://github.com/kutsan/zsh-system-clipboard) - Synchronize ZLE clipboard buffer with system clipboard
	- [syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Fish-like syntax highlighting support for interactive terminal
	- [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like auto-suggestions for interactive terminal based on command history
- [neovim](https://github.com/neovim/neovim) - The fork of ubiquitous text editor focused on extensibility and usability
	- [iceberg](https://github.com/cocopon/iceberg.vim) - Color scheme
	- [ale](https://github.com/w0rp/ale) - Asynchronous lint engine for Neovim and Vim 8+
	- [coc](https://github.com/neoclide/coc.nvim) - Context-aware completion engine
	- [emmet](https://github.com/mattn/emmet-vim) - Emmet integration
	- [defx](https://github.com/Shougo/defx.nvim) - File explorer
	- [defx-icons](https://github.com/kristijanhusak/defx-icons) - Icon columm support for defx
	- [fugitive](https://github.com/tpope/vim-fugitive) - Git client
	- [fzf](https://github.com/junegunn/fzf.vim) - Fuzzy finder fzf as plugin
	- [peartree](https://github.com/tmsvg/pear-tree) - Auto-pair plugin that supports multi-character pairs and intelligent matching
	- [polyglot](https://github.com/sheerun/vim-polyglot) - Big collection of language packs as scripts are loaded only on demand
	- [sandwich](https://github.com/machakann/vim-sandwich) - The set of operator and text object plugins to search, select, edit sandwiched text objects
	- [signify](https://github.com/mhinz/vim-signify) - Show Git diff in the sign column
	- [targets](https://github.com/wellle/targets.vim) - Additional various text objects
	- [undotree](https://github.com/mbbill/undotree) - Visualize undo tree
	- [wordmotion](https://github.com/chaoren/vim-wordmotion) - Enchant default basic word motions
- [git](https://git-scm.com) - Version control system for tracking changes in files and coordinating the work
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer enables working with split panes, tabs and detachable sessions
- [nodejs](https://nodejs.org) - JavaScript runtime environment for developing a diverse variety of applications
	- [npm](https://www.npmjs.com) - Node Package Manager mainly for the JavaScript programming language
		- [eslint](https://github.com/eslint/eslint) - AST-based JavaScript linter for identifying and reporting on patterns
		- [prettier](https://github.com/prettier/prettier) - Opinionated code formatter
		- [stylelint](https://github.com/stylelint/stylelint) - CSS linter
		- [ngrok](https://github.com/bubenshchykov/ngrok) - Proxy-like tunneling service to expose localhost to the web
		- [browser-sync](https://github.com/BrowserSync/browser-sync) - Improve web workflow with auto-reload, interaction sync and more
		- [neovim-node-client](https://github.com/neovim/node-client) - Neovim Node support for plugins
		- [trash-cli](https://github.com/sindresorhus/trash-cli) - Move files and folders to the trash
		- [authcli](https://github.com/sam3d/auth) - Two-factor authentication token manager
		- [clipboard-cli](https://github.com/sindresorhus/clipboard-cli) - Cross-platform clipboard wrapper
		- [fx](https://github.com/antonmedv/fx) - TUI JSON viewer
		- [bitwarden](https://github.com/bitwarden/cli) - Password manager
- [python](https://www.python.org) - High-level programming language for general-purpose programming
- [coreutils](https://www.gnu.org/software/coreutils/coreutils.html) - GNU core utilities for basic file, shell and text manipulation
- [findutils](https://www.gnu.org/software/findutils) - GNU basic directory searching utilities that provides find, locate and xargs
- [less](http://www.greenwoodsoftware.com/less) - Standard file pager for Unix-like systems
- [curl](https://github.com/curl/curl) - Tool for transferring data using various protocols
- [wget](https://www.gnu.org/software/wget) - Tool for retrieving files using the most widely-used Internet protocols
- [gnupg](https://www.gnupg.org) - Hybrid-encryption software suit, free implementation of the OpenPGP standard
- [nmap](https://github.com/nmap/nmap) - Network security scanner and mapper for exploration and security auditing
- [openssl](https://github.com/openssl/openssl) - Toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols
- [openssh](https://www.openssh.com) - Connectivity tool for remote login with the SSH protocol
- [rsync](https://rsync.samba.org) - Utility that provides fast incremental file transfer
- [fzf](https://github.com/junegunn/fzf) - General-purpose fuzzy finder that can be used among other Unix tools
- [ranger](https://github.com/ranger/ranger) - Text-based file system manager for the console with Vim-like key bindings
	- [exiftool](http://www.sno.phy.queensu.ca/~phil/exiftool) - Read, write and edit meta information in a wide variety of media files
- [asciinema](https://github.com/asciinema/asciinema) - Record and share terminal sessions as text-based colored format
- [vint](https://github.com/Kuniwak/vint) - Extensible, high performance Vimscript linter and analysis tool
- [stig](https://github.com/rndusr/stig) - TUI and CLI interface for transmission-daemon
- [terminal-colors](https://github.com/eikenb/terminal-colors) - Test utility for color capabilities of terminal
- [grip](https://github.com/joeyespo/grip) - Preview Markdown files in local server
- [trackma](https://github.com/z411/trackma) - Multi-site anime, manga list manager
- [flexget](https://github.com/Flexget/Flexget) - Multipurpose automation tool for all of media.
	- [transmissionrpc](https://pypi.org/project/transmissionrpc) - Python module implementing the json-rpc client protocol for transmission
	- [python-telegram-bot](https://github.com/python-telegram-bot/python-telegram-bot) - Python wrapper of Telegram Bot API
- [htop](https://github.com/hishamhm/htop) - Interactive text-based system monitor, process viewer and process manager
- [newsboat](https://github.com/newsboat/newsboat) - RSS/Atom feed reader
- [neomutt](https://github.com/neomutt/neomutt) - Fork of the mail user agent mutt with new features and patches
	- [msmtp](http://msmtp.sourceforge.net) - SMTP agent for sending e-mails through mail user agents or terminal
- [ncdu](https://dev.yorhel.nl/ncdu) - Disk usage analyzer for quickly finding big files with ncurses interface
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Line oriented search tool similar to grep that combines the usability of ag
- [ffmpeg](https://github.com/FFmpeg/FFmpeg) - Cross-platform solution to handle, record, convert and stream audio and video
- [transmission-cli](https://github.com/transmission/transmission) - BitTorrent client and daemon with web UI for remote controlling
- [syncthing](https://github.com/syncthing/syncthing) - Continuous file synchronization utility
- [tidy-html5](https://github.com/htacg/tidy-html5) - HTML linter with support for modern web standards
- [par](https://github.com/sergi/par) - Paragraph reformatter and aligner for e-mails and plain text
- [bind](https://source.isc.org/cgi-bin/gitweb.cgi) - Domain Name System tools
- [sdcv](https://github.com/Dushistov/sdcv) - StarDict command-line version, offline directories
- [gcal](https://www.gnu.org/software/gcal) - Calculate and print calendars
- [fasd](https://github.com/clvv/fasd) - Track your most used directories, based on frequency for quick access later
- [mpv](https://github.com/mpv-player/mpv) - Minimalist video player based on MPlayer
- [bat](https://github.com/sharkdp/bat) - A cat clone with additional features like git integration and syntax highlighting
- [universal-ctags](https://github.com/universal-ctags/ctags) - A maintained ctags implementation
- [wireguard](https://github.com/WireGuard/wireguard-go) - Virtual Private Network protocol to create secure point-to-point connections
- [ledger](https://github.com/ledger/ledger) - Double-entry accounting system with a command-line reporting interface
- [hledger](https://github.com/simonmichael/hledger) - Haskell implementation of ledger with curses interface and more features
- [gnuplot](https://github.com/gnuplot/gnuplot) - Command-line driven graphing utility

## License

GPL-3.0
