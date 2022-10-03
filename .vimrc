set number
set relativenumber
set hlsearch incsearch

set list
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin('~/.nvm/plugged')
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark

let mapleader = "ä"

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
noremap ü `
noremap ö @

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

nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>g :Rg<cr>
nnoremap <leader>FF :BLines<cr>
nnoremap <leader>FB :Lines<cr>

nnoremap J 5j
nnoremap K 5k

abbreviate if> if(<++>) {<cr><++><cr>}<cr><esc>

let g:stackYank = []
function! StackYank() 
       call extend(g:stackYank, split(getreg("0"), "\n"))
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
nnoremap <leader>a :call AppendFromStackLIFO()<cr>
nnoremap <leader>A $:call AppendFromStackLIFO()<cr>
nnoremap <leader>-a :call AppendFromStackFIFO()<cr>
nnoremap <leader>-A $:call AppendFromStackFIFO()<cr>
nnoremap <space><space> :call StackYank()<cr>
nnoremap <space>s :call sort(g:stackYank)<cr>:echom g:stackYank<cr>

"googling stuff with brave
function! Google(url)
	let isBraveOpen = system('~/isInstanceOfBraveOpen.sh')
	if ( isBraveOpen == "true")
		silent execute ":!brave google.com/search?q=\"" . a:url . "\""
	else
		echo "Instanz bitte vorher manuell oeffnen"
	endif
endfunction	
nnoremap <leader>sg :!brave google.com<cr>
command! -nargs=+ Google call Google(<q-args>)
