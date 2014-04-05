-- Define a tag table which hold all screen tags.
tags = {
  names   = { "WORK", "GB", "MEDIA", "RAND" },
  layouts = { layouts[1], layouts[1], layouts[3], layouts[3] } }

for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layouts)
end
