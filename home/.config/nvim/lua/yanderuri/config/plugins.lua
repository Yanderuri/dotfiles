local table = require "table"

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
	"task",
}

local all_possible_events = {
	"BufEnter",   -- entering a buffer, ie file opening
	"VimEnter",   -- launching nvim
	"InsertEnter", -- entering inetert mode
}
local all_files_opts = {}

for i = 1,#config_opts do
	all_files_opts[#all_files_opts+1] = config_opts[i]
end

for i = 1,#coding_opts do
	all_files_opts[#all_files_opts+1] = coding_opts[i]
end

return {
	{	
		'akinsho/bufferline.nvim', 
		version = "*", 
		event = {
			"BufEnter",
		},
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup()
		end,
	},
	{ 
		"lukas-reineke/indent-blankline.nvim",
		event = {
			"InsertEnter",
		},
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
		priority = 1000,
		event = {
			"BufEnter",
		},
		dependencies = { 
			'nvim-tree/nvim-web-devicons' 
		},
		config = function()
			opts = {
				extensions = {
					"nvim-tree",
					"toggleterm",
				},
				sections = {
				    lualine_a = {'mode'},
				    lualine_b = {'branch', 'diff', 'diagnostics'},
				    lualine_c = {'filename'},
				    lualine_x = {'encoding', 'fileformat', 'filetype'},
				    lualine_y = {'progress'},
				    lualine_z = {'location'}
				},
			theme = "gruvbox-material",
		},
		require("lualine").setup(opts)
		end,
	},
	{
	 	'AndreM222/copilot-lualine'
	},
		{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
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
		event = "InsertEnter",
		config = function()
			vim.cmd("COQnow --shut-up")
		end,
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
}	
