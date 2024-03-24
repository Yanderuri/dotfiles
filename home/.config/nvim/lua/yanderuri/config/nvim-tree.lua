return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	priority = 25,
	event = {
		"BufEnter",
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()	
		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true
		tree_opts = {
			theme = auto,
			sort = {
				sorter = "name",
				folders_first = true,
				files_first = false,
			},
		},
		require("nvim-tree").setup(tree_opts)
	end,
}
