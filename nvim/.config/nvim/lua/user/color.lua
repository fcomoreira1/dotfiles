-- vim.cmd('colorscheme onedark')
require('onedark').setup {
  style = 'darker',
  -- transparent = true,
  lualine = {
    transparent = false, -- lualine center bar transparency
  },
}
require('onedark').load()

-- Syntax highlighting
vim.cmd 'autocmd BufNewFile,BufRead *.rasi setf css'
vim.cmd 'autocmd BufNewFile,BufRead *.conf setf conf'
vim.cmd 'autocmd BufNewFile,BufRead config setf cfg'
