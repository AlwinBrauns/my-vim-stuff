set number
set relativenumber
set hlsearch incsearch

set list
set tabstop=2
set shiftwidth=2
set expandtab

let mapleader = "ä"

call plug#begin('~/.nvm/plugged')
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
"--- coc ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"---     ----
call plug#end()

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark

"--sources
source ~/vim_coc.lua
source ~/vim_marker_system.vim
source ~/vim_stack_yank.vim
source ~/vim_google.vim

"---mappings
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
noremap ü `
noremap ö @

nnoremap <leader>F :Files<cr>
nnoremap <leader>B :Buffers<cr>
nnoremap <leader>G :Rg<cr>
nnoremap <leader>L :BLines<cr>
nnoremap <leader>.L :Lines<cr>

vnoremap J 5j
vnoremap K 5k
nnoremap J 5j
nnoremap K 5k
abbreviate if> if(<++>) {<cr><++><cr>}<cr><esc>

