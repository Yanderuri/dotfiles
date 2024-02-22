return {
	"nvim-telescope/telescope.nvim",
	priority = 25,
	enabled = true,
	tag = "0.1.5",
	event = {
		"VeryLazy",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	opts = {

	},
}
