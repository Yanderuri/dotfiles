return
{
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
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
		event = "VeryLazy",
		opts = {
		},
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',

	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"VonHeikemen/lsp-zero.nvim",
		},
	},
	{"L3MON4D3/LuaSnip"},
	{"rafamadriz/friendly-snippets"},
	{
		"tzachar/cmp-fuzzy-buffer",
		dependencies = {
			"telescope-fzf-native.nvim",
			"tzachar/fuzzy.nvim",
		},
	},
	{
		"tzachar/cmp-fuzzy-path",
		dependencies = {
			"telescope-fzf-native.nvim",
			"tzachar/fuzzy.nvim",
		},
	},
	{
		'hrsh7th/nvim-cmp',
		event = "VeryLazy",
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
			'VonHeikemen/lsp-zero.nvim',
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets"
		},
		config = function()

		end,
	}
}
