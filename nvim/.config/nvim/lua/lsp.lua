local lspconfig = require('lspconfig')

local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
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

vim.diagnostic.config(config)

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
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

local on_attach = function(client, bufnr)
    local opts = { noremap = true }
    local keymap = vim.api.nvim_set_keymap
    keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap("n", "<space>s", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    keymap("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap("n", "<C-l>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap("n", "<C-n>", "<cmd>lua vim.lsp.buf.goto_prev()<CR>", opts)
    keymap("n", "<C-p>", "<cmd>lua vim.lsp.buf.goto_next()<CR>", opts)
    keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

    lsp_highlight_document(client)
end
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.pyright.setup{
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
lspconfig.intelephense.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities, 
}
lspconfig.tsserver.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}
vim.cmd 'autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)'

capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.cssls.setup { 
    on_attach = on_attach,
    capabilities = capabilities, 
}
lspconfig.html.setup { 
    on_attach = on_attach,
    capabilities = capabilities, 
}

-- Auxiliary plugins

require('lsp_signature').setup({
    max_height = 4,
    max_width = 119,
    toggle_key = "<c-x>",
    transparency = 29
})
