local M = {}

--- @type snacks.win|nil
local last_win = nil

--- @type (fun(): snacks.win)|nil
local last_func = nil

--- @param open_fn fun(): snacks.win
function M.wrap(open_fn)
  return function()
    -- Hide any currently visible window from a different opener
    if last_win ~= nil and last_win:valid() and last_func ~= open_fn then
      last_win:hide()
      last_win = nil
    end

    -- Toggle: if same opener and window is visible, hide it
    if last_func == open_fn and last_win ~= nil and last_win:valid() then
      last_win:hide()
      last_win = nil
      last_func = nil
      return
    end

    -- Open
    last_func = open_fn
    last_win = open_fn()
  end
end

return M
