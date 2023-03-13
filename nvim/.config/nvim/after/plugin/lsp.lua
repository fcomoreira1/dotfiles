local lspconfig = require('lspconfig')

local config = {
  -- disable virtual text
  virtual_text = false,
  -- show signs
  --[[ signs = {
      active = signs,
    }, ]]
  update_in_insert = true,
  underline = {
    severity = { min = vim.diagnostic.severity.WARN }
  },
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
})

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]],
      false
    )
  end
end

vim.diagnostic.config(config)

local on_attach = function(client, bufnr)
  local opts = { buffer = true, noremap = true }
  local keymap = vim.keymap.set
  keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap("n", "gaL", "<cmd>TroubleToggle workspace_diagnostics<CR>", opts)
  keymap("n", "gL", "<cmd>TroubleToggle<CR>", opts)
  keymap("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts)
  keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  keymap("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap("n", "<leader>l", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- lsp_highlight_document(client)
end
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      --[[ analysis = {
                typeCheckingMode = "off"
            } ]]
    }
  },
}
lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.hls.setup {
  on_attach = on_attach,
  capabilites = capabilities,
}
lspconfig.ltex.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities
}
lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
vim.cmd 'autocmd BufWritePre *.cpp lua vim.lsp.buf.format(nil, 100)'
vim.cmd 'autocmd BufWritePre *.c lua vim.lsp.buf.format(nil, 100)'
vim.cmd 'autocmd BufWritePre *.hpp lua vim.lsp.buf.format(nil, 100)'
vim.cmd 'autocmd BufWritePre *.h lua vim.lsp.buf.format(nil, 100)'
vim.cmd 'autocmd BufWritePre *.js* lua vim.lsp.buf.format(nil, 100)'
vim.cmd 'autocmd BufWritePre *.ts* lua vim.lsp.buf.format(nil, 100)'
vim.cmd 'autocmd BufWritePre *.lua lua vim.lsp.buf.format(nil, 100)'

capabilities.textDocument.completion.completionItem.snippetSupport = true
