mylauncher = wibox.widget.imagebox()
mylauncher:set_image(beautiful.awesome_icon)
mylauncher:buttons(awful.util.table.join(
  -- Lock
  awful.button({ }, 1,
    function()
      local lock = "i3lock -d -p default -c " .. beautiful.bg_focus:gsub("#","")
      awful.util.spawn(lock, false)
    end),

  -- Reboot
  awful.button({ modkey }, 1,
    function()
      local reboot = "zenity --question --text 'Reboot?' && systemctl reboot"
      awful.util.spawn(reboot, false)
    end),

  -- Shutdown
  awful.button({ modkey }, 3,
    function()
      local shutdown = "zenity --question --text 'Shut down?' && systemctl poweroff"
      awful.util.spawn(shutdown, false)
    end)))
