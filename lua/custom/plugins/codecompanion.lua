return {
  'olimorris/codecompanion.nvim',
  version = '^19.0.0',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('codecompanion').setup {
      display = {
        action_palette = {
          width = 95,
          height = 10,
          prompt = 'Prompt ', -- Prompt used for interactive LLM calls
          provider = 'default', -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
          opts = {
            show_preset_actions = true, -- Show the preset actions in the action palette?
            show_preset_prompts = true, -- Show the preset prompts in the action palette?
            title = 'CodeCompanion actions', -- The title of the action palette
          },
        },
      },
      adapters = {
        http = {
          anthropic = function()
            return require('codecompanion.adapters').extend('anthropic', {
              env = {
                api_key = 'cmd:gpg --batch --quiet --decrypt /home/kwarch/.clearance/secrets.env.gpg | grep ANTHROPIC_API_KEY | cut -d= -f2',
              },
            })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = {
            name = 'anthropic',
            model = 'claude-sonnet-4-6',
          },
        },
        inline = {
          adapter = {
            name = 'anthropic',
            model = 'claude-sonnet-4-6',
          },
          keymaps = {
            accept_change = {
              modes = { n = 'ga' },
              description = 'Accept the suggested change',
            },
            reject_change = {
              modes = { n = 'gr' },
              description = 'Reject the suggested change',
            },
          },
        },
        cli = {
          agent = 'claude_code',
          agents = {
            claude_code = {
              cmd = 'claude',
              description = 'Claude Code CLI',
              provider = 'terminal',
            },
          },
        },
        rules = {
          default = {
            description = 'Collection of common files for all projects',
            files = {
              '.clinerules',
              '.cursorrules',
              '.goosehints',
              '.rules',
              '.windsurfrules',
              '.github/copilot-instructions.md',
              'AGENT.md',
              'AGENTS.md',
              { path = 'CLAUDE.md', parser = 'claude' },
              { path = 'CLAUDE.local.md', parser = 'claude' },
              { path = '~/.claude/CLAUDE.md', parser = 'claude' },
            },
            is_preset = true,
          },
          opts = {
            chat = {
              autoload = 'default', -- The rule groups to load
              enabled = true,
            },
          },
        },
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>ci', ':CodeCompanion ', { desc = 'CodeCompanion Inline' })
    vim.keymap.set({ 'n', 'v' }, '<leader>cc', ':CodeCompanionChat Toggle<CR>', { desc = 'CodeCompanion Chat Toggle' })
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', ':CodeCompanionActions<CR>', { desc = 'CodeCompanion Actions' })
    vim.keymap.set('v', '<leader>cv', ':CodeCompanionChat Add<CR>', { desc = 'CodeCompanion Add to Chat' })
  end,
}
