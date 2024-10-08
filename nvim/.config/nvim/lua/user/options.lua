--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.directory = "/home/fcomoreira/.vim/.tmp/"
vim.opt.backup = false
-- vim.opt.cmdheight = 0
vim.opt.confirm = true
vim.opt.undodir = "/home/fcomoreira/.vim/.undo/"
vim.o.updatetime = 250
vim.opt.undofile = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = false
vim.opt.wildmode = "longest:full,full"
vim.opt.shell = 'zsh'
vim.opt.wrap = false
vim.opt.iskeyword:append("-")
vim.opt.termguicolors = true

-- Folding
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = false

-- Single Bar and Winbar
vim.opt.laststatus = 3
vim.o.winbar = "%{%v:lua.require'user.winbar'.eval()%}"

-- nvim cmp
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append "c"


local vim = vim
local api = vim.api
local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup ' .. group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

local autoCommands = {
  -- other autocommands
  open_folds = {
    { "BufReadPost,FileReadPost", "*", "normal zR" }
  }
}

M.nvim_create_augroups(autoCommands)
