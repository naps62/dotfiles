netdown_icon = wibox.widget.imagebox()
netdown_icon:set_image(beautiful.net_down)

netup_icon = wibox.widget.imagebox()
netup_icon:set_image(beautiful.net_up)

netdown_text = wibox.widget.textbox()
netup_text = wibox.widget.textbox()

net_value_format = function(value)
  return string.format("%.1f", value)
end

lain.widgets.net({
    settings = function()
        netdown_text:set_text(net_value_format(net_now.received))
        netup_text:set_text(net_value_format(net_now.sent))
    end
})

w_net = wibox.layout.fixed.horizontal()
w_net:add(netdown_icon)
w_net:add(spr_small)
w_net:add(netdown_text)
w_net:add(spr_big)
w_net:add(netup_icon)
w_net:add(spr_small)
w_net:add(netup_text)
