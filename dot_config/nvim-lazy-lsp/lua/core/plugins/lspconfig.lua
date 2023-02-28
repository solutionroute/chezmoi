-- see further down for the return{} to lazy.nvim
-- Attach key bindings when a LSP client has attached to the buffer
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = true }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- Displays hover information about the symbol under the cursor
		bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

		-- Jump to the definition
		bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

		-- Jump to declaration
		bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

		-- Lists all the implementations for the symbol under the cursor
		bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

		-- Jumps to the definition of the type symbol
		bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

		-- Lists all the references
		bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

		-- Displays a function's signature information
		bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

		-- Renames all references to the symbol under the cursor
		bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

		-- Selects a code action available at the current cursor position
		bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
		bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

		-- Show diagnostics in a floating window
		bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

		-- Move to the previous diagnostic
		bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

		-- Move to the next diagnostic
		bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
	end
})

-- ui niceties
vim.diagnostic.config({
	virtual_text = false, -- if you don't want diagnostics always visible on code line
	severity_sort = true,
	float = {
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	},
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{ border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{ border = 'rounded' }
)

-- diagnostic sign icons in the gutter
local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = ''
	})
end

sign({ name = 'DiagnosticSignError', text = '' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignHint', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })

-- return to lazy.nvim:
return {
	-- Autocompletion
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'hrsh7th/cmp-nvim-lua' },
	{ 'hrsh7th/nvim-cmp',
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
			vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

			local cmp = require('cmp')
			local luasnip = require('luasnip')
			local select_opts = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end
				},
				sources = {
					{ name = 'path' },
					{ name = 'nvim_lsp', keyword_length = 3 },
					{ name = 'buffer', keyword_length = 3 },
					{ name = 'luasnip', keyword_length = 2 },
				},
				window = {
					documentation = cmp.config.window.bordered()
				},
				formatting = {
					fields = { 'menu', 'abbr', 'kind' },
					format = function(entry, item)
						local menu_icon = {
							nvim_lsp = 'λ',
							luasnip = '⋗',
							buffer = 'Ω',
							path = '🖫',
						}

						item.menu = menu_icon[entry.source.name]
						return item
					end,
				},
				mapping = {
					['<Up>'] = cmp.mapping.select_prev_item(select_opts),
					['<Down>'] = cmp.mapping.select_next_item(select_opts),

					['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
					['<C-n>'] = cmp.mapping.select_next_item(select_opts),

					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),

					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = false }),

					['<C-d>'] = cmp.mapping(function(fallback)
						if luasnip.jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { 'i', 's' }),

					['<C-b>'] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),

					['<Tab>'] = cmp.mapping(function(fallback)
						local col = vim.fn.col('.') - 1

						if cmp.visible() then
							cmp.select_next_item(select_opts)
						elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
							fallback()
						else
							cmp.complete()
						end
					end, { 'i', 's' }),

					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item(select_opts)
						else
							fallback()
						end
					end, { 'i', 's' }),
				},
			})
		end,
	},

	-- Snippets
	{ 'L3MON4D3/LuaSnip',
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
		end,
	},
	{ 'rafamadriz/friendly-snippets' },

	-- LSP Support
	{ 'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require('lspconfig')
			local lsp_defaults = lspconfig.util.default_config

			lsp_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)
			-- specific servers; install them first (via Mason or manually)
			-- go
			lspconfig.gopls.setup({})

			-- Emmet provides shortcuts like .d -> <div class=""></div>
			-- "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "eruby"
			lspconfig.emmet_ls.setup({})

			-- cssls, html from vscode servers https://github.com/hrsh7th/vscode-langservers-extracted
			-- not added at this time: json, eslint
			lspconfig.cssls.setup({})
			lspconfig.html.setup({})

			-- markdown - requires manual install if not using Mason https://github.com/artempyanykh/marksman
			lspconfig.marksman.setup({})

			-- https://github.com/bash-lsp/bash-language-server
			lspconfig.bashls.setup({})

			-- javascript/typescript, json: https://rome.tools/
			lspconfig.rome.setup({})

			-- sql
			lspconfig.sqlls.setup({})

			-- lua / mostly for nvim config editing
			lspconfig.sumneko_lua.setup({
				settings = {
					single_file_support = true,
					flags = {
						debounce_text_changes = 150,
					},
					Lua = {
						runtime = { version = 'LuaJIT', },
						diagnostics = { globals = { 'vim' }, },
						workspace = { library = vim.api.nvim_get_runtime_file("", true), },
						telemetry = { enable = false, },
					},
				},
			})
		end,
	},

	-- null-lsp for certain formatters
	{ 'jose-elias-alvarez/null-ls.nvim',
		dependencies = 'VonHeikemen/lsp-zero.nvim',
		config = function()
			local M = require("null-ls")
			M.setup({
				sources = {
					M.builtins.formatting.gofumpt,
					M.builtins.formatting.rome,
					M.builtins.formatting.mdformat,
					M.builtins.formatting.sql_formatter,

				}
			})
		end,
	},
}
