-- line numbers
vim.opt.nu = true -- show numbers
vim.opt.relativenumber = true -- relative numbers

-- tabs & identation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- expand tabs to spaces
vim.opt.smartindent = true -- copy ident from current line when starting a new onee

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if include case in search, assume case-sensitive

-- cursor line & column
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"

-- appearence
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes" -- show sign column so taht text doesn't shift

-- turn off swapfile
vim.opt.swapfile = false

-- file explorer
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
