return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  init = function()
    vim.filetype.add {
      extension = {
        jsx = 'javascriptreact',
        tsx = 'typescriptreact',
      },
    }
  end,
  opts = {
    on_attach = function(client, bufnr)
      -- gd / gf: jump to the actual source file, skipping .d.ts declaration files
      local go_to_source = require('typescript-tools.api').go_to_source_definition
      vim.keymap.set('n', 'gd', go_to_source, { buffer = bufnr, desc = 'LSP: Go to Source Definition' })
      vim.keymap.set('n', 'gf', go_to_source, { buffer = bufnr, desc = 'LSP: Go to File (Source Definition)' })
    end,
    settings = {
      tsserver_file_preferences = {
        importModuleSpecifierPreference = 'non-relative',
      },
    },
  },
}
