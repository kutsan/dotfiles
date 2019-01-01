""
" Asynchronous lint engine for Neovim and Vim 8+.
""

scriptencoding UTF-8

" Always keep sign column open even there is no error remain.
let g:ale_sign_column_always = v:true

" Number of milliseconds before sending completion signal.
let g:ale_completion_delay = 2000

" Number of milliseconds before start linting.
let g:ale_lint_delay = 300

" The sign for errors in the sign gutter.
let g:ale_sign_error = '•'

" The sign for warnings in the sign gutter.
let g:ale_sign_warning = '•'

" The string used for error severity in the echoed message.
let g:ale_echo_msg_error_str = 'E'

" The string used for warning severity in the echoed message.
let g:ale_echo_msg_warning_str = 'W'

" Define the form of the echoed message.
let g:ale_echo_msg_format = ' %linter%: %s (%severity%)'

" Disable highlighting underline on errors and warnings.
let g:ale_set_highlights = v:false

" Completely disable warnings using echo.
let g:ale_echo_cursor = v:false

" Show warnings using virtual text feature of neovim.
let g:ale_virtualtext_cursor = v:true

" Set virtual text warning prefix.
let g:ale_virtualtext_prefix = '  '

" Define fixers for 'ALEFix' command.
let g:ale_fixers = {
	\ 'html': ['prettier'],
	\ 'css': ['prettier', 'stylelint'],
	\ 'sass': ['prettier'],
	\ 'javascript': ['eslint', 'prettier'],
	\ 'javascript.jsx': ['eslint', 'prettier'],
	\ 'json': ['prettier'],
	\ 'graphql': ['prettier'],
	\ 'markdown': ['prettier']
\ }

" Define mappings.
nmap <LocalLeader>f <Plug>(ale_fix)
