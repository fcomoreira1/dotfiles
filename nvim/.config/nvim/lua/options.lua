vim.opt.directory = "/home/fcomoreira/.vim/.tmp/"
vim.opt.backup = false
vim.opt.undodir = "/home/fcomoreira/.vim/.undo/"
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.cmd 'autocmd BufEnter *.py setlocal tabstop=2 shiftwidth=2'
vim.cmd 'autocmd BufEnter *.c* setlocal tabstop=2 shiftwidth=2'
vim.o.expandtab = true
vim.opt.number = true
vim.opt.hidden = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.foldenable = false
vim.opt.showmode = false
vim.opt.wildmode = "longest:full,full"
vim.opt.wrap = false
-- nvim cmp
vim.opt.completeopt = {"menu", "menuone", "noinsert", "noselect"}
vim.opt.shortmess:append "c"

vim.cmd 'autocmd VimEnter * :silent exec "!kill -s WINCH $PPID"'
