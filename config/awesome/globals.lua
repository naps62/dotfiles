-- Themes define colours, icons, and wallpapers
beautiful.init(awful.util.getdir("config") .. "/themes/dust/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "terminator"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
browser = "google-chrome-stable"
menu_command = 'xboomx'

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
    -- awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,     -- 3
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,             -- 4
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier
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
