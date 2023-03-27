" this must be first because it changes other options as a side effect
set nocompatible

" enable filetype plugins
filetype plugin indent on
syntax on

" set some magic
set magic

" no backups
set nobackup
set noswapfile

" set to auto read when a file is changed from the outside
set autoread

" autowrite buffer before executing most commands
set autowrite

" set rational tabs & co.
set expandtab
set softtabstop=4
set shiftwidth=4
set colorcolumn=80

" keep x lines of command line history
set history=350

" persistent undo <3
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" when editing a file, always jump to the last known cursor position.
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ 	exe "normal g`\"" |
\ endif

" have the mouse enabled all the time
set mouse=a

" display incomplete commands
set showcmd

" do incremental searching
set incsearch
set ignorecase
set hlsearch

" no sound on errors
set noerrorbells
set novisualbell

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set nice 'list' symbols (to actualy see them use :list)
set listchars=tab:→·,trail:·,eol:↩

" set nice completion menu
set wildmenu
set wildmode=longest:full,full
set completeopt=longest,menu

" show the cursor position all the time
set ruler

" show line nuber
set number

" laeve some space when moving vertical
set scrolloff=5

" no wrapping of long lines
set nowrap

" always show statusline
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" set mapleader to space
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" fast saving
nmap <leader>w :w!<cr>

" copy & paste
map <leader>y "+y
map <leader>p "+p

" don't use Ex mode, use Q for formatting
map Q gq

" map commonly mistype commands
com! Q q
com! Wq wq
com! WQ wq
