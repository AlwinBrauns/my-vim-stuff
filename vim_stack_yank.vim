let g:stackYank = []
function! StackYank() 
       call extend(g:stackYank, split(getreg("0"), "\n"))
       echom g:stackYank
endfunction
function! InsertFromStackLIFO() 
    if (len(g:stackYank)<=0)
        echom "stack ist empty"
        return
    endif
    execute "normal! i" . remove(g:stackYank, -1) . "\<esc>"
    echom g:stackYank
endfunction
function! InsertFromStackFIFO() 
    if (len(g:stackYank)<=0)
        echom "stack ist empty"
        return
    endif
    execute "normal! i" . remove(g:stackYank, 0) . "\<esc>"
    echom g:stackYank
endfunction
function! AppendFromStackLIFO() 
    if (len(g:stackYank)<=0)
        echom "stack ist empty"
        return
    endif
    execute "normal! a" . remove(g:stackYank, -1) . "\<esc>"
    echom g:stackYank
endfunction
function! AppendFromStackFIFO() 
    if (len(g:stackYank)<=0)
        echom "stack ist empty"
        return
    endif
    execute "normal! a" . remove(g:stackYank, 0) . "\<esc>"
    echom g:stackYank
endfunction
function! ClearStackYank()
    let g:stackYank = []
endfunction
nnoremap <leader>y yiw:call StackYank()<cr>
nnoremap <leader>i :call InsertFromStackLIFO()<cr>
nnoremap <leader>I $:call InsertFromStackLIFO()<cr>
nnoremap <leader>-i :call InsertFromStackFIFO()<cr>
nnoremap <leader>-I $:call InsertFromStackFIFO()<cr>
nnoremap <leader>a :call AppendFromStackLIFO()<cr>
nnoremap <leader>A $:call AppendFromStackLIFO()<cr>
nnoremap <leader>-a :call AppendFromStackFIFO()<cr>
nnoremap <leader>-A $:call AppendFromStackFIFO()<cr>
nnoremap <space><space> :call StackYank()<cr>
nnoremap <space>s :call sort(g:stackYank)<cr>:echom g:stackYank<cr>
