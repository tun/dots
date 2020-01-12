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

function! GetGitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatusGitBranch()
	let l:branchname = GetGitBranch()
	return strlen(l:branchname) > 0?' '.l:branchname.' ':''
endfunction

function! StatusReadonly()
	return (&readonly || !&modifiable) ? '' : ''
endfunction

function! StatusPaste()
	return (&paste) ? 'PASTE' : ''
endfunction

function! StatusWorkingDir()
	return fnamemodify(getcwd(), ':t')
endfunction

function! BuildStatusLine()
	let statusline=''
	let statusline.='%#CursorLineNr#'
	let statusline.=' %{toupper(g:currentmode[mode()])}'
	let statusline.='%#LineNr#'
	let statusline.=' %{StatusReadonly()}'
	let statusline.=' %{StatusPaste()}'
	let statusline.=' %M'
	let statusline.=' %t'
	let statusline.='%='
	let statusline.=' %l:%c'
	let statusline.=' %Y'
	let statusline.='%#CursorLineNr#'
	let statusline.=' %{StatusWorkingDir()}'
	let statusline.=' %{StatusGitBranch()}'
	let statusline.=' %='
	return statusline
endfunction

set statusline=%!BuildStatusLine()
set showcmd
set noshowmode
set noruler
set laststatus=2
" }}}
