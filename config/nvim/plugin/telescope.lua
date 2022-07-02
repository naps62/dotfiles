require("telescope").setup {
  extensions = {
    repo = {
      cached_list = {
        bin = "lolcate",
        locate_opts = "--db projects"
      }
    }
  }
}
require("telescope").load_extension("repo")
