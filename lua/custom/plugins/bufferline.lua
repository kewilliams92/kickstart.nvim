return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- show buffers (not tabs)
        numbers = 'ordinal', -- show buffer numbers
        close_command = 'bdelete! %d', -- close buffer on click
        right_mouse_command = 'bdelete! %d',
        left_mouse_command = 'buffer %d',
        middle_mouse_command = nil,
        indicator = {
          icon = '▎',
          style = 'icon',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        diagnostics = 'nvim_lsp', -- show LSP diagnostics in bufferline
        diagnostics_update_in_insert = false,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            separator = true,
          },
        },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = 'slant', -- options: 'slant', 'slope', 'thick', 'thin'
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'insert_after_current', -- keep new buffers next to current
      },
    }

    -- Keymaps for navigating buffers
    local map = vim.keymap.set
    map('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
    map('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Prev buffer' })
    map('n', '<leader>bp', '<cmd>BufferLineTogglePin<CR>', { desc = 'Toggle pin buffer' })
    map('n', '<leader>bP', '<cmd>BufferLineGroupClose ungrouped<CR>', { desc = 'Close unpinned buffers' })
  end,
}
