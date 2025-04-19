return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'onsails/lspkind.nvim',
  },
  config = function()
    local cmp = require 'cmp'
    require('codeium').setup {}
    cmp.setup {
      formatting = {
        format = require('lspkind').cmp_format {
          mode = 'symbol',
          maxwidth = 50,
          ellipsis_char = '...',
          symbol_map = { Codeium = '' },
        },
      },
    }
  end,
}
