"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dyland's vimrc file
"
" Last Modified: 11/21/13
" Sections: General, VIM user interface, Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings, rather than Vi settings
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off " Required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" My Bundles

" Colors
Bundle 'tir_black'
Bundle 'peaksea'

" Time Tracking
Bundle 'wakatime/vim-wakatime'

" Navigation and shortcuts
Bundle 'scrooloose/nerdtree'
Bundle 'tComment'
Bundle 'ack.vim'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'rstacruz/sparkup'
" Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'majutsushi/tagbar'
Bundle 'mozilla/doctorjs'
Bundle 'git://git.code.sf.net/p/atp-vim/code'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" Set working directory to current directory
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" Enable file type detection and do language-dependent indenting.
" Actually this might belong to a separate section for filetypes
filetype plugin indent on


" Enable autoread when a file is changed from the outside
" rarely used. Off by default
" set autoread

" Set map leader to the more comfortable ','
let mapleader=","
let g:mapleader=","

" Fast saving
" Note nmap stands for normal mode mapping. Similarly vmap would be
" for visual and select mode mapping
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Always show current position
set ruler

" Display the status line
set laststatus=2

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Make arrowkeys behave like normal editors
set whichwrap+=<,>,h,l

" => Searching

" Be smart about cases when searching
" Note: need both ignorecase and smartcase
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" I don't understand the following commands work,
" but apparently they are good to keep
set incsearch
set lazyredraw
set magic

" Show matching brackets 
set showmatch
set mat=2

" No annoying sound on erros
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Display line number
set nu

" Folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" In case Vim thinks the terminal is incapable of handling 256 colors
let &t_Co=256

" Switch syntax highlighting on
syntax on

set background=dark

if has("gui_running")
    colorscheme peaksea
else
    colorscheme tir_black
endif

" Set font according to system
if has("mac") || has("macunix")
    set gfn=Menlo:h14
    set shell=/bin/bash
elseif has("linux")
    set gfn=Monospace\ 10
    set shell=/bin/bash
endif

" Open MacVim in fullscreen mode
if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,mac,dos

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Indentation
set autoindent
set smartindent

" Wrap lines
set wrap

" Visual mode pressing * or # searches for the current selection
" Idea from Awesome Vimrc by Amir Salihefendic
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, windows, and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map disable highlight to <leader><cr>
map <silent> <leader><CR> :noh<CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>t<leader> :tabnext

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap Vim 0 to first non-blank character
map 0 ^

" Move a line of text using META+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" Mapping for cope; very useful for debugging
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Mapping for normal copy and pasting on Mac
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

" Mapping for tab completion
function! Smart_TabComplete()
    let line = getline('.')

    let substr = strpart(line, -1, col('.')+1)
    let substr = matchstr(substr, "[^ \t]*$")
    if (strlen(substr)==0)
        return "\<tab>"
    endif

    let has_period = match(substr, '\.') != -1
    let has_slash = match(substr, '\/') != -1
    if (!has_period && !has_slash)
        return "\<C-X>\<C-P>"
    elseif (has_slash)
        return "\<C-X>\<C-O>"
    endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" Set omnicomplete
set omnifunc=syntaxcomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

" tComment

" Ack

" Command-t

" Tagbar
nmap <leader>b :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language Specifics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" JSON
autocmd BufNewFile,BufRead *.json set ft=javascript
