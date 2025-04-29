return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    require('bufferline').setup {
      options = {
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            highlight = 'Directory',
            separator = true,
          },
        },
      },
    }

    -- Keymaps for navigating buffers
    -- Navigate to previous buffer
    vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
    -- Navigate to next buffer
    vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
    -- Close current buffer
    vim.keymap.set('n', '<leader>bc', '<cmd>bdelete<CR>', { desc = 'Close buffer' })
    -- Go to buffer by index
    vim.keymap.set('n', '<leader>b1', '<cmd>BufferLineGoToBuffer 1<CR>', { desc = 'Go to buffer 1' })
    vim.keymap.set('n', '<leader>b2', '<cmd>BufferLineGoToBuffer 2<CR>', { desc = 'Go to buffer 2' })
    vim.keymap.set('n', '<leader>b3', '<cmd>BufferLineGoToBuffer 3<CR>', { desc = 'Go to buffer 3' })
    vim.keymap.set('n', '<leader>b4', '<cmd>BufferLineGoToBuffer 4<CR>', { desc = 'Go to buffer 4' })
    vim.keymap.set('n', '<leader>b5', '<cmd>BufferLineGoToBuffer 5<CR>', { desc = 'Go to buffer 5' })
    -- Pick buffer to go to
    vim.keymap.set('n', '<leader>bb', '<cmd>BufferLinePick<CR>', { desc = 'Pick buffer' })
    -- Sort buffers by directory
    vim.keymap.set('n', '<leader>bsd', '<cmd>BufferLineSortByDirectory<CR>', { desc = 'Sort buffers by directory' })
    -- Sort buffers by language
    vim.keymap.set('n', '<leader>bsl', '<cmd>BufferLineSortByExtension<CR>', { desc = 'Sort buffers by language' })
    -- Close buffer to the left
    vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseLeft<CR>', { desc = 'Close buffer to the left' })
    -- Close buffer to the right
    vim.keymap.set('n', '<leader>br', '<cmd>BufferLineCloseRight<CR>', { desc = 'Close buffer to the right' })
  end,
}
