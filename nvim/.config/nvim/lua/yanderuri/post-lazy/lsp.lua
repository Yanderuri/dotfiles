require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'ts_ls',
		'rust_analyzer',
		'lua_ls',
		'clangd',
		'golangci_lint_ls',
		'gopls',
		'jedi_language_server',
	},
})
require("mason-lspconfig").setup_handlers{
	function(server_name)
		require('lspconfig')[server_name].setup({})
	end,
}

-- Autocomplete sources
local cmp = require('cmp')
-- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = "buffer"},
  },
  mapping = cmp.mapping.preset.insert({
    -- Enter key confirms completion item
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl + space triggers completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
