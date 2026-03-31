local _cached_key = nil

return {
  'milanglacier/minuet-ai.nvim',
  config = function(_, opts) require('minuet').setup(opts) end,
  opts = {
    provider = 'claude',
    n_completions = 1, -- request only 1 completion; default 3 triples API wait time
    throttle = 1000, -- ms cooldown between auto-requests (manual invocation always fires)
    debounce = 400, -- ms to wait after last keystroke before firing; reduces redundant requests
    provider_options = {
      claude = {
        api_key = function()
          if _cached_key then return _cached_key end
          local handle = io.popen 'gpg --quiet --decrypt /home/kwarch/.clearance/secrets.env.gpg 2>/dev/null | grep ANTHROPIC_API_KEY | cut -d= -f2'
          if not handle then return nil end
          local result = handle:read '*a'
          handle:close()
          local key = result and result:gsub('%s+$', '') or nil
          if key and key ~= '' then _cached_key = key end
          return key ~= '' and key or nil
        end,
        model = 'claude-haiku-4-5-20251001',
        name = 'claude',
        optional = {
          max_tokens = 256,
          top_p = 0.9,
        },
      },
    },
  },
}
