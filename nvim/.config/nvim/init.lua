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
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-omni",
      {
        "zbirenbaum/copilot-cmp",
        dependencies = { "copilot.lua" },
        config = function()
          require("copilot_cmp").setup()
        end
      },
      {
        "L3MON4D3/LuaSnip",
        -- build = "make install_jsregexp"
      },
      "ray-x/lsp_signature.nvim",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    -- event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          tex = false,
        }
      })
    end,
  },
  -- File Type Specific
  --  "Vimjas/vim-python-pep8-indent"
  "lervag/vimtex",
  -- "vimwiki/vimwiki",
  -- "windwp/nvim-ts-autotag",
  -- "nvim-neorg/neorg",
  -- "whonore/Coqtail",

  -- Visual
  -- { 'projekt0n/github-nvim-theme' },
  { "catppuccin/nvim", name = "catppuccin" },
  "nvim-lualine/lualine.nvim",
  {
    "akinsho/nvim-bufferline.lua",
    dependencies = {
      "catppuccin",
      "nvim-tree/nvim-web-devicons",
    }
  },
  -- "norcalli/nvim-colorizer.lua",

  -- Miscellanea
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      'kevinhwang91/promise-async'
    }
  },
  {
    "b3nj5m1n/kommentary",
    config = function()
      require('kommentary.config').configure_language("default", {
        prefer_single_line_comments = true,
      })
    end,
  },
  "kyazdani42/nvim-tree.lua",
  "mhinz/vim-startify",
  "akinsho/toggleterm.nvim",
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup {}
    end,
  },
  "windwp/nvim-autopairs",
  "kosayoda/nvim-lightbulb",
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup {}
    end,
  },
  {
    "danymat/neogen",
    config = function()
      require('neogen').setup {}
    end,
  },
  {
    "AckslD/swenv.nvim",
    dependencies = { "stevearc/dressing.nvim" },
    config = function()
      require('swenv').setup({
        -- Should return a list of tables with a `name` and a `path` entry each.
        -- Gets the argument `venvs_path` set below.
        -- By default just lists the entries in `venvs_path`.
        get_venvs = function(venvs_path)
          return require('swenv.api').get_venvs(venvs_path)
        end,
        -- Path passed to `get_venvs`.
        venvs_path = vim.fn.expand('~/venvs'),
        -- Something to do after setting an environment, for example call vim.cmd.LspRestart
        post_set_venv = nil,
      })
    end,
  }
}

local opts = {}

require("lazy").setup(plugins)

require "user.color"
require "user.keymaps"
