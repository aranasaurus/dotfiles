" This must be first, because it changes other options as a side effect
set nocompatible 
set viminfo="~/.vim/.viminfo"

" Adds all dirs in the ~/.vim/bundle
call pathogen#infect()
call pathogen#helptags()

" Auto source .vimrc when it changes
au! BufWritePost .vimrc so %

filetype on
filetype plugin on
filetype indent on
syntax enable

" Colors
set t_Co=256
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" toggles between dark and light solarized
call togglebg#map("<F5>")

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
set mouse=a                     " enable mouse if it's available
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent                  " always autoindent
set copyindent                  " copy previous indentation on autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with >
set smarttab                    " use shiftwidth at the start of a line rather than tabstop
set expandtab
set list listchars=tab:»·,trail:·

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " set teminal title
set novisualbell                " don't beep
set noerrorbells                " seriously, shut up
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set nobackup                    " I can :w thanks
set noswapfile                  " don't litter
set clipboard=unnamed           " Enable pasting from the system clipboard
set guioptions-=T

" Key mapping stuff
let mapleader=","

" Don't make me use shift
nnoremap ; :

" Fix line wrapping messing up j/k keys
nnoremap j gj
nnoremap k gk

" NERDTree Stuff
nmap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap <leader>N :NERDTreeClose<CR>
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

let g:Powerline_symbols='fancy'
set laststatus=2

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

let g:user_zen_expandabbr_key = "<c-e>"
let g:use_zen_complete_tag=1

" Window Management
function! MarkWindowSwap()
	let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
	"Mark destination
	let curNum = winnr()
	let curBuf = bufnr( "%" )
	exe g:markedWinNum . "wincmd w"
	"Switch to source and shuffle dest->source
	let markedBuf = bufnr( "%" )
	"Hide and open so that we aren't prompted and keep history
	exe 'hide buf' curBuf
	"Switch to dest and shuffle source->dest
	exe curNum . "wincmd w"
	"Hide and open so that we aren't prompted and keep history
	exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>wm :call MarkWindowSwap()<CR>
nmap <silent> <leader>wx :call DoWindowSwap()<CR>

function! WinMove(key) 
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr()) "we havent moved
		if (match(a:key,'[jk]')) "were we going up/down
			wincmd v
		else 
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

map <leader>h :call WinMove('h')<cr>
map <leader>k :call WinMove('k')<cr>
map <leader>l :call WinMove('l')<cr>
map <leader>j :call WinMove('j')<cr>
map <leader>wo :wincmd o<cr>
map <leader>wr :wincmd r<cr>
map <leader>H :wincmd H<cr>
map <leader>K :wincmd K<cr>
map <leader>L :wincmd L<cr>
map <leader>J :wincmd J<cr>
nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>
map <leader>wh :call WinMove('h')<cr>:buffers<cr>:buffer<Space>
map <leader>wj :call WinMove('j')<cr>:buffers<cr>:buffer<Space>
map <leader>wk :call WinMove('k')<cr>:buffers<cr>:buffer<Space>
map <leader>wl :call WinMove('l')<cr>:buffers<cr>:buffer<Space>

