-- {{{ Main
theme = {}
theme.default_themes_path = "/usr/share/awesome/themes"
theme.icon_dir            = os.getenv("HOME") .. "/.config/awesome/icons"
theme.wallpaper           = os.getenv("HOME") .. "/.config/awesome/wall.jpg"

theme.colors = {}
theme.colors.light_blue   = "#3498DB"
theme.colors.blue         = "#2980B9"
theme.colors.dark_blue    = "#2C3E50"
theme.colors.red          = "#E74C3C"
theme.colors.almost_white = "#ECF0F1"
theme.colors.darker_white = "#A8ABA0"
-- }}}


-- {{{ Styles
theme.font      = "Open Sans 9"

-- {{{ Colors
theme.fg_normal  = theme.colors.dark_blue
theme.bg_normal  = theme.colors.almost_white

theme.fg_focus   = theme.colors.almost_white
theme.bg_focus   = theme.colors.dark_blue

theme.fg_urgent  = theme.colors.almost_white
theme.bg_urgent  = theme.colors.red

theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = "1"
theme.border_normal = theme.bg_normal
theme.border_focus  = theme.bg_focus
theme.border_marked = theme.bg_urgent
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = theme.bg_focus
theme.titlebar_bg_normal = theme.bg_normal
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = theme.colors.green
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "30"
theme.menu_width  = "150"
-- }}}

-- {{{ Layout
theme.layout_tile       = theme.icon_dir.."/layouts/tile.png"
theme.layout_tileleft   = theme.icon_dir.."/layouts/tileleft.png"
theme.layout_tilebottom = theme.icon_dir.."/layouts/tilebottom.png"
theme.layout_tiletop    = theme.icon_dir.."/layouts/tiletop.png"
theme.layout_fairv      = theme.icon_dir.."/layouts/fairv.png"
theme.layout_fairh      = theme.icon_dir.."/layouts/fairh.png"
theme.layout_spiral     = theme.icon_dir.."/layouts/spiral.png"
theme.layout_dwindle    = theme.icon_dir.."/layouts/dwindle.png"
theme.layout_max        = theme.icon_dir.."/layouts/max.png"
theme.layout_fullscreen = theme.icon_dir.."/layouts/fullscreen.png"
theme.layout_magnifier  = theme.icon_dir.."/layouts/magnifier.png"
theme.layout_floating   = theme.icon_dir.."/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = theme.default_themes_path.."/default/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.default_themes_path.."/default/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = theme.default_themes_path.."/default/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.default_themes_path.."/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = theme.default_themes_path.."/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.default_themes_path.."/default/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = theme.default_themes_path.."/default/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.default_themes_path.."/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = theme.default_themes_path.."/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.default_themes_path.."/default/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = theme.default_themes_path.."/default/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.default_themes_path.."/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = theme.default_themes_path.."/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.default_themes_path.."/default/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = theme.default_themes_path.."/default/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.default_themes_path.."/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.default_themes_path.."/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.default_themes_path.."/default/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}


-- theme.widget_bg                     = theme.icon_dir .. "/bg_focus_noline.png"
theme.awesome_icon                  = theme.icon_dir .. "/awesome_icon.png"
theme.vol_bg                        = theme.icon_dir .. "/vol_bg.png"
theme.menu_submenu_icon             = theme.icon_dir .. "/submenu.png"
theme.last                          = theme.icon_dir .. "/last.png"
theme.bar                           = theme.icon_dir .. "/bar.png"
theme.bottom_bar                    = theme.icon_dir .. "/bottom_bar.png"
theme.clock                         = theme.icon_dir .. "/clock.png"
theme.calendar                      = theme.icon_dir .. "/cal.png"
theme.cpu                           = theme.icon_dir .. "/cpu.png"
theme.net_up                        = theme.icon_dir .. "/net_up.png"
theme.net_down                      = theme.icon_dir .. "/net_down.png"

return theme
