function RandomColorscheme()
	let colors = getcompletion('', 'color')
	let colorscheme = colors[rand() % (len(colors) - 1)]
	execute 'colorscheme' colorscheme
endfunction

command! RandomColorscheme silent! call RandomColorscheme()

nnoremap <silent> <LocalLeader>r :RandomColorscheme<cr>:colorscheme<cr>
