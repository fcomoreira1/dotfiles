local M = {}

-- vim.api.nvim_set_hl(0, 'WinBarPath', { bg = '#dedede', fg = '#363636' })
vim.api.nvim_set_hl(0, 'WinBar', { fg = '#f2cdcd', bg = "#181825" })
vim.api.nvim_set_hl(0, 'WinBarNC', { fg = '#cdd6f4', bg = "#1e1e2e" })

function M.eval()
  local file_path = vim.api.nvim_eval_statusline('%f', {}).str
  local modified = vim.api.nvim_eval_statusline('%M', {}).str == '+' and '[+]' or ''

  file_path = file_path:gsub('/', ' ➤ ')

  return '%#WinBarPath#'
      .. file_path
      .. '%*'
      .. '%#WinBarModified#'
      .. modified
      .. '%*'
end

return M
