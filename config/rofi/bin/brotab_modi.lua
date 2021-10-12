#!/usr/bin/lua

local rofi_markup = print("\0markup-rows\x1ftrue\n")

local function GetTabs(sin)
    local delim = print("\x00delim\x1f\x0f")
    local markup_s = '%s - <span foreground="#6B838E">%s</span><span foreground="#44555D"><i>%s</i></span>\x0f'
    local pipe_in = sin:read("a")
    for line in pipe_in:gmatch("([^\n]*)\n") do
        local id, title, url = line:match("([^\t]+)\t([^\t]+)\t([^\t]+)")
        local result = string.format(markup_s, title, url:match("https?://[www%.]*(.*)"), id)
        local prune_s = result:gsub("&", "&amp;")
        io.write(prune_s)
    end
end

args = {...}
if not args[1] then
    local handle = io.popen("brotab list | tac -s '\n'")
    GetTabs(handle)
else
    os.execute(string.format("brotab activate %s", args[1]:match("<i>(.-)</i>")))
end
