vim.cmd [[
  if has('termguicolors')
    set termguicolors
  endif

  set background=dark
  colorscheme onedark

  " differentiate rustdoc comments from regular ones
  highlight SpecialComment gui=bold
]]

require('lualine').setup {
  theme = 'onedark',
  extensions = { 'nvim-tree', 'toggleterm' },
  sections = {
    lualine_c = { "filename", "require('lsp-status').status()" }
  }
}
