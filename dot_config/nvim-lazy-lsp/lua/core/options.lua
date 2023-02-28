-- nvim/lua/core/options.lua
-- default options; include this BEFORE plugins are loaded - see core/init.lua

-- Note: options, mappings and autocommands can be overridden in
-- nvim/lua/user/config.lua - see nvim/user-config-example.lua

local opt = vim.opt

-- options list borrowed from AstroNvim, with adjustments
opt.backspace = vim.opt.backspace + { 'nostop' } -- Don't stop backspace at insert
opt.clipboard = 'unnamedplus' -- Connection to the system clipboard
opt.cmdheight = 1 -- (0 will hide command line unless needed)
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.copyindent = true -- Copy the previous indentation on autoindenting
opt.cursorline = true -- Highlight the text line of the cursor
opt.expandtab = false -- do not replace tabs with spaces
opt.fillchars = { eob = ' ' } -- Disable `~` on nonexistent lines
opt.history = 100 -- Number of commands to remember in a history table
opt.ignorecase = true -- Case insensitive searching
opt.laststatus = 2 -- 2 always, 3 global status rather than per window
opt.lazyredraw = true -- lazily redraw screen
opt.mouse = 'a' -- Enable mouse support
opt.number = true -- Show numberline
opt.preserveindent = true -- Preserve indent structure as much as possible
opt.pumheight = 10 -- Height of the pop up menu
opt.relativenumber = true -- a love or hate thing
opt.scrolloff = 8 -- Number of lines to keep above and below the cursor
opt.shiftwidth = 4 -- Default for indentation, ftypes may override
opt.showmode = true -- Enable showing modes in command line
opt.showtabline = 0 -- don't use vim tabline
opt.sidescrolloff = 8 -- Number of columns to keep at the sides of the cursor
opt.signcolumn = 'yes' -- Always show the sign column
opt.smartcase = true -- Case (in)sensitive searching unless SearcHing
opt.splitbelow = true -- Splitting a new window below the current one
opt.splitright = true -- Splitting a new window at the right of the current one
opt.swapfile = false -- Disable use of swapfile for the buffer
opt.tabstop = 4 -- tabs on screen; doesn't change occurences of tab in file
opt.termguicolors = true -- Enable 24-bit RGB color
opt.timeoutlen = 250 -- Length of time to wait for a mapped sequence to complete
opt.undofile = true -- Enable persistent undo
opt.updatetime = 2000 -- Length of time to wait before writing swapfile (if being written)
opt.wrap = false -- Disable wrapping of lines longer than the width of window
opt.writebackup = false -- Disable making a backup before overwriting a file
