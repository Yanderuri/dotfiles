local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
cmp.setup({
	sources = {
		{name = "nvim_lsp",  max_item_count = 10,},
		{name = "nvim-lua",  max_item_count = 10,},
		{name = "luasnip",max_item_count = 10,},
		{name = "fuzzy_buffer",  max_item_count = 10,},
		{name = "fuzzy_path", max_item_count = 10,},
	},
	formatting = cmp_format,
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({select = false}),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),

		-- Scroll up and down in the completion documentation
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	})
})

local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()
lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)
require("mason").setup()
require("mason-lspconfig").setup(
{
	ensure_installed = {
		"lua_ls", "tsserver", "rust_analyzer", "clangd",
		"taplo", "typos_lsp", "pylsp",
	},
	handlers = {
		-- lsp_zero.default_setup,
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
		-- ["rust_analyzer"] = function ()
			-- 	require("rust-tools").setup({})
			-- end,
		},
	}
	)
