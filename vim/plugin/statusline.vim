" vim: nocp fen fdm=marker fdl=1 tw=78 cc=78 noet
" Statusline {{{
let g:currentmode={
			\ 'n'      : 'Normal',
			\ 'no'     : 'N·Operator Pending',
			\ 'v'      : 'Visual',
			\ 'V'      : 'V·Line',
			\ ''     : 'V·Block',
			\ 's'      : 'Select',
			\ 'S'      : 'S·Line',
			\ '^S'     : 'S·Block',
			\ 'i'      : 'Insert',
			\ 'R'      : 'Replace',
			\ 'Rv'     : 'V·Replace',
			\ 'c'      : 'Command',
			\ 'cv'     : 'Vim Ex',
			\ 'ce'     : 'Ex',
			\ 'r'      : 'Prompt',
			\ 'rm'     : 'More',
			\ 'r?'     : 'Confirm',
			\ '!'      : 'Shell',
			\ 't'      : 'Terminal'
			\}"
function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?' '.l:branchname.' ':''
endfunction
function! StatusReadonly()
	return (&readonly || !&modifiable) ? '' : ''
endfunction
function! StatusPaste()
	return (&paste) ? 'PASTE' : ''
endfunction
function! StatusBuffers()
  return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction
set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=\ %{StatusReadonly()}
set statusline+=\ %{StatusPaste()}
set statusline+=\%M
set statusline+=\ %{StatusBuffers()}:%n
set statusline+=\ %t
set statusline+=%=
set statusline+=\ %l:%c
set statusline+=\ %Y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\/%{&ff}
set statusline+=\ %{StatuslineGit()}
set statusline+=\ %=
set showcmd
set noshowmode
set noruler
set laststatus=2
" }}}
