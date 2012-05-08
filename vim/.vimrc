" --> [generals]
"
" this must be first, because it changes other options as a side effect
set nocompatible

" keep x lines of command line history
set history=350

" enable filetype plugins
filetype plugin on
filetype indent on

" set to auto read when a file is changed from the outside
set autoread

" autowrite buffer before executing most commands
set autowrite

" have the mouse enabled all the time:
set mouse=a

" set mapleader
let mapleader = ","
let g:mapleader = ","

" fast saving
nmap <leader>w :w!<cr>

" set rational tabs & co.
set expandtab
set softtabstop=4
set shiftwidth=4

" persistent undo <3
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" --> [visuals]
"
" show the cursor position all the time
set ruler

if has("gui_running")
    " set guifont=Monospace\ 16
    set guifont=Menlo Regular:h16
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=l
    set guioptions-=L
    set guioptions-=R
    set lines=40
    set columns=120
endif

" highlight syntax
syntax on

" show line nuber
set number

" laeve some space when moving vertical
set scrolloff=5

set nowrap

" always show statusline
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" set statusline=\ %F%m%r%h\ %w\ \ cwd:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L:%c

" never show tabline
"set showtabline=0

" set some nice colors
set t_Co=256
colorscheme mustang

" --> [others]
"
" display incomplete commands
set showcmd

" do incremental searching
set incsearch
set ignorecase
set hlsearch

" don't use Ex mode, use Q for formatting
map Q gq

" no sound on errors
set noerrorbells
set novisualbell
"set t_vb=

" set some magic
set magic

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set nice 'list' symbols (to actualy see them use :list)
set listchars=tab:>.,trail:.,eol:<

" set nice completion menu
set wildmenu
set wildmode=longest:full,full
set completeopt=longest,menu

" --> [mappings]
"
" prompt for spelllanguage and turn spellchecker on
nmap <F7> :setlocal spell spelllang=

" Copy&Paste 
map <C-C> "+y
map <C-V> "+p
imap <C-V> <C-R>+

" turn on NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <F11> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '.pyc']

" ctags shortcut
map <leader>t :!ctags -R<CR>

" use F1 for something useful
map <F1> <esc>
imap <F1> <esc>

" turn off highlight
map <F6> :noh<CR>

" wrap/nowrap
map <F5> :set wrap!<CR>

" tabs
map <C-Insert> <ESC> :tabnew<CR>
imap <C-Insert> <ESC> :tabnew<CR>

" Taglist
"map <leader>b  :TlistToggle<CR>
"map <F12>  :TlistToggle<CR>
"let Tlist_Show_One_File = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Close_On_Select = 1
"let Tlist_Sort_Type = "name"
"let Tlist_Inc_Winwidth = 0

map <leader>a :A<CR>

" --> [autocommands]
"
au FileType text setlocal textwidth=72

au FileType python compiler pyunit
au FileType python set makeprg=nosetests
au FileType python set omnifunc=pythoncomplete#Complete
" au FileType python setlocal omnifunc=pysmell#Complete
au FileType python let python_highlight_all=1
au FileType python let python_slow_sync=1


" when editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ 	exe "normal g`\"" |
\ endif


let g:github_user = 'oinopion'
let g:github_token = '0a80ecd87e5e673b7f0142bff6ff410b'
let g:gist_browser_command = 'google-chrome %URL%'
