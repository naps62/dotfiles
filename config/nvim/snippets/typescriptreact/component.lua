local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep

-- Get a list of  the property names given an `interface_declaration`
-- treesitter *tsx* node.
-- Ie, if the treesitter node represents:
--   interface {
--     prop1: string;
--     prop2: number;
--   }
-- Then this function would return `{"prop1", "prop2"}
---@param id_node {} Stands for "interface declaration node"
---@return string[]
local function get_prop_names(id_node)
  local object_type_node = id_node:child(2)
  if object_type_node:type() ~= "object_type" then
    return {}
  end

  local prop_names = {}

  for prop_signature in object_type_node:iter_children() do
    if prop_signature:type() == "property_signature" then
      local prop_iden = prop_signature:child(0)
      local prop_name = vim.treesitter.query.get_node_text(prop_iden, 0)
      prop_names[#prop_names + 1] = prop_name
    end
  end

  return prop_names
end

ls.add_snippets("typescriptreact", {
  s("rcnp",
    fmt([[
    function {name}() {{
      return <{tag}>{body}</{tag2}>;
    }}

    {export}
    ]],
      {
        name = i(1, "Name"),
        export = d(2, function(args, snip)
          return sn(nil, { i(1, "export " .. args[1][1] .. ";") })
        end, { 1 }),
        tag = i(3, ""),
        tag2 = rep(3),
        body = i(0, ""),
      })
  ),

  s("rcp",
    fmt([[
    interface {name}Props {{
      {props}
    }}

    function {name2}({{{args}}}: {name2}Props) {{
      return <{tag}>{body}</{tag}>;
    }}

    {export}
    ]],
      {
        name = i(1, "Name"),

        props = i(2, "// props"),

        args = f(function(args, snip, _)
          local pos_begin = snip.nodes[1].mark:pos_begin()
          local pos_end = snip.nodes[1].mark:pos_end()
          local parser = vim.treesitter.get_parser(0, "tsx")
          local tstree = parser:parse()

          local node = tstree[1]
              :root()
              :named_descendant_for_range(pos_begin[1], pos_begin[2], pos_end[1], pos_end[2])

          while node ~= nil and node:type() ~= "interface_declaration" do
            node = node:parent()
          end

          if node == nil then
            return ""
          end

          -- `node` is now surely of type "interface_declaration"
          local prop_names = get_prop_names(node)

          -- Does this lua->vimscript->lua thing cause a slow down? Dunno.
          return vim.fn.join(prop_names, ", ")
        end, { 2 }),

        name2 = rep(1),

        export = d(3, function(args, snip)
          return sn(nil, { i(1, "export " .. args[1][1] .. ";") })
        end, { 1 }),

        tag = i(4, ""),
        body = i(0, ""),
      })
  ),
})
