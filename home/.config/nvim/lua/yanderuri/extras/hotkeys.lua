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

require("mini.starter").setup()

vim.cmd("set clipboard+=unnamedplus")
vim.opt.cursorline = true
vim.cmd([[filetype on]])
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--

local lsp_zero = require("lsp-zero")
-- require('lsp-zero')
require('lspconfig').intelephense.setup({})
lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)
-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		lsp_zero.default_setup,
	}
})

-- local cmp = require("cmp")
-- local cmp_action = require("lsp-zero").cmp_action()
--
-- cmp.setup({
-- 	sources = {
-- 		{name = "nvim_lsp"},
-- 		{name = "buffer"},
-- 		{name = "luasnip"},
-- 		{name = "path"},
-- 		{name = "copilot.lua"},
-- 		{name = "cmdline"},
-- 	},
-- 	formatting = cmp_format,
-- 	mapping = cmp.mapping.preset.insert({
-- 		-- `Enter` key to confirm completion
-- 		['<CR>'] = cmp.mapping.confirm({select = false}),
--
-- 		-- Ctrl+Space to trigger completion menu
-- 		['<C-Space>'] = cmp.mapping.complete(),
--
-- 		-- Navigate between snippet placeholder
-- 		['<C-f>'] = cmp_action.luasnip_jump_forward(),
-- 		['<C-b>'] = cmp_action.luasnip_jump_backward(),
--
-- 		-- Scroll up and down in the completion documentation
-- 		['<C-u>'] = cmp.mapping.scroll_docs(-4),
-- 		['<C-d>'] = cmp.mapping.scroll_docs(4),
-- 	})
-- })
