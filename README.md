<img width="100" src="https://github.com/kutsan/dotfiles/raw/master/.github/assets/logo.png" alt="Logo" />

# kutsan's dotfiles

[![luacheck](https://github.com/kutsan/dotfiles/actions/workflows/luacheck.yml/badge.svg)](https://github.com/kutsan/dotfiles/actions/workflows/luacheck.yml)

![neovim screenshot](https://user-images.githubusercontent.com/10108377/140420895-a3ed425b-e19f-4970-b0b5-9d25eec3fbe7.png)

| ![lf screenshot](https://user-images.githubusercontent.com/10108377/140654098-bafadfdf-76d9-43ac-87b9-e42308ea11a3.png) | ![zsh screenshot](https://user-images.githubusercontent.com/10108377/140654211-2bd25f1a-2677-4cf7-ab2e-d043e65e40e5.png) | ![fzf screenshot](https://user-images.githubusercontent.com/10108377/140654357-1bc87a9c-b395-458c-81d4-ce992c589fac.png) |
| ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------ |

## Overview

- [`zsh`](https://github.com/zsh-users/zsh) - Highly customizable interactive login shell and command interpreter for shell scripting
  - [`pure`](https://github.com/kutsan/pure) - Minimal and fast Zsh prompt with asynchronous git fetch
  - [`autopair`](https://github.com/hlissner/zsh-autopair) - Auto-close and delete matching delimiters
  - [`system-clipboard`](https://github.com/kutsan/zsh-system-clipboard) - Synchronize ZLE clipboard buffer with system clipboard
  - [`fast-syntax-highlighting`](https://github.com/kutsan/fast-syntax-highlighting) - Fish-like syntax highlighting support for interactive terminal
  - [`autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like auto-suggestions for interactive terminal based on command history
- [`neovim`](https://github.com/neovim/neovim) - The fork of ubiquitous text editor focused on extensibility and usability
  - [`autopairs`](https://github.com/windwp/nvim-autopairs) - Auto pair plugin
  - [`catppuccin`](https://github.com/catppuccin/nvim) - Color scheme
  - [`cmp`](https://github.com/hrsh7th/nvim-cmp) - Auto completion support
    - [`cmp-buffer`](https://github.com/hrsh7th/cmp-buffer) - cmp source for buffer words
    - [`cmp-calc`](https://github.com/hrsh7th/cmp-calc) - cmp source for math calculation
    - [`cmp-cmdline`](https://github.com/hrsh7th/cmp-cmdline) - cmp source for cmdline
    - [`cmp-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp) - cmp source for LSP client
    - [`cmp-lsp-signature-help`](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help) - cmp source for LSP signatures
    - [`cmp-luasnip`](https://github.com/saadparwaiz1/cmp_luasnip) - cmp source for luasnip snippets
    - [`cmp-path`](https://github.com/hrsh7th/cmp-path) - cmp source for filesystem paths
  - [`colorizer`](https://github.com/norcalli/nvim-colorizer.lua) - High-performance color highlighter
  - [`copilot`](https://github.com/zbirenbaum/copilot.lua) - GitHub Copilot client
  - [`diffview`](https://github.com/sindrets/diffview.nvim) - Single tabpage interface for all modified files in git
  - [`dressing`](https://github.com/stevearc/dressing.nvim) - Improve default vim.ui interfaces
  - [`fugitive`](https://github.com/tpope/vim-fugitive) - Git client
  - [`fzf-lua`](https://github.com/ibhagwan/fzf-lua) - Lua implementation of fuzzy finder fzf plugin
  - [`gitsigns`](https://github.com/lewis6991/gitsigns.nvim) - Asynchronous git diff in sign column
  - [`lspconfig`](https://github.com/neovim/nvim-lspconfig) - Quickstart configurations for the neovim LSP client
    - [`diagnostic-language-server`](https://github.com/iamcco/diagnostic-languageserver) - General purpose language server that integrate with linters
    - [`typescript-language-server`](https://github.com/theia-ide/typescript-language-server) - TypeScript & JavaScript Language Server
    - [`css-language-server`](https://github.com/vscode-langservers/vscode-css-languageserver-bin) - CSS Language Server
    - [`html-language-server`](https://github.com/vscode-langservers/vscode-html-languageserver-bin) - HTML Language Server
    - [`json-language-server`](https://github.com/vscode-langservers/vscode-json-languageserver) - JSON Language Server
    - [`lua-language-server`](https://github.com/sumneko/lua-language-server) - Lua Language Server
  - [`luasnip`](https://github.com/L3MON4D3/LuaSnip) - High-performance snippet engine
  - [`null-ls`](https://github.com/jose-elias-alvarez/null-ls.nvim) - Use langauge server to inject diagnostics, formatter etc.
  - [`nvim-tree`](https://github.com/kyazdani42/nvim-tree.lua) - File explorer
  - [`nvim-web-devicons`](https://github.com/kyazdani42/nvim-web-devicons) - Nerd Font icon API support
  - [`plenary`](https://github.com/nvim-lua/plenary.nvim) - Asynchronous modules using coroutines
  - [`schema-store`](https://github.com/b0o/SchemaStore.nvim) - Access to the SchemaStore catalog for JSON langauge server
  - [`surround`](https://github.com/kylechui/nvim-surround) - Add, change and delete surrounding delimiter pairs
  - [`treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) - Neovim plugin of an incremental parsing system for programming tools
  - [`treesitter-context`](https://github.com/nvim-treesitter/nvim-treesitter-context) - Show code context using treesitter
  - [`undotree`](https://github.com/mbbill/undotree) - Visualize undo tree
- [`git`](https://git-scm.com) - Version control system for tracking changes in files and coordinating the work
- [`node`](https://nodejs.org) - JavaScript runtime environment for developing a diverse variety of applications
  - [`npm`](https://www.npmjs.com) - Node Package Manager mainly for the JavaScript programming language
    - [`fx`](https://github.com/antonmedv/fx) - TUI JSON viewer
    - [`bitwarden`](https://github.com/bitwarden/cli) - Password manager
    - [`eslint_d`](https://github.com/mantoni/eslint_d.js) - Run ESLint as a daemon
    - [`prettierd`](https://github.com/fsouza/prettierd) - Run Prettier as a daemon
- [`lua@5.1`](https://www.lua.org) - Lightweight, embeddable scripting language
  - [`luarocks`](https://luarocks.org) - Package manager for Lua modules
    - [`luacheck`](https://github.com/mpeterv/luacheck) - Linting and static analysis of Lua code
- [`rust`](https://www.rust-lang.org) - Multi-paradigm programming language designed for performance and safety
  - [`cargo`](https://crates.io) - Package manager for Rust crates
    - [`stylua`](https://github.com/johnnymorganz/stylua) - Lua formatter
- [`coreutils`](https://www.gnu.org/software/coreutils/coreutils.html) - GNU core utilities for basic file, shell and text manipulation
- [`findutils`](https://www.gnu.org/software/findutils) - GNU basic directory searching utilities that provides find, locate and xargs
- [`less`](http://www.greenwoodsoftware.com/less) - Standard file pager for Unix-like systems
- [`tar`](https://www.gnu.org/software/tar) - File archiver
- [`gzip`](https://www.gnu.org/software/gzip) - Data compression utility
- [`sed`](https://www.gnu.org/software/sed) - Non-interactive command-line text editor
- [`gnupg`](https://www.gnupg.org) - Hybrid-encryption software suit, free implementation of the OpenPGP standard
- [`nmap`](https://github.com/nmap/nmap) - Network security scanner and mapper for exploration and security auditing
- [`openssl`](https://github.com/openssl/openssl) - Toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols
- [`openssh`](https://www.openssh.com) - Connectivity tool for remote login with the SSH protocol
- [`fzf`](https://github.com/junegunn/fzf) - General-purpose fuzzy finder that can be used among other Unix tools
- [`htop`](https://github.com/hishamhm/htop) - Interactive text-based system monitor, process viewer and process manager
- [`ffmpeg`](https://github.com/FFmpeg/FFmpeg) - Cross-platform solution to handle, record, convert and stream audio and video
- [`lf`](https://github.com/gokcehan/lf) - Terminal file manager with vim-like key bindings
  - [`exiftool`](http://www.sno.phy.queensu.ca/~phil/exiftool) - Read, write and edit meta information in a wide variety of media files
- [`transmission`](https://github.com/transmission/transmission) - BitTorrent client and daemon with web UI for remote controlling
- [`bind`](https://source.isc.org/cgi-bin/gitweb.cgi) - Domain Name System tools
- [`gcal`](https://www.gnu.org/software/gcal) - Calculate and print calendars
- [`mpv`](https://github.com/mpv-player/mpv) - Minimalist video player based on MPlayer
- [`wireguard`](https://github.com/WireGuard/wireguard-go) - Virtual Private Network protocol to create secure point-to-point connections
- [`ledger`](https://github.com/ledger/ledger) - Double-entry accounting system with a command-line reporting interface
- [`oath-toolkit`](https://www.nongnu.org/oath-toolkit) - Provides components for building one-time password authentication systems
- [`gptfdisk`](https://www.rodsbooks.com/gdisk) - Interactive GUID partition table (GPT) manipulator
- [`colima`](https://github.com/abiosoft/colima) - Container runtime support for macOS

## License

GPL-3.0
