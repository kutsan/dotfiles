" Start profiling until it's invoked with ! modifier once again.
command -bang Profile call kutsan#commands#profile#(<bang>v:false)

" Display the contents of all registers in vertical split like `:registers`.
command Registers call kutsan#commands#registers#()

" Search text in git repository or current working directory.
command -nargs=1 -bang Search call kutsan#commands#search#(<bang>v:false, <args>)
