" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
 Plug 'tpope/vim-surround'
 Plug 'joshdick/onedark.vim'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'tpope/vim-commentary'
 Plug 'vim-airline/vim-airline'
 Plug 'tpope/vim-fugitive'
 Plug 'jiangmiao/auto-pairs'
 Plug 'vim-scripts/dbext.vim'
 Plug 'nvie/vim-flake8'
 Plug 'ivanov/vim-ipython'

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
set incsearch

"visual star search
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction


"let mapleader=" "
"set encoding=utf-8
"set clipboard=unnamedplus
"set spell spelllang=en_us

"this options I added myself
set ruler
set hlsearch
set nu
inoremap jj <Esc>

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"adding colorsheme
syntax on
colorscheme onedark
let g:airline_theme='onedark'

let g:python3_host_prog='/usr/bin/python3'

"python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"sql indentation
au BufNewFile,BufRead *.sql
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"Coc options
nmap <silent> gd <Plug>(coc-definition)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"Shift-H for pydoc
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

let g:airline#extensions#tabline#enabled = 1

"execution
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

"commenting sql
autocmd FileType sql setlocal commentstring=--\ %s

"tweaking dbext
let g:dbext_default_profile_usual = 'type=MYSQL:user=root:passwd=test:dbname=logbook'
let g:dbext_default_profile = 'usual'

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [c :cprevious<CR>
nnoremap <silent> ]c :cnext<CR>

packadd! matchit
