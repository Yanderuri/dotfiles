return {
	-- Stuff for setting up language servers (LSP)
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	-- Stuff utilizing said language servers (completions)
	{
		'hrsh7th/nvim-cmp',
		branch = "main",
	},
	{"hrsh7th/cmp-buffer"},
	{'hrsh7th/cmp-nvim-lsp'},
	{'L3MON4D3/LuaSnip'},
	{"saadparwaiz1/cmp_luasnip"},
	{"Civitasv/cmake-tools.nvim"},
}
