return {
	{
		'numToStr/Comment.nvim',
		-- event = "InsertEnter",
		keys = "g",
		opts = {
		-- add any options here
		},
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		event = "InsertEnter",
		branch = 'v3.x',
		dependencies = {
		-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"petertriho/cmp-git",
			"zbirenbaum/copilot-cmp",
		},
	},
}
