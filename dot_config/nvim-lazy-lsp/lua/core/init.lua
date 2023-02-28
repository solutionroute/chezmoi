-- nvim/core/init.lua
-- This script uses lazy.nvim to define and lazy-load all plugins. I'm not as
-- interested in lazy-loading for performance, but prefer the configuration
-- approach lazy.nvim takes.
--
-- A few globals are set at the start to satisfy certain plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.termguicolors = true
vim.o.fileencoding = 'utf-8'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print '                                          '
	print '                     d8b                  '
	print '                     Y8P                  '
	print '                                          '
	print '    8888b.  888  888 888 88888b.d88b.     '
	print '    88 "88b 888  888 888 888 "888 "88b    '
	print '    88  888 Y88  88P 888 888  888  888    '
	print '    88  888  Y8bd8P  888 888  888  888    '
	print '    88  888   Y88P   888 888  888  888    '
	print '                                          '
	print '            Bootstrapping nvim            '
	print '                                          '
	print '     lazy.nvim installing plugins...      '
	print '                                          '
	print '                                          '
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Everything in core/plugins is loaded automatically.
require('lazy').setup('core.plugins')

-- Finally, we load options, mapping and autocommands.
require('core.options')
require('core.mapping')
require('core.autocommands')
