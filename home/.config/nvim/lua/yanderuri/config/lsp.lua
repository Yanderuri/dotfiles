return {
	{
		'numToStr/Comment.nvim',
		opts = {
		-- add any options here
		},
		lazy = false,
	},
	{
		'VonHeikemen/lsp-zero.nvim', 
		branch = 'v3.x'
	},
	lazy = false,
	{'williamboman/mason.nvim',lazy = false,},
	{'williamboman/mason-lspconfig.nvim',lazy = false,},
	{'neovim/nvim-lspconfig',lazy = false,},
	{'hrsh7th/cmp-nvim-lsp',lazy = false,},
	{'hrsh7th/nvim-cmp',lazy = false,},
	{'L3MON4D3/LuaSnip',lazy = false,},
}
