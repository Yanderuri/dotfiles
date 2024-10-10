return {
	-- Stuff for setting up language servers (LSP)
	{'neovim/nvim-lspconfig'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	--
	-- Stuff utilizing said language servers (completions)
	{"hrsh7th/nvim-cmp", branch = "main", },
	{"hrsh7th/cmp-buffer"},
	{'hrsh7th/cmp-nvim-lsp'},
	{'L3MON4D3/LuaSnip'},
	{"saadparwaiz1/cmp_luasnip"},

	{ "rcarriga/nvim-dap-ui",
		dependencies =
		{
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
	{
		"delphinus/cmp-ctags",
		ft = {'c', 'h'}
	},
	{"Civitasv/cmake-tools.nvim"},
	{"mfussenegger/nvim-lint"},
	{"mhartington/formatter.nvim"},
}
