" vim: nocp fen fdm=marker fdl=1 tw=78 cc=78 noet
" Packages & plugins {{{
function! PackagerInit() abort
  	packadd vim-packager
	call packager#init({'window_cmd': 'new'})
	" Default plugins {{{
	call packager#add('andymass/vim-matchup')
	call packager#add('haya14busa/is.vim')
	call packager#add('jiangmiao/auto-pairs')
  	call packager#add('junegunn/fzf', {'do': './install --all && ln -s $(pwd) ~/.fzf'})
  	call packager#add('junegunn/fzf.vim')
	call packager#add('tpope/vim-dispatch')
	call packager#add('tpope/vim-endwise')
	call packager#add('tpope/vim-eunuch')
	call packager#add('tpope/vim-surround')
	" Colorschemes
	call packager#add('ayu-theme/ayu-vim', {'name': 'ayu'})
	call packager#add('challenger-deep-theme/vim', {'name': 'challenger-deep'})
  	" Language pack 
	call packager#add('sheerun/vim-polyglot')
	call packager#add('slashmili/alchemist.vim')
	" Git
	call packager#add('tpope/vim-fugitive')
	call packager#add('junegunn/gv.vim')
	call packager#add('mhinz/vim-signify')
	" Extras
	call packager#add('dense-analysis/ale')
	call packager#add('kshenoy/vim-signature')
	" }}}
	" Opt plugins {{{
	" NOTE: use :packloadall to load these plugins.
	call packager#add('editorconfig/editorconfig-vim', 
				\ {'name': 'editorconfig', 'type': 'opt'})
	" }}}
endfunction

" Package management {{{
command! PackagerInstall call PackagerInit() | call packager#install({ 'on_finish': 'quitall' })
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()
" }}}

" Install vim-packager {{{
if empty(glob('~/.vim/pack/packager/opt/vim-packager'))
	silent !git clone https://github.com/kristijanhusak/vim-packager ~/.vim/pack/packager/opt/vim-packager
	:PackagerInstall
endif
" }}}
" }}}

" Settings & key maps " {{{
" FZF {{{
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0
			\| autocmd BufLeave <buffer> set laststatus=2
nnoremap <Leader>[ :Buffers<CR>
nnoremap <Leader>f :Lines<CR>
nnoremap <Leader>bf :BLines<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>p :GFiles<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Search: ')<CR>
command! CommandHistory call fzf#vim#command_history()
command! SearchHistory call fzf#vim#search_history()
" }}}

" ALE {{{
let g:ale_linters = {
			\   'elixir': ['credo'],
			\}

let g:ale_fixers = {
			\   'elixir': ['mix_format'],
			\}

let g:ale_completion_enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
"}}}

" Git {{{
noremap <silent> <Leader>gd :Gvdiff<CR>
noremap <silent> <Leader>gs :Gstatus<CR>
noremap <silent> <Leader>gb :Gblame<CR>
noremap <silent> <Leader>gr :SignifyRefresh<CR>
noremap <silent> <Leader>gp :Dispatch git push<CR>
" }}}

" Signify {{{
let g:signify_vcs_list = ['git', 'hg']
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" }}}
" }}}

