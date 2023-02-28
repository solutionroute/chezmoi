return {

	{ 'nvim-treesitter/nvim-treesitter-context',
		event = 'BufReadPre',
		config = true,
	},

	{ 'nvim-treesitter/nvim-treesitter',
		opts = {
			ensure_installed = {
				'bash', 'c', 'cmake', 'comment', 'cpp', 'css', 'diff', 'gitignore', 'go', 'gomod', 'graphql',
				'help', 'html', 'http', 'java', 'javascript', 'json', 'lua', 'markdown', 'markdown_inline',
				'php', 'python', 'query', 'regex', 'rust', 'scss', 'sql', 'svelte', 'teal', 'toml', 'tsx',
				'typescript', 'vim', 'vue', 'yaml',
			},
			sync_install = false,
			auto_install = false,
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<C-space>',
					node_incremental = '<C-space>',
					scope_incremental = '<C-s>',
					node_decremental = '<C-bs>',
				},
			},
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { 'BufWrite', 'CursorHold' },
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			-- configuration for certain other plugins relying on tree-sitter
			autopairs = {
				enable = true,
			},
			-- https://github.com/windwp/nvim-ts-autotag
			autotag = {
				enable = true,
				incremental_selection = { enable = true },
				indent = { enable = false },
			},
			-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},

			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
					},
				},
				-- move = { enable = false, },
				-- lsp_interop = { enable = false, },
			},
		}
	},
}
