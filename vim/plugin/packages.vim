if has('nvim')
	finish
endif

" Packages & plugins
function! PackagerInit() abort
  packadd vim-packager
  call packager#init({'window_cmd': 'new'})
  " Default plugins
  call packager#add('andymass/vim-matchup')
  call packager#add('haya14busa/is.vim')
  call packager#add('jiangmiao/auto-pairs')
  call packager#add('junegunn/fzf', {'do': 'fzf#install()'})
  call packager#add('junegunn/fzf.vim')
  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-dispatch')
  call packager#add('tpope/vim-endwise')
  call packager#add('tpope/vim-eunuch')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-surround')
  " Colorschemes
  call packager#add('challenger-deep-theme/vim', {'name': 'challenger-deep'})
  " Development
  call packager#add('sheerun/vim-polyglot')
  call packager#add('slashmili/alchemist.vim')
  call packager#add('dense-analysis/ale')
  " Git
  call packager#add('tpope/vim-fugitive')
  call packager#add('junegunn/gv.vim')
  call packager#add('mhinz/vim-signify')
  " Extras
  call packager#add('kshenoy/vim-signature')
  "
  " Opt plugins
  " NOTE: use :packloadall to load these plugins.
  call packager#add('editorconfig/editorconfig-vim',
        \ {'name': 'editorconfig', 'type': 'opt'})
  "
endfunction

" Package management
command! PackagerInstall call PackagerInit() | call packager#install({ 'on_finish': 'quitall' })
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

" Install vim-packager
if empty(glob('~/.vim/pack/packager/opt/vim-packager'))
  silent !git clone https://github.com/kristijanhusak/vim-packager ~/.vim/pack/packager/opt/vim-packager
  :PackagerInstall
endif

" Plugin settings & key maps {{{
" ALE
let g:ale_linters = {
      \	  'sh': ['shellcheck'],
      \	  'elixir': ['credo', 'mix'],
      \	  'python': ['pyflakes'],
      \		'vim': ['vint']
      \}

let g:ale_fixers = {
      \	  'sh': ['remove_trailing_lines', 'trim_whitespace'],
      \   'elixir': ['mix_format', 'remove_trailing_lines', 'trim_whitespace'],
      \	  'python': ['add_blank_lines_for_python_control_statements',
      \   	'remove_trailing_lines', 'trim_whitespace','yapf'],
      \	  'vim': ['remove_trailing_lines', 'trim_whitespace']
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
let g:ale_sh_shell_default_shell='bash'

" Git
noremap <silent> <Leader>gd :Gvdiff<CR>
noremap <silent> <Leader>gs :Gstatus<CR>
noremap <silent> <Leader>gb :Gblame<CR>
noremap <silent> <Leader>gr :SignifyRefresh<CR>
noremap <silent> <Leader>gp :Dispatch git push<CR>

" Signify
let g:signify_vcs_list = ['git', 'hg']
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" }}}
