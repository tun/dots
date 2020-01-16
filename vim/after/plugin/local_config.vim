" Local machine configuration {{{
if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif

if isdirectory(glob("$HOME/.vim_local"))
	for f in split(glob("$HOME/.vim_local/*.vim"))
		exec 'source' f
	endfor
endif
" }}}
