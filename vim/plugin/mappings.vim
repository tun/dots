if exists('g:tun_mappings_loaded')
	finish
endif

let g:tun_mappings_loaded = 1

" Don't use arrow keys:
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Local leader
let maplocalleader = " "
" Toggle line numbers:
nnoremap <silent> <LocalLeader>n :set number! relativenumber!<CR>
" Switch to last used buffer:
nnoremap <bs> <c-^>
" Fold navigation
nnoremap <tab> zj
nnoremap <S-tab> zk
" Tab navigation
nmap > gt
nmap < gT
" Toggle folds
nmap <Tab> za
" Indent entire file and keep cursor on same line
nnoremap <LocalLeader>= gg=G''
" Save faster
nnoremap <LocalLeader>w :w<cr>
" Quit faster
nnoremap <LocalLeader>q :q<cr>
" Save & quit faster
nnoremap <LocalLeader>wq :wq<cr>
" Delete current buffer
nnoremap <LocalLeader>bd :bd<cr>
" Zoom split
map  <C-w>z <C-w>\|<C-w>_
