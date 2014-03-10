-- Define a tag table which hold all screen tags.
tags = {
  names   = { "1", "2", "3", "4", "5", "6" },
  layouts = { layouts[4], layouts[4], layouts[4], layouts[4], layouts[4], layouts[4] } }

for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layouts)
end
