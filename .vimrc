" This must be first, because it changes other options as a side effect
set nocompatible 
set viminfo="~/.viminfo"

set hidden                      " hide buffers rather than close them
set nowrap                      " don't wrap lines
set number                      " always show line numbers
set showmatch                   " show matching parens
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lower case, otherwise use case sensitive
set hlsearch                    " highlight search terms
set incsearch                   " show matches as you type
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
" set virtualedit=all             " allow cursor to go into 'invalid' places
set mouse=a                     " enable mouse if it's available

" tab/indent related stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab       " convert tabs to spaces
set autoindent      " always autoindent
set copyindent      " copy previous indentation on autoindenting
set shiftround      " use multiple of shiftwidth when indenting with >
set smarttab        " use shiftwidth at the start of a line rather than tabstop

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set novisualbell  " don't beep
set noerrorbells "don't beep
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set nobackup
set noswapfile
set clipboard=unnamed   " Enable pasting from the system clipboard

" UI stuff
set guioptions-=T

filetype on
filetype plugin on
filetype indent on

set t_Co=256
colorscheme mustang
syntax on

" Key mapping stuff
map <silent><C-l> :tabnext<CR>
map <silent><C-h> :tabprevious<CR>
nnoremap ; :
vmap Q gq
nmap Q gqap
" Fix line wrapping messing up j/k keys
nnoremap j gj
nnoremap k gk

" NERDTree Stuff
nmap ,n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap ,N :NERDTreeClose<CR>
let NERDTreeBookmarksFile=expand("$VIM/vimfiles/NERDTreeBookmarks")
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.hg' ]
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorline=1
let NERDTreeMouseMode=2

" Omni
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Kill the beep
" autocmd VimEnter * set vb t_vb=

