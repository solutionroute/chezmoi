return {
	-- match braces, brackets such
	{ 'windwp/nvim-autopairs', config = true },

	-- code indentation/block identification
	'lukas-reineke/indent-blankline.nvim',

	-- Brings lazygit up in a term window <leader>gl
	'kdheepak/lazygit.nvim',

	-- diagnostics in quickfix
	{ 'folke/trouble.nvim',
		dependencies = 'kyazdani42/nvim-web-devicons',
		config = true
	},

	-- make available go tools like gomodifytags
	{ 'crispgm/nvim-go',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'rcarriga/nvim-notify',
		},
		opts = {
			notify = true,
			auto_format = false, -- null-ls doing this
			auto_lint = false, -- be prepared to be annoyed at first
			tags_options = {}, -- don't want omitempty
		},
	},

	-- git dignostics in gutter
	{ 'lewis6991/gitsigns.nvim',
		dependencies = 'folke/which-key.nvim',
		config = true
	},

	-- function signature display as you type
	{ 'ray-x/lsp_signature.nvim',
		config = function()
			require('lsp_signature').setup { doc_lines = 0, hint_enable = false }
			require 'lsp_signature'.on_attach()
		end,
	},
}
