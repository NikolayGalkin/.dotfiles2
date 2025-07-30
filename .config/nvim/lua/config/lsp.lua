vim.lsp.config("*", {
  root_markers = { ".git" },
})

vim.diagnostic.config({
  virtual_lines = true,
  -- virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,

  inlay_hints = {
    enabled = true,
  },

  float = {
    border = "rounded",
    source = true,
  },

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
})

vim.lsp.enable({
  "biome",
  "jsonls",
  "lua_ls",
  "marksman",
  "pyright",
  "ruff",
  "taplo",
  "ts_ls",
  "sqls",
  "rust_analyzer",
})

vim.api.nvim_create_user_command("LspLog", function()
  vim.cmd.vsplit(vim.lsp.log.get_filename())
end, {
  desc = "Get all the lsp logs",
})

vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd("silent checkhealth vim.lsp")
end, {
  desc = "Get all the information about all LSP attached",
})

-- " These keymaps are the defaults in Neovim v0.11
--   nnoremap <buffer> K <cmd>lua vim.lsp.buf.hover()<cr>
--   nnoremap <buffer> grr <cmd>lua vim.lsp.buf.references()<cr>
--   nnoremap <buffer> gri <cmd>lua vim.lsp.buf.implementation()<cr>
--   nnoremap <buffer> grn <cmd>lua vim.lsp.buf.rename()<cr>
--   nnoremap <buffer> gra <cmd>lua vim.lsp.buf.code_action()<cr>
--   nnoremap <buffer> gO <cmd>lua vim.lsp.buf.document_symbol()<cr>
--   inoremap <buffer> <C-s> <cmd>lua vim.lsp.buf.signature_help()<cr>
--   snoremap <buffer> <C-s> <cmd>lua vim.lsp.buf.signature_help()<cr>
