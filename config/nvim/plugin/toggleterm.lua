require('toggleterm').setup()

local Terminal  = require('toggleterm.terminal').Terminal

function _lazygit_toggle()
  local path = vim.fn.expand('%')

  local lazygit = Terminal:new({ 
    cmd = "lazygit " .. path,
    direction = "float",
    hidden = true
  })

  lazygit:toggle()
end
