function _G.reload_current_file()
  vim.cmd(":luafile %")
end

function _G.dump(...)
  vim.pretty_print(...)
end
