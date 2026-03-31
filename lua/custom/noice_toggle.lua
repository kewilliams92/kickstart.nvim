local M = {}

--- Returns the window ID of an open noice history window, or nil if none found.
--- Matches only on filetype == 'noice' to avoid false positives from buffer names.
function M.find_noice_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })
    if ft == 'noice' then
      return win
    end
  end
  return nil
end

--- Toggle the NoiceHistory view.
--- - If a noice window is open and it is not the last window, close it.
--- - If a noice window is open and it IS the last window, switch to a new empty buffer
---   (closing the window would be E444).
--- - If no noice window is open, open NoiceHistory.
function M.toggle_noice_history()
  local win = M.find_noice_win()
  if win then
    if #vim.api.nvim_list_wins() > 1 then
      vim.api.nvim_win_close(win, true)
    else
      -- Cannot close the last window; leave the window but swap to a blank buffer
      vim.cmd 'enew'
    end
  else
    vim.cmd 'NoiceHistory'
  end
end

return M
