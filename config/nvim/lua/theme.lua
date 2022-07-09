vim.cmd [[
  if has('termguicolors')
    set termguicolors
  endif

  let g:sonokai_style = 'default'
  let g:sonokai_better_performance = 1

  colorscheme sonokai
]]

require('lualine').setup {
  theme = 'sonokai',
  extensions = { 'nvim-tree', 'toggleterm' },
  sections = {
    lualine_c = { "filename", "require('lsp-status').status()" }
  }
}
