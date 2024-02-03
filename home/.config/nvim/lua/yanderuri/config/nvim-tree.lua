return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	priority = 25,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true
		tree_opts = {
			sort = {
				sorter = "name",
				folders_first = true,
				files_first = false,
			},
		},
		require("nvim-tree").setup(tree_opts)
	end,
}
