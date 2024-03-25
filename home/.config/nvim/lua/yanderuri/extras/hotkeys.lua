vim.g.mapleader = ","
vim.keymap.set("n", "<leader>n", function()
	vim.cmd("NvimTreeToggle")
end)
vim.keymap.set("n", "<leader>t", function()
-- 	vim.cmd("ToggleTermToggleAll")
end)
