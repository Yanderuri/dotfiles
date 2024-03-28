return 
{
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require('nvim-treesitter.configs').setup {
				-- A list of parser names, or "all" (the five listed parsers should always be installed)
				ensure_installed = {
					"c", 
					"cpp",
					"lua", 
					"vim", 
					"vimdoc", 
					"query",
					"typescript",
					"javascript",
					"java",
					-- "help",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				-- List of parsers to ignore installing (or "all")
				ignore_install = { 
					-- "javascript"
				},

				---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
				-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

				highlight = {
					enable = true,

					-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
					-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
					-- the name of the parser)
					-- list of language that will be disabled
					-- disable = { "c", "rust" },
					-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
					-- disable = function(lang, buf)
					-- 	local max_filesize = 100 * 1024 -- 100 KB
					-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					-- 	if ok and stats and stats.size > max_filesize then
					-- 		return true
					-- 	end
					-- end,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
			}
		end,
	},
	{
		'numToStr/Comment.nvim',
		-- event = "InsertEnter",
		event = "VeryLazy",
		-- keys = "g",
		opts = {
			-- add any options here
		},
	},
	{
		"ms-jpq/coq_nvim",
		enabled = false,
		event = "InsertEnter",
		-- event = "VeryLazy",
	},
	{
		'VonHeikemen/lsp-zero.nvim', 
		branch = 'v3.x',
		event = "VeryLazy",
	},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'neovim/nvim-lspconfig'},
	{'L3MON4D3/LuaSnip'},
	{'rafamadriz/friendly-snippets'},
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lsp',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-path',
			'zbirenbaum/copilot-cmp',
			'hrsh7th/cmp-cmdline',
			'VonHeikemen/lsp-zero.nvim',
		},
		config = function()
			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()
			cmp.setup({
				sources = {
					{name = "nvim_lsp"},
					{name = "buffer"},
					{name = "luasnip"},
					{name = "path"},
					{name = "copilot.lua"},
					{name = "cmdline"},
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
		end,
	}
}
