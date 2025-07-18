return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup {
        -- size can be a number or function which is passed the current terminal
        size = 16,
        open_mapping = [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = 1,     -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = true,
        direction = 'horizontal',
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell,  -- change the default shell
        highlights = {
          -- Normal = {
          --   guibg = "#181825",
          -- },
          NormalFloat = {
            link = 'Normal'
          },
        },
        float_opts = {
          border = 'curved',
          winblend = 3,
          highlights = {
            border = "Normal",
            background = "Normal",
          }
        },
        winbar = {
          enabled = true,
          name_formatter = function(term) --  term: Terminal
            return term.name
          end
        },
      }
    end
  }
}
