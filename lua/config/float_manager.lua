--- Manages a single active floating window at a time.
--- Ensures only one float is visible; closes/hides the current one before opening another.

local M = {}

--- @class FloatEntry
--- @field name string
--- @field close fun()       called to close/hide the window
--- @field is_open fun(): boolean  returns false when the window was closed externally

--- @type FloatEntry | nil
local current = nil

--- Toggle a named floating window.
---
--- When called:
--- - If the tracked float was already closed externally (is_open() == false),
---   the stale entry is discarded and the new one is opened unconditionally.
--- - If the same float is still open, it is closed and nothing new is opened.
--- - If a different float is still open, it is closed first, then the new one opens.
---
--- @param name       string         Unique identifier for this float
--- @param open_fn    fun()          Called to open the window
--- @param close_fn   fun()          Called to close/hide the window
--- @param is_open_fn fun(): boolean  Returns true while the window is visible (optional, defaults to always true)
function M.toggle(name, open_fn, close_fn, is_open_fn)
  is_open_fn = is_open_fn or function() return true end

  if current ~= nil then
    if not current.is_open() then
      -- closed externally — discard stale state, always open
      current = nil
    else
      local same = current.name == name
      current.close()
      current = nil
      if same then
        return
      end
    end
  end

  open_fn()
  current = { name = name, close = close_fn, is_open = is_open_fn }
end

--- Close whatever float is currently open (no-op if none).
function M.close_current()
  if current ~= nil then
    if current.is_open() then
      current.close()
    end
    current = nil
  end
end

--- Return the name of the currently open float, or nil.
--- @return string | nil
function M.current_name()
  if current ~= nil and not current.is_open() then
    current = nil
  end
  return current and current.name or nil
end

return M
