return {
  {
    "WhoIsSethDaniel/mason-tool-installer",
    event = "BufReadPre",
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
      },
    },
    dependencies = {
      {
        "mason-org/mason-lspconfig.nvim",
        cmd = "Mason",
        opts = {
          ensure_installed = {
            "lua_ls",
            "rust_analyzer",
            "biome",
            "marksman",
            "basedpyright",
            "zk",
            "taplo",
          },
        },
        dependencies = {
          {
            "mason-org/mason.nvim",
            opts = {
              ui = {
                icons = {
                  package_installed = "✓",
                  package_pending = "➜",
                  package_uninstalled = "✗",
                },
              },
            },
          },
          {
            "neovim/nvim-lspconfig",
          },
        },
      },
    },
    init = function()
      vim.diagnostic.config({
        -- virtual_lines = true,
        virtual_text = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,

        inlay_hints = {
          enabled = true,
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
    end,
  },
}
