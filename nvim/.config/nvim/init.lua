require "user.options"

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

local plugins = {
  -- Treesitter
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-context",

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-omni",
  "SirVer/ultisnips",
  "quangnguyen30192/cmp-nvim-ultisnips",
  "ray-x/lsp_signature.nvim",
  "j-hui/fidget.nvim",

  -- File Type Specific
  --  "Vimjas/vim-python-pep8-indent"
  "lervag/vimtex",
  "vimwiki/vimwiki",
  "windwp/nvim-ts-autotag",
  "nvim-neorg/neorg",
  "whonore/Coqtail",

  -- Visual
  "nvim-lualine/lualine.nvim",
  "akinsho/nvim-bufferline.lua",
  "norcalli/nvim-colorizer.lua",
  "navarasu/onedark.nvim",

  -- Miscellanea
  "b3nj5m1n/kommentary",
  "kyazdani42/nvim-tree.lua",
  "mhinz/vim-startify",
  "kdheepak/lazygit.nvim",
  "akinsho/toggleterm.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "windwp/nvim-autopairs",
  "antoinemadec/FixCursorHold.nvim",
  "kosayoda/nvim-lightbulb",
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup {}
    end,
  },
  "danymat/neogen",
  "mbbill/undotree",
}

local opts = {}

require("lazy").setup(plugins)

require "user.color"
require "user.keymaps"
