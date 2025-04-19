return {
  'Shobhit-Nagpal/nvim-rafce',
  config = function()
    require 'rafce'
  end,
  keys = {
    { '<leader>rafce', '<cmd>Rafce<cr>', desc = 'Rafce (React functional component with arrow function and export at bottom)' },
    { '<leader>rfce', '<cmd>Rfce<cr>', desc = 'Rfce (React functional component with export at bottom)' },
    { '<leader>rfc', '<cmd>Rfc<cr>', desc = 'Rfc (React functional component)' },
  },
}
