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
local tree_mappings = {
	["<leader>"] = {
		n = {
			name = "NvimTree",
			f = {"<cmd>NvimTreeFocus<cr>", "NvimTreeFocus"},
			t = {"<cmd>NvimTreeToggle<cr>", "NvimTreeToggle"},
		},
	},
}
local term_mappings = {
	["<leader>"] = {
		t = {"<cmd>ToggleTermToggleAll<cr>", "ToggleTerm"},
	},
}
local builtin = require('telescope.builtin')
local telescope_mappings = {
	f = {
		name = "Telescope",
		f = {builtin.find_files, "Files"},
		g = {builtin.live_grep, "Grep"},
		b = {builtin.buffers, "Buffers"},
		h = {builtin.help_tags, "Help"},
	},
}

wk.register(tree_mappings, {
	mode = "n",
	silent = true,
})

wk.register(term_mappings, {
	mode = {"n","t"},
	silent = true,
	noremap = true,
})

wk.register(telescope_mappings, {
	mode = {"n"},
	prefix = "<leader>",
})

vim.cmd("set clipboard+=unnamedplus")
vim.opt.cursorline = true
vim.cmd([[filetype on]])
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("mini.starter").setup()
