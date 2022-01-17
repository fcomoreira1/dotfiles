local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'kyazdani42/nvim-web-devicons'
Plug 'b3nj5m1n/kommentary'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'mhinz/vim-startify'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-omni'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/nvim-cmp'
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
Plug 'kdheepak/lazygit.nvim'
Plug "vimwiki/vimwiki"
Plug ('glepnir/galaxyline.nvim' , {branch = 'main'})
Plug 'akinsho/nvim-bufferline.lua'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'akinsho/toggleterm.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

vim.call('plug#end')

require "options"
require "keymaps"
require "color"
require "lsp"
require "startify"
require "treesitter"
require "cmp-lsp"
require "vimtex"
require "user.lazygit"
require "ultisnips"
require "vimwiki"
require "user.galaxyline"
require "user.bufferline"
require "user.colorizer"
require "user.toggleterm"
