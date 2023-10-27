require 'nvim-web-devicons'.get_icons()
require('bufferline').setup {
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
  options = {
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    view = "default",
    diagnostics = "nvim_lsp",
    indicator = {
      style = 'underline',
    },
    --[[ diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end ]]
  },
}
vim.api.nvim_set_keymap('n', 'b[', ':BufferLineCycleNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'b]', ':BufferLineCyclePrev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gb', ':BufferLinePick<CR>', { noremap = true })
