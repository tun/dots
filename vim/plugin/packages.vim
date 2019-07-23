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
	call packager#add('tpope/vim-eunuch')
	call packager#add('tpope/vim-fugitive')
	call packager#add('tpope/vim-surround')
	" Colorschemes
	call packager#add('challenger-deep-theme/vim', {'name': 'challenger-deep'})
	call packager#add('ayu-theme/ayu-vim', {'name': 'ayu'})
  	" Language pack 
	call packager#add('sheerun/vim-polyglot')
	" }}}
	" Opt plugins {{{
	" NOTE: use :packloadall to load these plugins.
	" Git
	call packager#add('junegunn/gv.vim', {'type': 'opt'})
	call packager#add('mhinz/vim-signify', {'type': 'opt'})
	call packager#add('tpope/vim-rhubarb', {'type': 'opt'})
	" Extras
	call packager#add('w0rp/ale', {'type': 'opt'})
	call packager#add('AndrewRadev/splitjoin.vim', {'type': 'opt'})
	call packager#add('editorconfig/editorconfig-vim', {'name': 'editorconfig', 'type': 'opt'})
	call packager#add('mattn/emmet-vim', {'type': 'opt'})
	call packager#add('kshenoy/vim-signature', {'type': 'opt'})
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
" Emmet {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-E>'
" }}}
" }}}
