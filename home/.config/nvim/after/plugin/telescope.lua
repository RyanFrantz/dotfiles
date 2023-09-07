local builtin = require('telescope.builtin')
-- FIXME: I have ripgrep installed but telescope doesn't quite work as expected.
-- Note: See other methods, like builtin.git_files
-- (f)ind (f)iles
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- (f)ind (g)it files
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
-- (f)ile (s)earch
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("grep: ") })
end)
