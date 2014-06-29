myvolumebar = lain.widgets.alsabar({
    ticks  = true,
    width  = 44,
    height = 20,
    colors = {
        background = theme.fg_focus,
        unmute = theme.fg_normal,
        mute = theme.colors.red

    },
    notifications = {
        font      = "Tamsyn",
        font_size = "12",
        bar_size  = 30
    }
})
alsamargin = wibox.layout.margin(myvolumebar.bar, 5, 5, 80)
wibox.layout.margin.set_top(alsamargin, 10)
wibox.layout.margin.set_bottom(alsamargin, 8)

w_volume = wibox.widget.background()
w_volume:set_widget(alsamargin)
w_volume:set_bgimage(beautiful.widget_bg)
