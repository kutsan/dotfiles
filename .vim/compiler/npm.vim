if exists('b:current_compiler')
	finish
endif

let b:current_compiler = 'npm'

CompilerSet makeprg=npm\ start
CompilerSet errorformat&
