require("telescope").setup {
  extensions = {
    repo = {
      list = {
        shorten_path = true,
        file_ignore_patterns = {
          "/%.",
          "/lib/"
        }
      },
    }
  }
}
require("telescope").load_extension("repo")
