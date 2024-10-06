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

vim.api.nvim_create_augroup('jekyll_posts', {})
-- Sprinkle some light template on new Jekyll blog posts.
vim.api.nvim_create_autocmd({"BufNewFile"}, {
    group = "jekyll_posts",
    pattern = { "*/_posts/*.md"},
    command = "0r ~/.vim/skeleton/blog_post.skel"
})

-- I like my Markdown lines terminated at 80 paces.
vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = { "*.md"},
    command = "set colorcolumn=80"
})
