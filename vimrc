execute pathogen#infect()
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" syntax highlighting
syntax on
" using only 1 column (and 1 space) while possible
set numberwidth=1
" we are using dark background in vim
set background=dark
" colorscheme
if $TERM == "xterm-256color"
      set t_Co=256
endif
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
colorscheme solarized
set wildignore+=.git,*.pyc
" have a line indicate the cursor location
set cursorline
" show the cursor position all the time
set ruler
" use spaces, not tabs, for autoindent/tab key.
set expandtab
" don't wrap text
set nowrap
" don't wrap text in the middle of a word
set linebreak
" always set auto-indenting on
set autoindent
" use smart indent if there is no indent file
set smartindent
" <tab> inserts 4 spaces
set tabstop=4
" but an indent level is 4 spaces wide.
set shiftwidth=4
" <BS> over an autoindent deletes both spaces.
set softtabstop=4
" rounds indent to a multiple of shiftwidth
set shiftround
" show matching <> (html mainly) as well
set matchpairs+=<:>
" allow us to fold on indents
set foldmethod=indent
" don't fold by default
set foldlevel=99
" don't bell or blink
set noerrorbells
set vb t_vb=
" show whitespace
set list
set listchars=tab:>-,trail:~
" default to using case insensitive searches ...
set ignorecase
" ... unless uppercase letters are used in the regex.
set smartcase
" handle tabs more intelligently while searching
set smarttab
" incrementally search while typing a /regex
set incsearch
" remove trailing whitespace on <leader>S
noremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>
" enable pyflakes?
filetype plugin indent on
" set shortcut key and open NerdTree at start
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '\.db$', '\.class$']
autocmd BufWritePre * :%s/\s\+$//e
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" run flake8 on save
autocmd BufWritePost *.py call Flake8()
" ignore pep8 violations
" E711: bool(Object() == None): N/A if Object overrides __eq__()
let g:flake8_ignore='E711'
" disable double spacing between sentences
set nojoinspaces
