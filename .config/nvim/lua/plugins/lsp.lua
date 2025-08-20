return {
  {
    "WhoIsSethDaniel/mason-tool-installer",
    event = "BufReadPre",
    dependencies = {
      {
        "mason-org/mason-lspconfig.nvim",
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
            config = function()
              -- TODO: remove this shit!
              require("lspconfig").lua_ls.setup({
                on_init = function(client)
                  if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                      path ~= vim.fn.stdpath("config")
                      and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                    then
                      return
                    end
                  end

                  client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                    runtime = {
                      -- Tell the language server which version of Lua you're using
                      -- (most likely LuaJIT in the case of Neovim)
                      version = "LuaJIT",
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                      checkThirdParty = false,
                      library = {
                        vim.env.VIMRUNTIME,
                        -- Depending on the usage, you might want to add additional paths here.
                        -- "${3rd}/luv/library"
                        -- "${3rd}/busted/library",
                      },
                      -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                      -- library = vim.api.nvim_get_runtime_file("", true)
                    },
                  })
                end,
                settings = {
                  Lua = {},
                },
              })
            end,
          },
        },
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
      },
    },
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
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
