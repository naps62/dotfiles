local clock_text = awful.widget.textclock("%H:%M")
local clock_icon = wibox.widget.imagebox()
clock_icon:set_image(beautiful.clock)

w_clock = wibox.layout.fixed.horizontal()
w_clock:add(clock_icon)
w_clock:add(spr_small)
w_clock:add(clock_text)
