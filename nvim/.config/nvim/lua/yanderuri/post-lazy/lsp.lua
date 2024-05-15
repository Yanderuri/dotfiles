	local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()
lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)
lsp_zero.format_on_save({
	format_opts = {
		async = false,
		timeoutms = 10000,
	},
	servers = {
		['tsserver'] = {'javascript', 'typescript'},
		['rust_analyzer'] = {'rust'},
		['clangd'] = {'c',},
		-- {'cpp'},
		['taplo'] = {'toml'},
		['pylsp'] = {'python'},
		['lua_ls]'] = {'lua'},
	},
})

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
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

-- local cmp = require('cmp')
-- local cmp_action = require('lsp-zero').cmp_action()
--
-- cmp.setup({
--   mapping = cmp.mapping.preset.insert({
--     -- `Enter` key to confirm completion
--     ['<CR>'] = cmp.mapping.confirm({select = false}),
--
--     -- Ctrl+Space to trigger completion menu
--     ['<C-Space>'] = cmp.mapping.complete(),
--
--     -- Navigate between snippet placeholder
--     ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--     ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--
--     -- Scroll up and down in the completion documentation
--     ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-d>'] = cmp.mapping.scroll_docs(4),
--   }),
--   snippet = {
--     expand = function(args)
--       require('luasnip').lsp_expand(args.body)
--     end,
--   },
-- })
