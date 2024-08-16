return {
  "kyazdani42/nvim-tree.lua",
  config = function()
    require 'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
      auto_reload_on_write = true,
      create_in_closed_folder = false,
      disable_netrw = false,
      hijack_cursor = false,
    }
  end
}
