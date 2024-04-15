return
{
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			-- "nvim-treesitter/nvim-treesitter-textobjects",
			-- "nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-context",
		},
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			require('nvim-treesitter.configs').setup({
				-- A list of parser names, or "all" (the five listed parsers should always be installed)
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"cpp",
					"typescript",
					"javascript",
					"java",
					"dockerfile",
					"toml",
					"ninja",
					"cmake",
					-- "printf",
					"rust",
					"markdown_inline",
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
			})
			require('treesitter-context').setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			})
			-- require("nvim-treesitter").setup()
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
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			'neovim/nvim-lspconfig',
			-- 'williamoman/mason-lspconfig.nvim',
		},
		branch = 'v3.x',
		--[[ 		
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()
			lsp_zero.on_attach(function(client, bufnr)
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
		end, ]]

	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			-- "neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"VonHeikemen/lsp-zero.nvim",
		},
		--[[ 		
		config = function()
			-- local lsp_zero = require("lsp-zero")
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
		end, ]]
	},

	{"L3MON4D3/LuaSnip"},
	{"rafamadriz/friendly-snippets"},
	{
		"tzachar/cmp-fuzzy-buffer",
		dependencies = {
			"telescope-fzf-native.nvim",
			"tzachar/fuzzy.nvim",
			"hrsh7th/nvim-cmp",
		},
	},
	{
		"tzachar/cmp-fuzzy-path",
		dependencies = {
			"telescope-fzf-native.nvim",
			"tzachar/fuzzy.nvim",
			"hrsh7th/nvim-cmp",
		},
	},
	{
		'hrsh7th/nvim-cmp',
		-- event = "InsertEnter",
		event = "InsertEnter",
		dependencies = {
			-- 'telescope-fzf-native.nvim',
			-- 'tzachar/fuzzy.nvim',
			'tzachar/cmp-fuzzy-buffer',
			'tzachar/cmp-fuzzy-path',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'saadparwaiz1/cmp_luasnip',
			'zbirenbaum/copilot.lua',
			'zbirenbaum/copilot-cmp',
			'VonHeikemen/lsp-zero.nvim',
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets"
		},
		config = function()
			local cmp = require("cmp")
			require("copilot_cmp").setup({
				suggestion = { enabled = false },
				panel = { enabled = false }
			})
			local cmp_action = require("lsp-zero").cmp_action()
			cmp.setup({
				sources = {
					-- {name = "path"},
					-- {name = "buffer"},
					{name = "nvim_lsp",  max_item_count = 5,},
					{name = "copilot", max_item_count = 5},
					{name = "nvim-lua",  max_item_count = 5,},
					{name = "luasnip",max_item_count = 5,},
					{name = "fuzzy_buffer",  max_item_count = 5,},
					{name = "fuzzy_path", max_item_count = 5,},
					-- {name = "cmdline", max_item_count = 5},
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
