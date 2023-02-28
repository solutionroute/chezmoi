-- nvim/core/plugins/init.lua
--
-- Plugins table for lazy.nvim; others will be included from the
-- various plugin files in this directory.
return {

	-- dynamic menus derived from key mappings
	{ 'folke/which-key.nvim', config = true },

	-- restore cursor position in file on re-open
	{ 'ethanholz/nvim-lastplace',
		config = true,
	},

	-- automatic "session" save; session restore is human driven (<Leader>q...)
	{ "folke/persistence.nvim",
		-- only start session saving when a file has been opened
		event = "BufReadPre",
		module = "persistence",
		config = true,
	},

	-- highlight rgb colour strings like #ffcc33
	{ 'NvChad/nvim-colorizer.lua', config = true },

	-- create highlight groups for themes which may be missing them
	'folke/lsp-colors.nvim',
	--
	-- pretty+move notifications up from status line
	{ 'rcarriga/nvim-notify',
		opts = {
			background_colour = '#20242c',
		},
	},
}
