" Enter current millenium
set nocompatible
set encoding=UTF-8

" Enable syntax highlighting and plugins
syntax on
filetype plugin on

" Allow vim's own fuzzy find to work
set path+=**

" Ignores stuff from fuzzy search
set wildignore+=*/node_modules/*,*/__pycache__/

" Display all matching files when tab complete
set wildmenu

" Setup colors
colorscheme codedark

" Make default clipboard the OS X clipboard (and unnamedplus for Linux)
set clipboard=unnamed,unnamedplus

" Enable line numbers
set number
set numberwidth=1

" Highlight matching pairs as you type: (), [], {}
set showmatch

" Search-as-you-type
set incsearch

" Case-insensitive searching
set ignorecase

" Case-sensitive if expression contains a capital letter
set smartcase

" Use highlighting for search matches (:nohlsearch to clear [or :noh])
set hlsearch

" Formats stuff as I want, TAB=4spaces, but intelligent
set autoindent
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" Loads all packs
packloadall

" Auto format code
nnoremap ,fmt :PrettierAsync

" Auto format without prettier pragma
let g:prettier#autoformat_require_pragma = 0

" Format on write
autocmd BufWritePost * normal ,fmt

" Auto closes brackets
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i

" Auto closes marks
inoremap " ""<Esc>i
inoremap ` ``<Esc>i

" Fuzzy Finder like VSCode in a new tab
inoremap <C-p> <Esc>:tabfind 
nnoremap <C-p> :tabfind 

" Close current tab
inoremap <C-w> <Esc>:tabclose<CR>
nnoremap <C-w> :tabclose<CR>

" Move between tabs using CTRL+Left and CTRL+Right keys
inoremap <C-Right> <Esc>gt
nnoremap <C-Right> gt
inoremap <C-Left> <Esc>gT
nnoremap <C-Left> gT

" Searchs for selection
vnoremap <C-f> y/<C-R>=escape(@",'/\')<CR><CR>

" Finds and Replaces selection
vnoremap <C-r> y:%s/<C-R>=escape(@",'/\')<CR>//g

" Auto starts NERDTree if `vim` is used without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Command to open NERDTree
inoremap <C-b> <Esc>:NERDTreeToggle<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

" Show hidden files by default
let NERDTreeShowHidden=1

" Close NERDTree with `:q` if it is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
