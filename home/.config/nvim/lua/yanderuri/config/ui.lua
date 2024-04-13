return
{
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		event = "VeryLazy",
		main = "ibl",
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require "ibl.hooks"
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)
			require("ibl").setup { indent = { highlight = highlight } }
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			-- `nvim-notify` is only needed, if you want to use the notification view.
			-- If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		'nvim-lualine/lualine.nvim',
		-- priority = 1000,
		event = "VeryLazy",
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			-- 'AndreM222/copilot-lualine'
		},
		opts = {
			extensions = {
				"nvim-tree",
				"toggleterm",
				"trouble",
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {'filename'},
				lualine_x = {'encoding', 'fileformat','filetype'},
				lualine_y = {'progress'},
				lualine_z = {'location'}
			},
			options = {
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
				theme = 'auto',
			},
		},
	},
	{
		'akinsho/bufferline.nvim',
		version = "*",
		event = "VeryLazy",
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup()
		end,
	},
	{
		"echasnovski/mini.nvim",
		event = "VeryLazy",
		version = false,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
	},
{
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		vim.opt.termguicolors = true
		local notify_opts = {
			background_colour = "#000000",
		}
		require("notify").setup(notify_opts)
	end,
},
}
