"marker system
function! InsertMarker()
    :normal! i<++>
endfunction
function! AppendMarker()
    :normal! a<++>
endfunction
nnoremap <leader>jj /<++>/<cr>"_c4l
nnoremap <leader>ji :call InsertMarker()<cr>
nnoremap <leader>ja :call AppendMarker()<cr>
"---
