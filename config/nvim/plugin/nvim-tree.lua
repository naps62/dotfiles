require("nvim-tree").setup({
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enabled = true,
    update_cwd = true
  }
})
