return {
	{
		require("yanderuri.config.nvim-tree")
	},
	{
		"github/copilot.vim",
	},
	{ 
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
		main = "ibl", 
		opts = {

		},
		config = function()	
			vim.cmd('set number')
			vim.cmd('set relativenumber')
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
		"catppuccin/nvim", 
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavour = "frappe", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "macchiato",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = true, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
					    enabled = true,
					    indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
		-- setup must be called before loading
		vim.cmd.colorscheme "catppuccin"
		end,
	},
}
