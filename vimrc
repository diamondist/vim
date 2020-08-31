" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
 Plug 'tpope/vim-surround'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"this options added from Practical Vim Book
set nocompatible
filetype plugin indent on
set hidden
if has("autocmd")
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
endif
runtime macros/matchit.vim

"let mapleader=" "
"syntax on
"set encoding=utf-8
"set clipboard=unnamedplus
"set spell spelllang=en_us
set shiftwidth=4 softtabstop=4 expandtab

"this options I added myself
set ruler
set hlsearch
set nu
set hls

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
