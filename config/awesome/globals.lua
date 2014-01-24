-- Themes define colours, icons, and wallpapers
beautiful.init(awful.util.getdir("config") .. "/themes/dust/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "terminator"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
browser = "firefox-aurora"

menu_command = "exe=`dmenu_path | dmenu_run -b -p 'DMenu' -i -z -nb '" .. beautiful.bg_normal ..
              "' -nf '" .. beautiful.fg_normal ..
              "' -sb '" .. beautiful.bg_focus ..
              "' -sf '" .. beautiful.fg_focus ..
              "' -fn 'Inconsolata-10'` && exec $exe"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,        -- 1
    awful.layout.suit.tile,            -- 2
    awful.layout.suit.tile.left,       -- 3
    awful.layout.suit.tile.bottom,     -- 4
    awful.layout.suit.tile.top,        -- 5
    awful.layout.suit.fair,            -- 6
    awful.layout.suit.fair.horizontal, -- 7
    awful.layout.suit.spiral,          -- 8
    awful.layout.suit.spiral.dwindle,  -- 9
    awful.layout.suit.max,             -- 10
    awful.layout.suit.max.fullscreen,  -- 11
    awful.layout.suit.magnifier        -- 12
}

-- {{{ Naughty presets
naughty.config.defaults.timeout          = 5
naughty.config.defaults.screen           = 1
naughty.config.defaults.position         = "top_right"
naughty.config.defaults.margin           = 8
naughty.config.defaults.gap              = 1
naughty.config.defaults.ontop            = true
naughty.config.defaults.font             = "Source Code Pro 12"
naughty.config.defaults.icon             = nil
naughty.config.defaults.icon_size        = 256
naughty.config.defaults.fg               = beautiful.fg_tooltip
naughty.config.defaults.bg               = beautiful.bg_tooltip
naughty.config.defaults.border_color     = beautiful.border_tooltip
naughty.config.defaults.border_width     = 1
naughty.config.defaults.hover_timeout    = nil
-- }}
