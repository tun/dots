" Clipboard {{{
if has("unix") && has("clipboard")
	let s:uname = system("uname -s")
	if s:uname == "Darwin\n"
		set clipboard=unnamed
	elseif s:uname == "Linux\n"
		set clipboard=unnamedplus
	endif
endif
" }}}
