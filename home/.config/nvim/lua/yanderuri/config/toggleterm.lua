return {
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
}

