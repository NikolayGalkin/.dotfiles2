return {
  {
    "cordx56/rustowl",
    version = "*", -- Latest stable version
    build = "cargo binstall rustowl",
    ft = "rust",
    enabled = true,
    -- lazy = false, -- This plugin is already lazy
    opts = {
      auto_enable = false,
      client = {
        on_attach = function(_, buffer)
          vim.keymap.set("n", "<leader>ro", function()
            require("rustowl").toggle(buffer)
          end, { buffer = buffer, desc = "Toggle RustOwl" })
        end,
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    enabled = false,
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
