vim.diagnostic.config({
  virtual_text = {
    prefix = "!",
    spacing = 2,
  },
  severity_sort = true,
})

vim.lsp.config("nil_ls", {
  settings = {
    ["nil"] = {
      formatting = {
        command = { "nixfmt" },
      },
    },
  },
})

vim.lsp.enable("nil_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")
