local cpu_widget = lain.widgets.cpu({
    settings = function()
        widget:set_markup("CPU " .. cpu_now.usage .. "%")
    end
})

local cpu_icon = wibox.widget.imagebox()
cpu_icon:set_image(beautiful.cpu)

w_cpu = wibox.layout.fixed.horizontal()
w_cpu:add(cpu_icon)
w_cpu:add(spr_small)
w_cpu:add(cpu_widget)
