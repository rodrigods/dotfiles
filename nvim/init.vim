call plug#begin('~/.local/share/nvim/plugged')

Plug 'kyazdani42/nvim-web-devicons' " for file icons

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" coq_nvim
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

" beacon
Plug 'nvim-lualine/lualine.nvim'

" nord-vim
Plug 'arcticicestudio/nord-vim'

" nerdtree
Plug 'scrooloose/nerdtree'

call plug#end()

lua require('nvim-web-devicons-config')
lua require('lsp-config')
lua require('lualine-config')

" theme
set termguicolors
colorscheme nord

" window navigation
let mapleader = ","
"nnoremap <C-H> <C-W>h
"nnoremap <C-J> <C-W>j
"nnoremap <C-K> <C-W>k
"nnoremap <C-L> <C-W>l

" nerdtree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
augroup nerdtree_open
    autocmd!
    autocmd VimEnter * NERDTree | wincmd p
augroup END

