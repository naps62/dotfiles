terminal = "terminator"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

browser = "google-chrome-stable"
menu_command = 'xboomx'
gui_editor = 'subl'
screenshot = 'shutter'
-- music_player = 

-- Themes define colours, icons, and wallpapers
beautiful.init(awful.util.getdir("config") .. "/theme.lua")

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmapt or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
altkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    -- awful.layout.suit.floating,
    -- awful.layout.suit.tile,
    -- awful.layout.suit.tile.bottom,
    awful.layout.suit.max,
    -- lain.layout.uselesstile,
    awful.layout.suit.fair,
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    -- lain.layout.uselesstile.left,
    -- lain.layout.uselesstile.top
}

-- {{{ Naughty presets
-- naughty.config.defaults.timeout          = 5
-- naughty.config.defaults.screen           = 1
-- naughty.config.defaults.position         = "top_right"
-- naughty.config.defaults.margin           = 8
-- naughty.config.defaults.gap              = 1
-- naughty.config.defaults.ontop            = true
-- naughty.config.defaults.font             = "Source Code Pro 12"
-- naughty.config.defaults.icon             = nil
-- naughty.config.defaults.icon_size        = 256
-- naughty.config.defaults.fg               = beautiful.fg_tooltip
-- naughty.config.defaults.bg               = beautiful.bg_tooltip
-- naughty.config.defaults.border_color     = beautiful.border_tooltip
-- naughty.config.defaults.border_width     = 1
-- naughty.config.defaults.hover_timeout    = nil
-- }}
