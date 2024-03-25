return {
	{
		'numToStr/Comment.nvim',
		event = "VeryLazy",
		opts = {
		-- add any options here
		},
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		event = "VeryLazy",
		branch = 'v3.x',
		dependencies = {
		-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	},
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"petertriho/cmp-git",
			"zbirenbaum/copilot-cmp",
		},
	},
	{
		'dense-analysis/ale',
		event = "VeryLazy",
		config = function()
		-- Configuration goes here.
			local g = vim.g

			g.ale_ruby_rubocop_auto_correct_all = 1
			g.ale_completion_enabled = 1
			g.ale_completion_autoimport = 1
			g.ale_linters = {
				ruby = {'rubocop', 'ruby'},
				lua = {'lua_language_server','luacheck'},
			}
			g.ale_fixers = {
				lua = {'luafmt'},
				c = {'clang-format'},
				cpp = {'clang-format'},
			}
			g.ale_fix_on_save = 1;
		end
	}
}
