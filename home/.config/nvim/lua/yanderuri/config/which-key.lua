return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},

		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		config = function()
			local opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				icons = {
					breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
					separator = "⇏", -- symbol used between a key and it's label
					group = "+", -- symbol prepended to a group
				},
			}
			local wk = require('which-key')
			local builtin = require('telescope.builtin')
			local tree_mappings = {
				n = {
					name = "NvimTree",
					f = {"<cmd>NvimTreeFocus<cr><cmd>set relativenumber<cr>", "NvimTreeFocus"},
					t = {"<cmd>NvimTreeToggle<cr><cmd>set relativenumber<cr>", "NvimTreeToggle"},
				},
				-- L = {"<cmd>Lazy<cr>", "Lazy"},
				-- l = {"<cmd>Lazy<cr>", "Lazy"},
				f = {
					name = "Telescope",
					f = {builtin.find_files, "Files"},
					g = {builtin.live_grep, "Grep"},
					b = {builtin.buffers, "Buffers"},
					h = {builtin.help_tags, "Help"},
				},
			}

			-- local cursors_mapping = {
			-- 	{"<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i"}},
			-- 	{"<C-j>", "<Cmd>MultipleCursorsAddDown<CR>"},
			-- 	{"<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i"}},
			-- 	{"<C-k>", "<Cmd>MultipleCursorsAddUp<CR>"},
			-- 	{"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}},
			-- 	{"<leader>a", "<Cmd>MultipleCursorsAddBySearch<CR>", mode = {"n", "x"}},
			-- 	{"<leader>A", "<Cmd>MultipleCursorsAddBySearchV<CR>", mode = {"n", "x"}},
			-- }

			local term_mappings = {
				t = {
					name = "ToggleTerm",
					a = {"<cmd>ToggleTermToggleAll<cr>", "All"},
					t = {"<cmd>ToggleTerm<cr>", "Toggle"},
				},
			}

			wk.register(tree_mappings, {
				mode = {"n"},
				prefix = "<leader>",
				-- silent = true,
			})

			wk.register(term_mappings, {
				prefix = "<leader>",
				mode = {"n","t"},
				-- silent = true,
				noremap = true,
			})
			wk.setup(opts)
			end,
		},
	}
