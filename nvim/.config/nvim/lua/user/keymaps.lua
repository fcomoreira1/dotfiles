local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Quality of Life
keymap("n", "x", '"_x', opts)
keymap("n", "<C-Left>", ":tabprevious<CR>", opts)
keymap("n", "<C-Right>", ":tabnext<CR>", opts)
keymap("n", "Q", ":noh<CR>", opts)
keymap("v", "<C-c>", '"+y', opts)
keymap("", "<C-v>", '"+p', opts)
keymap("i", "<C-v>", '"+p', opts)
keymap("n", "<C-b>", '<C-v>', opts)
keymap("n", "<F11>", ':set spell!<CR>', opts)
keymap("i", "<F11>", '<C-O>:set spell!<CR>', opts)
keymap("i", "<C-l>", '<c-g>u<Esc>[s1z=`]a<c-g>u', opts)

keymap('n', '<PageUp>', '<NOP>', { noremap = true, silent = true })
keymap('n', '<PageDown>', '<NOP>', { noremap = true, silent = true })
keymap('i', '<PageUp>', '<NOP>', { noremap = true, silent = true })
keymap('i', '<PageDown>', '<NOP>', { noremap = true, silent = true })
keymap("n", "<S-Up>", "k", opts)
keymap("n", "<S-Down>", "j", opts)
keymap("n", "<S-Left>", "l", opts)
keymap("n", "<S-Right>", "h", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<Esc>", "<C-\\><C-N>", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)

-- Undo breakpoints
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Keep it centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Plugins
keymap("n", "<C-f>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>\\", "<cmd>2.ToggleTerm direction=float<CR>", opts)

-- Ultisnips
--[[ vim.g.UltiSnipsListSnippets = "<C-a>"
vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
keymap("i", "<C-Tab>", "<Plug>(ultisnips_jump_forward)", opts)
vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
vim.g.UltiSnipsRemoveSelectModeMappings = 0 ]]
