-- require("mini.starter").setup()
-- vim.cmd([[colorscheme catppuccin]])


local wk = require("which-key")
wk.add({
	{ "<leader>f", group = "file" }, -- group
	{
		mode = "n",
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File"},
		{ "<leader>fg", "<cmd> Telescope live_grep<cr>", desc = "Live Grep"},
		{ "<leader>fb", "<cmd> Telescope buffers<cr>", desc = "Browse Buffers"},
		{ "<leader>fh", "<cmd> Telescope help_tags<cr>", desc = "Get Help"},
	},
	{
		mode = "n",
		{ "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Term"},
	},
	-- { "<leader>fb", function() print("hello") end, desc = "Foobar" },
	-- { "<leader>fn", desc = "New File" },
	-- { "<leader>f1", hidden = true }, -- hide this keymap
	-- { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
	-- { "<leader>b", group = "buffers", expand = function()
	-- 	return require("which-key.extras").expand.buf() end
	-- },
	{
		-- Nested mappings are allowed and can be added in any order
		-- Most attributes can inherited or overridden on any level
		-- There's no limit to the depth of nesting
		mode = { "n", "v" }, -- NORMAL and VISUAL mode
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit Buffer" }, -- no need to specify mode since it's inherited
		{ "<leader>ww", "<cmd>w<cr>", desc = "Write Buffer" },
		{ "<leader>wa", "<cmd>wa<cr>", desc = "Write All" },
	},
	{
		mode = {"n", "v"},
		{"<leader>nt", "<cmd>NvimTreeToggle<cr>", desc = "File Browser"},
		{"<leader>nf", "<cmd>NvimTreeFocus<cr>", desc = "Focus Tree"},
		{"<leader>nc", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse Tree"},
	}
})

require('telescope').load_extension('fzf')
