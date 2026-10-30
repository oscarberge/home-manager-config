require("conform").setup({
  formatters_by_ft = {
    nix = { "nixfmt" },
    python = { "ruff_format" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    lua = { "stylua" },
    sh = { "shfmt" },
    toml = { "taplo" },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
})
