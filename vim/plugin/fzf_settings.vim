" FZF settings
let g:fzf_layout = { 'window': 'enew' }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'up:80%' --layout reverse"

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0
			\| autocmd BufLeave <buffer> set laststatus=0

command! CommandHistory call fzf#vim#command_history()
command! SearchHistory call fzf#vim#search_history()

nnoremap <silent> <leader>/ :execute 'Rg ' . input('Search: ')<CR>

nnoremap <CR> :Buffers<CR>
nnoremap <Leader>c :Colors<CR>
nnoremap <Leader><CR> :Files<CR>
nnoremap <LocalLeader><CR> :GFiles<CR>
