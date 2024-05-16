return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup {
      timeout = 10000,
    }
    -- dismiss notifications
    vim.keymap.set('n', '<leader>nn', function()
      require('notify').dismiss { silent = true, pending = true }
    end, { desc = 'Dismiss notification' })
  end,
}
