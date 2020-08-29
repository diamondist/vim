set nocompatible
filetype plugin on
"let mapleader=" "
"syntax on
"set encoding=utf-8
set clipboard=unnamedplus
set hlsearch
"set spell spelllang=en_us
set shiftwidth=4 softtabstop=4 expandtab
set ruler
set nu
runtime macros/matchit.vim
set hls

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
