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
    -- Folks love treesitter for improved syntax highlighting. Try it.
    {
      'nvim-treesitter/nvim-treesitter',
      config = function()
      vim.cmd [[TSUpdate]]
      end,
    },
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
      }
    },
    -- Close pairs of things. Consider "windwp/nvim-autopairs" if we want to get
    -- super fancy and advanced.
    {
      "m4xshen/autoclose.nvim",
    },
    {
      "tpope/vim-fugitive"
    },
}

require("lazy").setup(plugins)
