require "table"

local coding_opts = {
	"lua",
	"rs",
	"cpp",
	"c",
	"hpp",
	"h",
	"tex",
}
local config_opts = {
	"yml",
	"yaml",
	"config",
	"conf",
	"zshrc",
	"toml",
}

local all_files_opts = {
	unpack(config_opts), 
	unpack(coding_opts),
}

return {
	{	
		'akinsho/bufferline.nvim', 
		version = "*", 
		ft = all_files_opts,
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
	},
	{ 
		"lukas-reineke/indent-blankline.nvim",
		ft = all_files_opts,
		main = "ibl", 
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
		'nvim-lualine/lualine.nvim',
		lazy = false,
		priority = 1000,
		dependencies = { 
			'nvim-tree/nvim-web-devicons' 
		},
		opts = {
			sections = {
			    lualine_a = {'mode'},
			    lualine_b = {'branch', 'diff', 'diagnostics'},
			    lualine_c = {'filename'},
			    lualine_x = {'encoding', 'fileformat', 'filetype'},
			    lualine_y = {'progress'},
			    lualine_z = {'location'}
			},
			theme = auto,
		},
	},
	{
		'akinsho/toggleterm.nvim',
		-- version = "*",
		keys = {
			[[<c-\>]],
		},
		opts = {
			auto_scroll = true,
			direction = "float",
			open_mapping = [[<c-\>]],
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
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		ft = coding_opts,
		event = "InsertEnter",
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
		lazy = false,
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
		}
	},
    	{
		"ms-jpq/coq_nvim",
		dependencies = {
			"ms-jpq/coq.artifacts",
		},
		priority = 25,
		ft = all_files_opts,
		config = function()
			vim.cmd("COQnow --shut-up")
		end,
	},
	{
		"lervag/vimtex",
		lazy = false,
		enable = false,
		config = function()
			vim.cmd("syntax enable")
		end,
	},
}
