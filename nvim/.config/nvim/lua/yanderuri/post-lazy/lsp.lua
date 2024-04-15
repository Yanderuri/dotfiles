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
		['clangd'] = {'c', 'cpp'},
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
	},
}
)
