return {
  "mhinz/vim-startify",
  config = function()
    vim.g.startify_session_dir = '~/.config/nvim/session'
    vim.g.startify_session_persistence = 0
  end
}
