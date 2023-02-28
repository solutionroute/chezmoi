-- Nightfox colorscheme provides several; I'm using nordfox
return { 'EdenEast/nightfox.nvim',
	priority = 1000, -- let's have it load early
	config = function()
		require('nightfox').setup({
			options = {
				transparent = true,
				styles = {
					comments = "italic",
					-- keywords = "bold",
					-- types = "italic,bold",
				}
			},
			palettes = {
				nordfox = { bg1 = "#20242c", -- #2e3440 is the original
				},
			}
		})
		vim.cmd([[colorscheme nordfox]])
	end
}
