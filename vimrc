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
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-distinguished'

" Navigation and shortcuts
Bundle 'scrooloose/nerdtree'
Bundle 'tComment'
Bundle 'mileszs/ack.vim'
" Bundle 'git://git.wincent.com/command-t.git'
Bundle 'rstacruz/sparkup'

" Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'majutsushi/tagbar'
Bundle 'mozilla/doctorjs'
Bundle 'tpope/vim-surround'
Bundle 'matchit.zip'

" This is latex too!
Bundle 'git://git.code.sf.net/p/atp-vim/code'

" Smart uage of yanking
Bundle 'YankRing.vim'

" Tab completion
"" Bundle 'ervandew/supertab'

"neocomplete
"" Bundle 'Shougo/neocomplete.vim'
"" 
"" " Tab completion for python
"" Bundle 'davidhalter/jedi-vim'

" Better autocomplete--YouCompleteMe
Bundle 'Valloric/YouCompleteMe'

" Note taking plugin
Bundle 'xolox/vim-notes'
Bundle 'xolox/vim-misc'

" Check syntax on save
Bundle 'scrooloose/syntastic'

" SnipMate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

" Python style
Bundle "hynek/vim-python-pep8-indent"

" TypeScript Support
Bundle "leafgarland/typescript-vim"

" JavaScript
Bundle "pangloss/vim-javascript"
Bundle "othree/javascript-libraries-syntax.vim"

" Less
Bundle 'groenewege/vim-less'

" CoqIDE
Bundle 'CoqIDE'
Bundle 'jvoorhis/coq.vim'

" Coquille dependency
Bundle 'def-lkb/vimbufsync'

" Coquille
Bundle 'the-lambda-church/coquille'

" Wakatime
Bundle 'wakatime/vim-wakatime'

" GLSL
Bundle 'tikhomirov/vim-glsl'

" Lusty
Bundle 'sjbach/lusty'

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

" Set working directory to current directory
autocmd VimEnter * if !argc() | NERDTree | endif

" Enable file type detection and do language-dependent indenting.
" Actually this might belong to a separate section for filetypes
filetype plugin indent on

" Enable autoread when a file is changed from the outside
" rarely used. Off by default
set autoread

" Set map leader to the more comfortable ','
let mapleader=","
let g:mapleader=","
let maplocalleader=";"
let g:maplocalleader=";"

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
set wildmode=longest:full,full

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

" no swap please
setlocal noswapfile

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
set number
" set relativenumber

" Folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" GUI options
set guioptions-=r
set guioptions-=L

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" In case Vim thinks the terminal is incapable of handling 256 colors
let &t_Co=256

" Switch syntax highlighting on
syntax on

if has("gui_running")
    colorscheme solarized
    "colorscheme peaksea
else
    colorscheme solarized
    "colorscheme tir_black
endif

set background=dark

" Set font according to system
if has("mac") || has("macunix")
    set gfn=Menlo:h16
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

" highlight the 73th column
highlight ColorColumn  ctermbg=235 guibg=#2c2d27
set colorcolumn=80

" In Vim >= 7.3, also highlight columns 120+
" if exists('+colorcolumn')
"   let &colorcolumn="73,".join(range(120,320),",")
" else
"   " fallback for Vim < v7.3
"   autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" endif

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

" Comments
set formatoptions+=cro

" Visual mode pressing * or # searches for the current selection
" Idea from Awesome Vimrc by Amir Salihefendic
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" highlight suspicious spaces
set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, windows, and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map disable highlight to <leader><cr>
map <silent> <leader><CR> :noh<CR>

" Useful mappings for managing tabs
map <leader>tt :tabnext<CR>

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Remember info about open buffers on close
set viminfo^=%

" Mapping for reloading vimrc
nmap <leader>so :so %<CR>

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
" vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
" nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

" Set omnicomplete
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


set completeopt=longest,menuone

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
let g:solarized_contrast="low"    "default value is normal
let g:solarized_visibility="high"    "default value is normal
let g:solarized_hitrail=1    "default value is 0
" ------------------------------------------------------------------

" NERDTree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

" Neocomplete
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" tComment

" Ack

" Command-t

" Tagbar
nmap <leader>b :TagbarToggle<CR>

" Notes
let g:notes_directories = ['~/Documents/Notes', '~/Dropbox/Shared Notes']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language Specifics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" HTML
let g:html_indent_inctags = "html,body,head,tbody" 

" JSON
autocmd BufNewFile,BufRead *.json set ft=javascript

"LaTeX
" Mapping for compiling. don't know why the default keys don't work
if has("gui_running")
  nmap <leader>ff :Latexmk<CR>
else
  nmap <leader>ff :Tex<CR>
endif

" ATP settings
let g:atp_ProgressBar=1
let g:atp_status_notification=1
let g:atp_DebugModeCmdHeight=&cmdheight
let b:atp_TexCompiler="pdflatex"
let b:atp_TexFlavor="tex"

" for Greek letters and some math commands
let g:atp_imap_leader_1 = '#'

" for font commands
let g:atp_imap_leader_2 = "##"

" for environments
let g:atp_imap_leader_3 = "]"
let g:atp_imap_leader_4 = "["

let g:atp_imap_over_leader = "'"
let g:atp_map_forward_motion_leader = ">"
let g:atp_map_backward_motion_leader = "<"

"  Syntastic
let g:syntastic_auto_jump = 0
let g:syntastic_ignore_files = ['.*\.tex', '.*\.html']
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_typescript_tsc_args='-t ES5 -m AMD'

" JavaScript
let g:used_javascript_libs = 'angularjs,jasmine'

" Less
" nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

" Supertab
"let g:SuperTabMappingForward = '<C-Space>'
"let g:SuperTabMappingBackward = '<C-S-Space>'
"let g:SuperTabDefaultCompletionType = "<c-n>"
"au FileType ocaml call SuperTabSetDefaultCompletionType("<c-x><c-o>")
"au FileType ocaml setlocal shiftwidth=2 tabstop=2
nnoremap <Leader>m :MerlinLocate<CR>

" CoqIDE
let g:CoqIDEDefaultMap = 1

" Coquille
" au FileType coq call coquille#MyMapping()
" let g:coquille_auto_move = "true"

" Ocaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

""" Highlight enclosing term
hi EnclosingExpr ctermbg=17 guibg=LightGreen
nnoremap <LocalLeader>ge :GrowEnclosing<CR>
nnoremap <LocalLeader>se :ShrinkEnclosing<CR>
