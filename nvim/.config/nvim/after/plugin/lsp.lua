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
  inlay_hints = {
    enabled = true,
  },
  -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
  -- Be aware that you also will need to properly configure your LSP server to
  -- provide the code lenses.
  codelens = {
    enabled = false,
  },
  -- Enable lsp cursor word highlighting
  document_highlight = {
    enabled = true,
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
    vim.api.nvim_exec2(
      [[
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]],
      {}
    )
  end
end

vim.diagnostic.config(config)


local on_attach = function(client, bufnr)
  local builtin = require("telescope.builtin")
  local opts = { buffer = true, noremap = true }
  local keymap = vim.keymap.set
  keymap("n", "gd", builtin.lsp_definitions, opts)
  keymap("n", "gt", builtin.lsp_type_definitions, opts)
  keymap("n", "gI", builtin.lsp_implementations, opts)
  keymap("n", "gr", builtin.lsp_references, opts)
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gl", vim.diagnostic.open_float, opts)
  keymap("n", "gL", builtin.diagnostics, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "<leader>bf", "<cmd>lua vim.lsp.buf.format(nil, 100)<CR>", opts)
  keymap("n", "<leader>rr", vim.lsp.buf.rename, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<leader>k", vim.lsp.buf.signature_help, opts)
  keymap('n', '[d', vim.diagnostic.goto_prev, opts)
  keymap('n', ']d', vim.diagnostic.goto_next, opts)
  keymap('n', '<leader>ih', "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", opts)
  -- lsp_highlight_document(client)
end
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
-- require('ufo').setup()

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off"
      }
    }
  },
}
lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.ocamllsp.setup {
  cmd = { "ocamllsp" },
  filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", },
  root_dir = lspconfig.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
  settings = {
    codelens = { enable = true },
    InlayHints = {
      Designators = true,
      Enabled = true,
      ParameterNames = true,
      DeducedTypes = true,
    },
  },
}
lspconfig.hls.setup {
  on_attach = on_attach,
  capabilites = capabilities,
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
-- vim.cmd 'autocmd BufWritePre *.cpp lua vim.lsp.buf.format(nil, 100)'
-- vim.cmd 'autocmd BufWritePre *.c lua vim.lsp.buf.format(nil, 100)'
-- vim.cmd 'autocmd BufWritePre *.hpp lua vim.lsp.buf.format(nil, 100)'
-- vim.cmd 'autocmd BufWritePre *.h lua vim.lsp.buf.format(nil, 100)'
vim.cmd 'autocmd BufWritePre *.js* lua vim.lsp.buf.format(nil, 100)'
vim.cmd 'autocmd BufWritePre *.ts* lua vim.lsp.buf.format(nil, 100)'
vim.cmd 'autocmd BufWritePre *.lua lua vim.lsp.buf.format(nil, 100)'
-- vim.cmd 'autocmd BufWritePre *.py lua vim.lsp.buf.format(nil, 100)'

capabilities.textDocument.completion.completionItem.snippetSupport = true
