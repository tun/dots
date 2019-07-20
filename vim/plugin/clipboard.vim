" vim: nocp fen fdm=marker fdl=1 tw=78 cc=78 noet
" Clipboard {{{
if has("unix") && has("clipboard")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		set clipboard=unnamed
	elseif s:uname == "Linux\n"
		set clipboard=unnamedplus
	endif
endif
" }}}
