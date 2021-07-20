require 'nvim-web-devicons'.get_icons()
require'bufferline'.setup{
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        view = "default",
        diagnostics = "nvim_lsp"
    }
}
vim.api.nvim_set_keymap('n', 'b[', ':BufferLineCycleNext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'b]', ':BufferLineCyclePrev<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'gb', ':BufferLinePick<CR>', {noremap = true})
