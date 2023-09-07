-- Bootstrap the lazy.nvim plugin manager.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = {
    {
      "nvim-telescope/telescope.nvim", tag = "0.1.2",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
      "bluz71/vim-nightfly-colors",
      -- Set colorscheme on plugin load.
      config = function()
          vim.cmd [[colorscheme nightfly]]
      end,
      lazy = false,
      priority = 1000  -- Load before other plugins
    },
}

require("lazy").setup(plugins)