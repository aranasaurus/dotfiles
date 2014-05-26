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

" Enable extended % matching
runtime macros/matchit.vim

" Powerline
let g:Powerline_symbols='fancy'
set laststatus=2
if has('gui_running')
  set guifont=Monaco:h12    " set fonts for gui vim
  set transparency=5        " set transparent window
  set guioptions=egmrt  " hide the gui menubar
endif

" Colors
set t_Co=256
set background=dark
colorscheme solarized
" toggles between dark and light solarized
call togglebg#map("<F5>")
highlight Pmenu ctermbg=238 gui=bold

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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent                  " always autoindent
set copyindent                  " copy previous indentation on autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with >
set smarttab                    " use shiftwidth at the start of a line rather than tabstop
set expandtab
set list listchars=tab:»·,trail:·
set cursorline                  " highlight current line
set foldmethod=syntax

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
set wildmenu                    " Better :command completion
set shortmess=atI               " Nueter the 'Press Enter to continue' messages. see :help shortmess

" Key mapping stuff
let mapleader=","
nnoremap ' `
nnoremap ` '
nnoremap <space> :noh<CR>
nnoremap <leader><space> :set hlsearch<CR>

" Don't make me use shift
nnoremap ; :

" Fix line wrapping messing up j/k keys
nnoremap j gj
nnoremap k gk

" Strip trailing whitespace (the mW/`W stuff is to preserve cursor position...
" there's probably a better way to do this)
nnoremap <leader><CR> mW:%s/\s\+$//e<CR>`W

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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['puppet', 'html'] }

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

" Go stuff
function! GoTo(key, action)
  call WinMove(a:key)
  exec a:action
endfunction
au FileType go set noexpandtab|set nolist
au Filetype go nnoremap <leader>sh :call GoTo('h', "GoDef")<CR><CR>
au Filetype go nnoremap <leader>sj :call GoTo('j', "GoDef")<CR><CR>
au Filetype go nnoremap <leader>sk :call GoTo('k', "GoDef")<CR><CR>
au Filetype go nnoremap <leader>sl :call GoTo('l', "GoDef")<CR><CR>
au Filetype go nnoremap <leader>st :tab split <CR>:exe "GoDef"<CR><CR>
au Filetype go nnoremap <leader>b :make<CR>
au Filetype go nnoremap <leader>r :GoRun<CR>
au Filetype go nnoremap <leader>d :GoDoc<CR>
au Filetype go nnoremap <leader>D :GoDoc `expand(<cword>)`<CR>
au FileType go nnoremap <leader>t :GoTest<CR>

