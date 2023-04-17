if exists('g:tun_statusline_loaded')
	finish
endif

let g:tun_statusline_loaded = 1

if !exists('g:tun_statusline')
	finish
endif

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

function! StatusReadonly()
	return (&readonly || !&modifiable) ? '' : ''
endfunction

function! StatusPaste()
	return (&paste) ? 'PASTE' : ''
endfunction

function! StatusWorkingDir()
	return fnamemodify(getcwd(), ':t')
endfunction

function! StatusLineColors()
	highlight StatusLine ctermfg=13 ctermbg=8 cterm=bold,italic
	highlight CurrentMode ctermfg=0 ctermbg=8 cterm=none
	highlight CurrentProject ctermfg=12 ctermbg=8 cterm=bold,italic
	highlight GitBranch ctermfg=3 ctermbg=8 cterm=none
endfunction

augroup statusline_colors
	autocmd!
	autocmd InsertEnter *
				\ highlight StatusLine ctermfg=3 ctermbg=8
				\| highlight CurrentMode ctermfg=2 ctermbg=8 cterm=bold

	autocmd InsertLeave *
				\ call StatusLineColors()

	autocmd VimEnter *
				\ call StatusLineColors()
augroup END

function! BuildStatusLine()
	let statusline=''
	let statusline.='%#CurrentMode# %{toupper(g:currentmode[mode()])}'
	let statusline.=' %M'
	let statusline.='%0* %t %='
	let statusline.='%{StatusReadonly()}'
	let statusline.=' %{StatusPaste()} '
	let statusline.='%#CurrentMode# %Y '
	let statusline.='%#CurrentProject# %{StatusWorkingDir()} '
	let statusline.='%#GitBranch# %{FugitiveHead()} '
	return statusline
endfunction

set statusline=%!BuildStatusLine()
set showcmd
set noshowmode
set noruler
set laststatus=2
" }}}
