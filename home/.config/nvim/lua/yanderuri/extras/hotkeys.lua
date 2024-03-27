-- vim.keymap.set("n", "<leader>n", function()
-- 	vim.cmd("NvimTreeFocus")
-- end)
-- vim.keymap.set("n", "<leader>t", function()
-- 	vim.cmd("ToggleTermToggleAll")
-- end)
vim.g.mapleader = ","
-- vim.cmd([[nnoremap ; :]])
vim.keymap.set("n",";",":",{silent = false, remap=false})
local wk = require("which-key")
local builtin = require('telescope.builtin')
local tree_mappings = {
	n = {
		name = "NvimTree",
		f = {"<cmd>NvimTreeFocus<cr>", "NvimTreeFocus"},
		t = {"<cmd>NvimTreeToggle<cr>", "NvimTreeToggle"},
	},
	L = {"<cmd>Lazy<cr>", "Lazy"},
	l = {"<cmd>Lazy<cr>", "Lazy"},
	f = {
		name = "Telescope",
		f = {builtin.find_files, "Files"},
		g = {builtin.live_grep, "Grep"},
		b = {builtin.buffers, "Buffers"},
		h = {builtin.help_tags, "Help"},
	},
}
local term_mappings = {
	name = "ToggleTerm",
	t = {"<cmd>ToggleTermToggleAll<cr>", "ToggleTermToggleAll"},
}

wk.register(tree_mappings, {
	mode = "n",
	prefix = "<leader>",
	silent = true,
})

wk.register(term_mappings, {
	prefix = "<leader>",
	mode = {"n","t"},
	silent = true,
	noremap = true,
})

vim.cmd("set clipboard+=unnamedplus")
vim.opt.cursorline = true
vim.cmd([[filetype on]])
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("mini.starter").setup()
