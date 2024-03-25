-- local all_possible_events = {
-- 	"BufEnter",   -- entering a buffer, ie file opening
-- 	"VimEnter",   -- launching nvim
-- 	"InsertEnter", -- entering inetert mode
-- 	"InsertLeave",
-- 	"VeryLazy",     -- loading shit at the very last minute
-- 	"BufWinEnter",
-- }

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		dependencies = {
			'AndreM222/copilot-lualine'
		},
		config = function()
			copilot_opts = {
					suggestion = {
					enabled = true,
					auto_trigger = false,
					debounce = 75,
					keymap = {
					      accept = "<M-l>",
					      accept_word = false,
					      accept_line = false,
					      next = "<M-]>",
					      prev = "<M-[>",
					      dismiss = "<C-]>",
				      },
				},
			},
			require("copilot").setup(copilot_opts)
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"brenton-leighton/multiple-cursors.nvim",
		version = "*",  -- Use the latest tagged version
		opts = {},  -- This causes the plugin setup function to be called
		keys = {
			{"<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i"}},
			{"<C-j>", "<Cmd>MultipleCursorsAddDown<CR>"},
			{"<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i"}},
			{"<C-k>", "<Cmd>MultipleCursorsAddUp<CR>"},
			{"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}},
			{"<Leader>a", "<Cmd>MultipleCursorsAddBySearch<CR>", mode = {"n", "x"}},
			{"<Leader>A", "<Cmd>MultipleCursorsAddBySearchV<CR>", mode = {"n", "x"}},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		priority = 25,
		enabled = true,
		tag = "0.1.5",
		event = {
			"VeryLazy",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		opts = {

		},
	},
	{
		'akinsho/toggleterm.nvim',
		-- version = "*",
		event = "VeryLazy";
		-- keys = "<leader>t",
		opts = {
			auto_scroll = true,
			direction = "float",
			open_mapping = "<leader>t",
			start_in_insert = true,
			insert_mappings = false,
			autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
			float_opts = {
			    -- The border key is *almost* the same as 'nvim_open_win'
			    -- see :h nvim_open_win for details on borders however
			    -- the 'curved' border is a custom border type
			    -- not natively supported but implemented in this plugin.
			    border = 'curved',
			    --- width = <value>,
			    --- height = <value>,
			    --- row = <value>,
			    --- col = <value>,
			    winblend = 1,
			    --- zindex = <value>,
			    title_pos = 'center',
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		priority = 25,
		event = {
			"BufEnter",
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()	
			-- set termguicolors to enable highlight groups
			vim.opt.termguicolors = true
			tree_opts = {
				theme = auto,
				sort = {
					sorter = "name",
					folders_first = true,
					files_first = false,
				},
			},
			require("nvim-tree").setup(tree_opts)
		end,
	}
}	
