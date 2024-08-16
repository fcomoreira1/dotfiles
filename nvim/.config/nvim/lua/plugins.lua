return {
  -- File Type Specific
  "lervag/vimtex",
  -- "nvim-neorg/neorg",
  -- "whonore/Coqtail",
  {
    "b3nj5m1n/kommentary",
    config = function()
      require('kommentary.config').configure_language("default", {
        prefer_single_line_comments = true,
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup {}
    end,
  },
  "kosayoda/nvim-lightbulb",
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
    config = true,
  }
}
