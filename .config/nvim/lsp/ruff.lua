return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml" },
  settings = {
    capabilities = {
      offsetEncoding = "utf-16",
    },
  },
}
