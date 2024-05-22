local bufnr = vim.api.nvim_get_current_buf()
local opts = { buffer = bufnr }

vim.keymap.set("n", "ga", function()
	vim.cmd.RustLsp("codeAction")
end, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ auto_focus = true })
end, opts)

vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
