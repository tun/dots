" disable netrw plugin
let g:loaded_netrwPlugin = 0

filetype plugin indent on
syntax enable

set path+=**

set hidden
set noswapfile
set nobackup
set noruler

set wildmenu
set wildmode=list:full

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

set mouse=nvi

" Splits the right way. {{{
set splitbelow
set splitright
" }}}

" Persistent undo {{{
set undofile

if has('nvim')
	if empty(glob('~/.cache/nvim/undo'))
		call mkdir($HOME . '/.cache/nvim/undo', 'p')
	endif
	set undodir=~/.cache/nvim/undo
elseif empty(glob('~/.cache/vim/undo'))
	call mkdir($HOME . '/.cache/vim/undo', 'p')
	set undodir=~/.cache/vim/undo
endif
" }}}

" Folds {{{
set foldenable
set foldcolumn=0
set foldlevel=1
set foldmethod=indent
" }}}

" Search {{{
set hlsearch
set ignorecase
set incsearch
set showmatch
set smartcase
" }}}

set fileformat=unix
set formatoptions-=cro
set formatoptions+=j
set shortmess=aIOt
