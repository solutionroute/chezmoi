-- see: https://github.com/JoosepAlviste/nvim-ts-context-commentstring/blob/main/lua/ts_context_commentstring/integrations/comment_nvim.lua#L39
-- TODO - test embedded langs
return {
	{ 'numToStr/Comment.nvim',
		dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
		opts = {
			pre_hook = function(ctx)
				local U = require('Comment.utils')
				local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'
				local location = nil
				if ctx.ctype == U.ctype.blockwise then
					location = {
						ctx.range.srow - 1,
						ctx.range.scol,
					}
				elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
					location = require("ts_context_commentstring.utils").get_visual_start_location()
				end
				return require("ts_context_commentstring.internal").calculate_commentstring {
					key = type,
					location = location,
				}
			end,
		}
	},
}
