return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},

		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "⇏", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
		},
	},
}
