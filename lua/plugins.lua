vim.cmd [[packadd packer.nvim]]

local vscode = vim.g.vscode == 1

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'  -- Packer can manage itself

	-- Add your plugins here
	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		disable = vscode
	}

	-- LSP
	use { -- Configurations for Nvim LSP
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		'neovim/nvim-lspconfig',
		disable = vscode
	}  	
	-- Linter
	use {
		'mfussenegger/nvim-lint',
		disable = vscode
	}
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		disable = vscode
	}
	-- Git
	use {
		'lewis6991/gitsigns.nvim'
	}
	use {
		'tpope/vim-fugitive'
	}
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim' , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} },
		disable = vscode
	}
	-- Lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		disable = vscode
	}
	-- Autopairs
	use {"windwp/nvim-autopairs", disable = vscode}
	use({
		"kylechui/nvim-surround",
		tag = "*",         	
		disable = vscode
	})
	use 'Vimjas/vim-python-pep8-indent'
	-- bufferline
	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons', disable = vscode}
	-- CMP
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip'
		},
		disable = vscode
	}
	-- DAP
	use {"nvim-neotest/nvim-nio", disable = vscode} 
	use {'mfussenegger/nvim-dap', disable = vscode}
	use {'rcarriga/nvim-dap-ui', disable = vscode}
	use {'theHamsta/nvim-dap-virtual-text', disable = vscode}
	use {'lervag/vimtex', disable = vscode}
	-- Comments
	use {'terrortylor/nvim-comment', disable = vscode}
	-- Themes
	use { "catppuccin/nvim", as = "catppuccin", disable = vscode }
	-- 
end)

