-- vim.opt.foldenable = true
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
if not vim.g.vscode then
  -- VSCode Neovim
  vim.keymap.set("n", "<leader>pe", require('swenv.api').pick_venv, { noremap = true })
end
