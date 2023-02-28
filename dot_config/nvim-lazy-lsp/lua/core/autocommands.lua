-- nvim/lua/core/autocommands.lua
-- https://neovim.io/doc/user/autocmd.html

-- adjust ts/sw for specific file types; note defaults are sw 2, ts 2, expandtab is false
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
	group = vim.api.nvim_create_augroup("ft_sw_2", { clear = true })
})

-- Go imports
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.lua" },
	callback = function() go_org_imports() end,
	group = vim.api.nvim_create_augroup("go_org_imports", { clear = true })
})

-- add/delete and reorder Go imports
function go_org_imports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for cid, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
				vim.lsp.util.apply_workspace_edit(r.edit, enc)
			end
		end
	end
end

-- Go imports
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function() go_org_imports() end,
	group = vim.api.nvim_create_augroup("go_org_imports", { clear = true })
})

-- Auto format on save for all languages with support
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function() vim.lsp.buf.format() end,
	group = vim.api.nvim_create_augroup("lsp_document_format", { clear = true })
})
