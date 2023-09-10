-- Note to self: Neovim supports EditorConfig by default.
-- vim.g.editorconfig = true

-- Set options.
local opt = vim.opt -- Save us some keystrokes.

-- TODO: Consider a lualine plugin. Live a little!
local statusline ="%<%F |"                       -- File name, truncated if need be.
statusline = statusline .. " Col: %c |"          -- Column number.
statusline = statusline .. " %l/%L lines [%P]"   -- Percentage through the file.
opt.statusline = statusline

-- Some inspiration from primeagen and ↓ 
-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/options.lua
opt.number = true           -- Show line number
opt.showmatch = true        -- Highlight matching parenthesis
opt.colorcolumn = '80'      -- Line length marker at 80 columns
opt.ignorecase = true       -- Ignore case letters when search
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus = 2            -- always show
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Shift 2 spaces when tab
opt.tabstop = 2             -- 1 tab == 2 spaces
opt.smartindent = true      -- Autoindent new lines
opt.updatetime = 250        -- ms to wait for trigger an event
opt.scrolloff = 99          -- Keep the cursor in the middle of the screen
opt.swapfile = false        -- Don't use swapfile
opt.incsearch = true
opt.cursorline = true       -- Highlight the current line
opt.guicursor = ""          -- Juicy cursor even in edit mode.
opt.signcolumn = "auto"     -- auto = only when something to display; default
