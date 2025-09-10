-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- fuzzy finder: telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- make sure to load this before all the other start plugins
  },

  -- treesitter: file changes trees, syntax highlight, etc
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "nvim-treesitter/playground",
  },

  -- harpoon: file navigation
  {
    "theprimeagen/harpoon",
  },

  -- undotree
  {
    "mbbill/undotree",
  },

  -- fugitive: git
  {
    "tpope/vim-fugitive",
  },

  -- vim/tmux window nav
  {
    "christoomey/vim-tmux-navigator",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/cmp-buffer",
  },
  {
    "hrsh7th/cmp-cmdline",
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
  },
  {
    "saadparwaiz1/cmp_luasnip",
  },
  {
    "j-hui/fidget.nvim",
  },
})
