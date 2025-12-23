local bit = require('bit')

local function darken_color_int(color, amount)
  local r = bit.rshift(color, 16)
  local g = bit.band(bit.rshift(color, 8), 0xFF)
  local b = bit.band(color, 0xFF)

  r = math.max(r * (1 - amount), 0)
  g = math.max(g * (1 - amount), 0)
  b = math.max(b * (1 - amount), 0)

  local new_color = bit.bor(
    bit.lshift(r, 16),
    bit.lshift(g, 8),
    b
  )

  return new_color
end

local function setup_winbar_highlights()
  local source_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
  local inactive_source_hl = vim.api.nvim_get_hl(0, { name = "StatusLineNC" })

  local fg_color = string.format("#%06x", source_hl.fg)
  local inactive_fg_color = string.format("#%06x", inactive_source_hl.fg)
  local bg_color = string.format("#%06x", darken_color_int(source_hl.bg, 0.1))
  local bg_dark_color = string.format("#%06x", darken_color_int(source_hl.bg, 0.45))

  vim.api.nvim_set_hl(0, "WinBar", {
    fg = fg_color,
    bg = bg_color,
    bold = true,
  })
  vim.api.nvim_set_hl(0, "WinBarNC", {
    fg = inactive_fg_color,
    bg = bg_color,
    bold = false,
  })
  vim.api.nvim_set_hl(0, "WinBarBG", {
    fg = inactive_fg_color,
    bg = bg_dark_color,
    bold = false,
  })
end

local function should_skip_winbar()
  local buftype = vim.bo.buftype
  local filetype = vim.bo.filetype

  local skipped_filetypes = {
    "neo-tree", -- Neo-tree's filetype
    "NvimTree", -- The older NvimTree plugin
    "lazy",     -- Plugin manager windows
    "packer",
    "git",
    "fugitive",
    "lspinfo",
    "DressingSelect",
    "noice",
    "dashboard",
  }

  local skipped_buftypes = {
    "nofile",   -- help, quickfix, scratch buffers
    "prompt",   -- command line/search prompts
    "terminal", -- terminal windows
  }

  for _, ft in ipairs(skipped_filetypes) do
    if filetype == ft then
      return true
    end
  end

  for _, bt in ipairs(skipped_buftypes) do
    if buftype == bt then
      return true
    end
  end
  return false
end

local function get_file_icon()
  local devicons_status, devicons = pcall(require, "nvim-web-devicons")
  if not devicons_status then
    return ""
  end

  local bufname = vim.fn.bufname()
  local ext = vim.fn.fnamemodify(bufname, ":e")

  local icon, hl_group = devicons.get_icon(bufname, ext, { default = true })

  if icon and hl_group then
    return string.format("%%#%s# %s ", hl_group, icon)
  end
  return "  "
end

local function get_relative_path()
  local current_file = vim.api.nvim_buf_get_name(0)

  local cwd = vim.fn.getcwd()

  if current_file == "" then
    return "[No Name]"
  end

  local cwd_pattern = cwd
  if not string.match(cwd, "[/\\]$") then
    cwd_pattern = cwd .. "/"
  end

  local relative_path = string.gsub(current_file, "^" .. cwd_pattern, "", 1)

  if relative_path == current_file then
    return vim.fn.fnamemodify(current_file, ":t")
  end

  return relative_path
end

local function set_winbar_callback()
  if should_skip_winbar() then
    vim.opt_local.winbar = ""
    return
  end

  vim.opt_local.winbar = string.format("    %s%%*%s    %%#WinBarBG# %%=", get_file_icon(), get_relative_path())
end

local winbar_augroup = vim.api.nvim_create_augroup("WinBarControl", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  group = winbar_augroup,
  callback = set_winbar_callback,
})


vim.api.nvim_create_autocmd("ColorScheme", {
  callback = setup_winbar_highlights,
})
setup_winbar_highlights()
