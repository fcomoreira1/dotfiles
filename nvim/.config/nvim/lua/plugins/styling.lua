return
{
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup({
        style = 'darker'
      })
      require('onedark').load()
    end
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  -- },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local lualine = require('lualine')

      lualine.setup {
        options = {
          theme = 'onedark',
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'swenv',
            { 'diagnostics', symbols = { error = " ", warn = " ", info = " ", hint = " " }, }, },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end
  },
  {
    {
      "akinsho/nvim-bufferline.lua",
      config = function()
        require 'nvim-web-devicons'.get_icons()
        vim.opt.termguicolors = true
        -- local mocha = require("catppuccin.palettes").get_palette("mocha")
        require('bufferline').setup {
          -- highlights = require("catppuccin.groups.integrations.bufferline").get({
          --   styles = { "bold" },
          -- }),
          options = {
            offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
            separator = "thick",
            view = "default",
            -- diagnostics = "nvim_lsp",
            indicator = {
              icon = '| ',
              style = 'icon',
            },
          },
        }
        vim.api.nvim_set_keymap('n', 'gb', ':BufferLinePick<CR>', { noremap = true })
      end,
      dependencies = {
        -- "catppuccin",
        "nvim-tree/nvim-web-devicons",
      }
    }
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      'kevinhwang91/promise-async'
    },
    config = function()
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ('  %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
      end

      -- global handler
      -- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
      -- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
      require('ufo').setup({
        fold_virt_text_handler = handler
      })
    end
  },
}
