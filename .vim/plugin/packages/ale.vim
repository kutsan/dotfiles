""
" Asynchronous lint engine for Neovim and Vim 8+.
""

scriptencoding UTF-8

" General options.
let g:ale_enabled = v:true
let g:ale_shell = &shell
let g:ale_shell_arguments = &shellcmdflag
let g:ale_command_wrapper = ''
let g:ale_set_highlights = v:false
let g:ale_set_signs = has('signs')
let g:ale_max_signs = -1
let g:ale_maximum_file_size = v:null
let g:ale_pattern_options = v:null
let g:ale_pattern_options_enabled = v:false
let g:ale_cache_executable_check_failures = v:false
let g:ale_warn_about_trailing_blank_lines = v:true
let g:ale_warn_about_trailing_whitespace = v:false
let g:ale_set_balloons = v:false
let g:ale_set_balloons_legacy_echo = v:null

" Completion options.
let g:ale_completion_enabled = v:false
let g:ale_completion_delay = 100
let g:ale_completion_excluded_words = []
let g:ale_completion_max_suggestions = 10

" Fixer options.
let g:ale_fixers = {
	\ 'html': ['prettier'],
	\ 'css': ['prettier', 'stylelint'],
	\ 'sass': ['prettier'],
	\ 'javascript': ['eslint', 'prettier'],
	\ 'javascriptreact': ['eslint', 'prettier'],
	\ 'json': ['prettier'],
	\ 'graphql': ['prettier'],
	\ 'markdown': ['prettier']
\ }
let g:ale_fix_on_save = v:false

" Linter options.
" let g:ale_linters = {}
let g:ale_lint_delay = 200
let g:ale_lint_on_enter = v:true
let g:ale_lint_on_filetype_changed = v:true
let g:ale_lint_on_insert_leave = v:true
let g:ale_lint_on_save = v:true
let g:ale_lint_on_text_changed = 'normal'
let g:ale_linter_aliases = {
	\ 'Dockerfile': 'dockerfile',
	\ 'zsh': 'sh'
\ }
let g:ale_linters_explicit = v:false
let g:ale_linters_ignore = {}
let g:ale_lsp_root = {}
let g:ale_type_map = {}

" Error preview options.
let g:ale_cursor_detail = v:false
let g:ale_close_preview_on_insert = v:true
let g:ale_keep_list_window_open = v:false
let g:ale_list_vertical = v:false
let g:ale_list_window_size = 10
let g:ale_loclist_msg_format = ' %linter%: %s (%severity%)'
let g:ale_open_list = v:false
let g:ale_set_loclist = v:true
let g:ale_set_quickfix = v:false
let g:ale_echo_cursor = v:false
let g:ale_echo_delay = 10
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = ' %linter%: %s (%severity%)'
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_use_global_executables = v:null
let g:ale_virtualenv_dir_names = ['.env', '.venv', 'env', 've-py3', 've', 'virtualenv', 'venv']

" History options.
let g:ale_history_enabled = v:false
let g:ale_history_log_output = v:false
let g:ale_max_buffer_history_size = 10

" Virtual text options.
let g:ale_virtualtext_cursor = v:true
let g:ale_virtualtext_delay = 10
let g:ale_virtualtext_prefix = '  '

" Sign column options.
let g:ale_change_sign_column_color = v:false
let g:ale_sign_column_always = v:true
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = g:ale_sign_warning
let g:ale_sign_offset = 1000000
let g:ale_sign_style_error = g:ale_sign_error
let g:ale_sign_style_warning = g:ale_sign_warning

" Define mappings.
nmap <LocalLeader>f <Plug>(ale_fix)
nmap [f <Plug>(ale_previous)
nmap ]f <Plug>(ale_next)
