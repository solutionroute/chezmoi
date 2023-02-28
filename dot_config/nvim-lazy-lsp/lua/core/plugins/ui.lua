return {

	-- pretty+move notifications up from status line
	{ 'rcarriga/nvim-notify',
		dependencies = { 'nvim-lua/plenary.nvim', },
		lazy = false,
		config = function()
			require('notify').setup({
				background_colour = '#20242c',
			})
			-- make history available in telescope
			require("telescope").load_extension("notify")
			-- not clear why I'm having to do this since moving to lazy.vim config:
			vim.notify = require('notify')
		end
	},

	-- quick find... anything! Mostly <leader>s...
	{ 'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
			'BurntSushi/ripgrep',
			'kyazdani42/nvim-web-devicons',
			'rcarriga/nvim-notify',
		},
	},

	-- lightweight title bar for path-y goodness
	{ 'fgheng/winbar.nvim',
		opts = { enabled = true, },
	},

	-- status line; lualine usually adapts to colorschemes automatically
	{ 'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		config = true,
	},

	-- Tree explorer for files (and optionally other things)
	{ 'nvim-neo-tree/neo-tree.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim',
			'kyazdani42/nvim-web-devicons',
		},
		cmd = "Neotree",
		branch = 'v2.x',
		keys = {
			{ '<leader>e', '<cmd>Neotree toggle<cr>', desc = "file tree toggle" }
		},
		opts = {
			filesystem = {
				autoselect_one = true,
				follow_current_file = true,
				hijack_netrw_behaviour = "open_current",
			},
		},
	},

	-- highlight rgb colour strings like #ffcc33
	{ 'NvChad/nvim-colorizer.lua', config = true },

	-- distraction free editing pane
	{ "folke/zen-mode.nvim",
		config = function()
			vim.keymap.set("n", "<Leader>tz",
				"<cmd>ZenMode<cr>", { desc = "zen mode toggle" })
		end
	},
}
