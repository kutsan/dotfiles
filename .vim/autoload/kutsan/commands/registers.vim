""
" Display the contents of all registers in vertical split like `:registers`.
"
" command! Registers call kutsan#commands#registers#()
""
function! kutsan#commands#registers#() abort
	let l:buffercurrent = @%
	let l:bufferalternate = @#

	vertical botright 50new

	let l:registers = [
		\ { 'type': 'Special', 'tokens': ['"', '*', '+', '-'] },
		\ { 'type': 'Read-only', 'tokens': ['.', '%', '#', '/', ':'] },
		\ { 'type': 'Numbered', 'tokens': map(range(0, 9), 'string(v:val)') },
		\ { 'type': 'Named', 'tokens': map(range(97, 97 + 25), 'nr2char(v:val)') }
	\ ]

	for l:registergroup in l:registers
		call append(line('$'), l:registergroup.type . ':')

		for l:token in l:registergroup.tokens
			try
				if l:token ==# '%'
					let l:tokenvalue = l:buffercurrent
				elseif l:token ==# '#'
					let l:tokenvalue = l:bufferalternate
				else
					let l:tokenvalue = eval('@' . l:token)[:&columns]
				endif

				if empty(l:tokenvalue)
					continue
				endif

				call append(line('$'), printf(' %s: %s', l:token, l:tokenvalue))
			catch

			endtry
		endfor

		call append(line('$'), '')
	endfor

	setlocal nonumber norelativenumber
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nomodifiable
	setlocal nowrap
	setlocal nofoldenable
	setlocal statusline=Registers

	syntax clear

	syntax match registersType /\v\c^[A-Za-z-]*/ contained
	syntax match registersTypeColon /\v\c^[A-Za-z-]*:/ contains=registersType
	highlight default link registersType Title
	highlight default link registersTypeColon NonText

	syntax match registersToken /\v\c^\s./ contained
	syntax match registersTokenColon /\v\c^\s.:/ contains=registersToken
	highlight default link registersToken Label
	highlight default link registersTokenColon NonText
endfunction
