return {
  'smjonas/inc-rename.nvim',
  name = 'IncRename',
  config = function()
    require('inc_rename').setup {}
    vim.keymap.set('n', '<leader>cr', ':IncRename ')
  end,
}
