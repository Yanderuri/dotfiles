-- vim.keymap.set("n", "<leader>n", function()
-- 	vim.cmd("NvimTreeFocus")
-- end)
-- vim.keymap.set("n", "<leader>t", function()
-- 	vim.cmd("ToggleTermToggleAll")
-- end)
vim.g.mapleader = ","
-- vim.cmd([[nnoremap ; :]])
vim.keymap.set("n",";",":")
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

wk.register(tree_mappings, {
	mode = "n",
})

wk.register(term_mappings, {
	mode = {"n","t"},
	noremap = true,
})
