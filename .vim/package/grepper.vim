" Search by using popular search tools repository-wise.
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" Initialize global grepper options dictionary.
let g:grepper = {}

" Extend tools.
let g:grepper = {
	\ 'rg': {
		\ 'grepprg': 'rg --with-filename --no-heading --vimgrep --smart-case --regexp'
	\ },
	\ 'git': {
		\ 'grepprg': 'git grep --line-number -I --ignore-case --perl-regexp'
	\ }
\ }

" Disable highlight found matches.
let g:grepper.highlight = 0

" Use the quickfix list for the matches.
let g:grepper.quickfix = 1

" Open the quickfix window after the grep tool finished running.
let g:grepper.open = 1

" When the quickfix window opens, switch to it.
let g:grepper.switch = 1

" Automatically jump to the first match.
let g:grepper.jump = 1

" Use the current working directory as reported by `:pwd`.
let g:grepper.dir = 'cwd'

" Only show the tool name in the prompt.
let g:grepper.simple_prompt = 1

" Define search tools and their orders.
let g:grepper.tools = ['git', 'rg']

" The prompt uses these keys to switch to the next tool.
let g:grepper.next_tool = '<Leader>g'

" Don't append matches to the current quickfix or location list.
let g:grepper.append = 0

" Quote the query automatically.
let g:grepper.prompt_quote = 2

" Define key mappings.
nnoremap <Leader>g :Grepper -tool git<Enter>
nmap gs <Plug>(GrepperOperator)
xmap gs <Plug>(GrepperOperator)
