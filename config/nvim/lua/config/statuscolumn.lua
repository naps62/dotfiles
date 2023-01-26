local buf_get_option = vim.api.nvim_buf_get_option
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local custom_events = augroup("CustomEvents", {})

local blacklist = {
  nofile = true,
  lazygit = true,
  NvimTree = true,
  toggleterm = true
}

if _G.StatusColumn then
  return
end

_G.StatusColumn = {
  handler = {
    fold = function()
      local lnum = vim.fn.getmousepos().line

      -- Only lines with a mark should be clickable
      if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
        return
      end

      local state
      if vim.fn.foldclosed(lnum) == -1 then
        state = "close"
      else
        state = "open"
      end

      vim.cmd.execute("'" .. lnum .. "fold" .. state .. "'")
    end
  },

  display = {
    line = function()
      local vnum = vim.v.virtnum
      local rnum = vim.v.relnum
      local lnum = vim.v.relnum

      if vnum < 1 then
        if rnum then
          return rnum
        else
          if lnum < 10 then
            return "  " .. lnum
          else
            return lnum
          end
        end
      else
        return ''
      end
    end,

    fold = function()
      local lnum = vim.v.lnum
      local icon = "  "
      if vim.v.wrap then
        return icon
      end

      -- Line isn't in folding range
      if vim.fn.foldlevel(lnum) <= 0 then
        return icon
      end

      -- Not the first line of folding range
      if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
        return icon
      end

      if vim.fn.foldclosed(lnum) == -1 then
        icon = " "
      else
        icon = " "
      end

      return icon
    end
  },

  sections = {
    sign_column = {
      [[%s]]
    },
    line_number = {
      [[%=%{v:lua.StatusColumn.display.line()}]]
    },
    folds       = {
      [[%#FoldColumn#]], -- HL
      [[%@v:lua.StatusColumn.handler.fold@]],
      [[%{v:lua.StatusColumn.display.fold()}]]
    },
    padding     = {
      [[%#StatusColumnBuffer#]], -- HL
    },
  },

  build = function(tbl)
    local statuscolumn = {}

    for _, value in ipairs(tbl) do
      if type(value) == "string" then
        table.insert(statuscolumn, value)
      elseif type(value) == "table" then
        table.insert(statuscolumn, StatusColumn.build(value))
      end
    end

    return table.concat(statuscolumn)
  end,

  set_window = function(value)
    vim.defer_fn(function()
      vim.api.nvim_win_set_option(vim.api.nvim_get_current_win(), "statuscolumn", value)
    end, 1)
  end
}

-- TODO can this go into set_window's defered logic?
local function callback()
  if not blacklist[buf_get_option(0, "buftype")] then
    vim.opt_local.signcolumn = "yes"
    vim.opt_local.numberwidth = 3
    vim.opt_local.statuscolumn = StatusColumn.build({
      StatusColumn.sections.folds,
      StatusColumn.sections.line_number,
      StatusColumn.sections.sign_column,
      StatusColumn.sections.padding,
    })
  end
end

autocmd("BufWinEnter", {
  callback = callback,
  group = custom_events
})
