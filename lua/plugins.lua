vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'  -- Packer can manage itself

	-- Add your plugins here
	use {
    	'nvim-treesitter/nvim-treesitter',
    	run = ':TSUpdate'
  	}

  	use 'neovim/nvim-lspconfig'  -- Configurations for Nvim LSP

	use {
  		"nvim-neo-tree/neo-tree.nvim",
    	branch = "v3.x",
    	requires = { 
      		"nvim-lua/plenary.nvim",
      		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      		"MunifTanjim/nui.nvim",
      		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    	}
  	}

	use {
  		'nvim-telescope/telescope.nvim' , branch = '0.1.x',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}
  
 	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use {"windwp/nvim-autopairs"}

	use {
  		'hrsh7th/nvim-cmp',
  		requires = {
    		'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp-signature-help',
    		'L3MON4D3/LuaSnip',
    		'saadparwaiz1/cmp_luasnip'
  		}
	}

	use "nvim-neotest/nvim-nio" 
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'theHamsta/nvim-dap-virtual-text'
	use 'lervag/vimtex'
	--use 'micangl/cmp-vimtex'

end)

