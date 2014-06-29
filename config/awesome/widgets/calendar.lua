local cal_text = awful.widget.textclock("%d %b")

local calendar_icon = wibox.widget.imagebox()
calendar_icon:set_image(beautiful.calendar)

local calendarwidget = wibox.widget.background()
calendarwidget:set_widget(cal_text)
calendarwidget:set_bgimage(beautiful.widget_bg)
lain.widgets.calendar:attach(calendarwidget, { position = "bottom_right" })

w_cal = wibox.layout.fixed.horizontal()
w_cal:add(calendar_icon)
w_cal:add(spr_small)
w_cal:add(calendarwidget)
