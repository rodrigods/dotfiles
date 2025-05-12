-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- fuzzy finder: telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- colorscheme
	use { "catppuccin/nvim", as = "catppuccin" }

	-- treesitter: file changes trees, syntax highlight, etc
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')

	-- harpoon: file navigation
	use('theprimeagen/harpoon')

	-- undootree
	use('mbbill/undotree')

	-- fugitive: git
	use('tpope/vim-fugitive')

	-- vim/tmux window nav
	use('christoomey/vim-tmux-navigator')

	-- LSP
	use('neovim/nvim-lspconfig')
	use('williamboman/mason.nvim')
	use('williamboman/mason-lspconfig.nvim')

	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-cmdline')

	use('L3MON4D3/LuaSnip')
	use('saadparwaiz1/cmp_luasnip')
	use('j-hui/fidget.nvim')
end)
