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
vim.lsp.enable("ts_ls")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("jsonls")
vim.lsp.enable("eslint")
vim.lsp.enable("lua_ls")
vim.lsp.enable("yamlls")
