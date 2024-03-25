return {
	{
		"catppuccin/nvim", 
		name = "catppuccin",
		lazy = false,
		enabled = true,
		priority = 1000,
		config = function()
			opts = {
				flavour = "frappe", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "macchiato",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
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
					variables = { "bold" },
					numbers = { "bold" },
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
					notify = true,

					mini = {
					    enabled = true,
					    indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			}
			require("catppuccin").setup(opts)
		vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		enabled = false,
		priority = 1000,
		config = function()
			opts = {
				transparent = true,
				dimInactive = false,
				background = {               	-- map the value of 'background' option to a theme
					dark = "wave",           -- try "dragon" !
					light = "lotus"
				},
			},
			require("kanagawa").setup(opts)
			vim.cmd([[set background=dark]])
			vim.cmd([[colorscheme kanagawa-dragon]])
		end,
	},
	{
		"levouh/tint.nvim",
		enabed = false,
		name = "tint",
		lazy = false,
		priority = 900,
		config = function()
			tint_opts = {
				tint = -50,
				saturation = 1.0,
			},
			require("tint").setup(tint_opts)
		end,
	},
}
