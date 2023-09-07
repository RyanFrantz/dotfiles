vim.g.mapleader = " "

-- Fire up netrw. fv = (f)ile (v)iew
vim.keymap.set("n", "<leader>fv", vim.cmd.Explore)
-- Clear search highlight.
vim.keymap.set("n", "<leader>,", ":nohlsearch<CR>", {noremap = true})
-- Move the cursor to the 80th column. I use this when fixing up markdown files.
vim.keymap.set("n", ",,", "80|", {noremap = true})
-- I paste often so this is a nice convenience.
vim.keymap.set("n", "<leader>p", ":set paste<CR>", {noremap = true})
vim.keymap.set("n", "<leader>n", ":set nopaste<CR>", {noremap = true})
-- Y in nvim is not your father's Y: https://github.com/neovim/neovim/pull/13268
vim.keymap.set("n", "Y", "Y", {noremap = true}) -- Yank complete lines.
