return {
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
	},
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"nvim-telescope/telescope.nvim",
		priority = 25,
		enabled = true,
		tag = "0.1.5",
		lazy = true,
		keys = "<leader>f",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		opts = {
			extensions = {
				fzf = {
					fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
					override_file_sorter = true,     -- override the file sorter
					case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			}
		},
		config = function()
			-- require('telescope').setup(opts)
		end,
	},
	{
		'akinsho/toggleterm.nvim',
		event = "VeryLazy",
		opts = {
			auto_scroll = true,
			direction = "float",
			start_in_insert = true,
			insert_mappings = false,
			autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
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
		-- event = "BufEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			-- set termguicolors to enable highlight groups
			vim.opt.termguicolors = true
			local opts = {
				hijack_cursor = true,
				disable_netrw = true,
				hijack_netrw = false,
				theme = auto,
				sort = {
					sorter = "name",
					folders_first = true,
					files_first = false,
				},
				view = {
					width = {
						min = 40,
						max = 80,
					},
					preserve_window_proportions = true,
					number = true,
					relativenumber = true,
				},
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				reload_on_bufenter = true,
			}
			require("nvim-tree").setup(opts)
		end,
	},
	{
		'https://codeberg.org/esensar/nvim-dev-container',
		dependencies = 'nvim-treesitter/nvim-treesitter'
	},
}
