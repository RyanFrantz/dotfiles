-- On open, jump to the cursor position of the place last edited.
-- ${SO}/questions/7894330/preserve-last-editing-position-in-vim
-- Possible positions:
-- g`. The exact position of the last edit.
-- g'. The beginning of the line of the last edit.
-- g`" The exact position on last save.
-- g'" The beginning of the line on last save.
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
      vim.api.nvim_exec("silent! normal! g'.", false)
    end,
})
