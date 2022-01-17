vim.opt.termguicolors = true
vim.cmd 'colorscheme onedark'
vim.g.onedark_termcolors = 256
vim.g.onedark_italics = 2

-- Syntax highlighting
vim.cmd 'autocmd BufNewFile,BufRead *.rasi setf css'
vim.cmd 'autocmd BufNewFile,BufRead *.conf setf conf'
vim.cmd 'autocmd BufNewFile,BufRead config setf cfg'
