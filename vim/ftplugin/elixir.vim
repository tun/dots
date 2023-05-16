command! MixFormat silent! :!mix format %

setlocal autoread
setlocal formatprg=mix\ format\ -
setlocal cursorline
setlocal number
setlocal relativenumber
setlocal textwidth=98
setlocal colorcolumn=99

match ErrorMsg '\%>98v.\+'

augroup	Elixir
	autocmd!

	if exists('g:tun_elixir_mix_format')
		autocmd BufWritePost *.ex,*.exs :MixFormat
	endif
augroup END
