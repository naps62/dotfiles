local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ['<C-c>'] = actions.close
      }
    }
  }
})
require("telescope").load_extension("projects")
require("telescope").load_extension("fzf")