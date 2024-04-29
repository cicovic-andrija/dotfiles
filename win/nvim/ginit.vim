execute "GuiTabline(0)"

let s:fontsize=8
function! AdjustFontSize(amount)
	let s:fontsize=s:fontsize+a:amount
	execute "GuiFont! JetBrains Mono NL:h".s:fontsize
endfunction

execute AdjustFontSize(s:fontsize)
nnoremap <M-+> :call AdjustFontSize(1)<CR>
nnoremap <M--> :call AdjustFontSize(-1)<CR>
inoremap <M-+> :call AdjustFontSize(1)<CR>
inoremap <M--> :call AdjustFontSize(-1)<CR>
