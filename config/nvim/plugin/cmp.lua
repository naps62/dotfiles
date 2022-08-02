local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require('lspkind')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_next_item = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end, { "i", "s" })

local cmp_prev_item = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end, { "i", "s" })


cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Add tab support
    ['<S-Tab>'] = cmp_prev_item,
    ['<Tab>'] = cmp_next_item,
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      select = false,
    })
  }),

  -- Never select any item by default
  preselect = cmp.PreselectMode.None,

  formatting = {
    format = function(entry, vim_item)
      if entry.source.name == "copilot" then
        vim_item.kind = "[] Copilot"
        vim_item.kind_hl_group = "CmpItemKindCopilot"
        return vim_item
      end
      return lspkind.cmp_format()(entry, vim_item)
    end
  },


  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    --{ name = 'copilot' },
    { name = 'path' },
    { name = 'buffer' },
  }
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
