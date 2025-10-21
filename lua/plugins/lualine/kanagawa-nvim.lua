local kcolors = require("kanagawa.colors").setup()

local colors = {
  white         = kcolors.theme.ui.fg,
  red           = kcolors.palette.peachRed,
  green         = kcolors.palette.springGreen,
  blue          = kcolors.palette.dragonBlue,
  yellow        = kcolors.palette.carpYellow,
	verylightgray = kcolors.theme.ui.bg_p1,
  lightgray     = kcolors.theme.ui.bg_m1,
  gray          = kcolors.theme.ui.bg_m2,
  darkgray      = kcolors.theme.ui.bg_m3,
}

return {
  normal = {
    a = {bg = colors.blue, fg = colors.darkgray, gui = 'bold'},
    b = {bg = colors.verylightgray, fg = colors.blue},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  insert = {
    a = {bg = colors.green, fg = colors.darkgray, gui = 'bold'},
    b = {bg = colors.verylightgray, fg = colors.green},
    c = {bg = colors.lightgray, fg = colors.white, gui = 'italic'},
    x = {bg = colors.lightgray, fg = colors.white}
  },
  visual = {
    a = {bg = colors.yellow, fg = colors.darkgray, gui = 'bold'},
    b = {bg = colors.verylightgray, fg = colors.yellow},
    c = {bg = colors.lightgray, fg = colors.white}
  },
  replace = {
    a = {bg = colors.red, fg = colors.darkgray, gui = 'bold'},
    b = {bg = colors.verylightgray, fg = colors.red},
    c = {bg = colors.lightgray, fg = colors.white, gui = 'italic'},
    x = {bg = colors.lightgray, fg = colors.white}
  },
  command = {
    a = {bg = colors.green, fg = colors.darkgray, gui = 'bold'},
    b = {bg = colors.verylightgray, fg = colors.green},
    c = {bg = colors.lightgray, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.gray},
    c = {bg = colors.darkgray, fg = colors.gray}
  }
}
