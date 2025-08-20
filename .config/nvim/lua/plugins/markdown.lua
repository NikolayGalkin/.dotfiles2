return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim",
    },
    ft = { "markdown", "Avante" },

    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      file_types = { "markdown", "Avante" },
      completions = {
        blink = {
          enabled = true,
        },
      },
    },
  },
  -- {
  --   "zk-org/zk-nvim",
  --   config = function()
  --     require("zk").setup({
  --       picker = "minipick",
  --
  --       lsp = {
  --         -- `config` is passed to `vim.lsp.start(config)`
  --         config = {
  --           name = "zk",
  --           cmd = { "zk", "lsp" },
  --           filetypes = { "markdown" },
  --           -- on_attach = ...
  --           -- etc, see `:h vim.lsp.start()`
  --         },
  --
  --         -- automatically attach buffers in a zk notebook that match the given filetypes
  --         auto_attach = {
  --           enabled = true,
  --         },
  --       },
  --       -- See Setup section below
  --     })
  --   end,
  -- },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    enabled = false,
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
      --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
      --   -- refer to `:h file-pattern` for more examples
      "VeryLazy",
      -- "BufReadPre ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal/*.md",
      --   "BufNewFile path/to/my-vault/*.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal",
        },
      },
      daily_notes = {
        folder = "Notes",
        date_format = "%Y/%Y-%m/%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        default_tags = { "daily" },
        template = "_templates/Template Daily.md",
      },
      templates = {
        folder = "_templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
      picker = {
        name = "mini.pick",
      },
      ui = {
        enable = false,
      },
      attachments = {
        img_folder = "_assets/imgs",
      },
      mappings = {
        ["<leader>ot"] = {
          action = ":ObsidianTomorrow<cr>",
          opts = { buffer = true },
        },
        ["<leader>od"] = {
          action = ":ObsidianDailies<cr>",
          opts = { buffer = true },
        },
        ["<leader>os"] = {
          action = ":ObsidianSearch<cr>",
          opts = { buffer = true },
        },
      },

      -- local command_lookups = {
      --   ObsidianCheck = "obsidian.commands.check",
      --   ObsidianToggleCheckbox = "obsidian.commands.toggle_checkbox",
      --   ObsidianToday = "obsidian.commands.today",
      --   ObsidianYesterday = "obsidian.commands.yesterday",
      --   ObsidianTomorrow = "obsidian.commands.tomorrow",
      --   ObsidianDailies = "obsidian.commands.dailies",
      --   ObsidianNew = "obsidian.commands.new",
      --   ObsidianOpen = "obsidian.commands.open",
      --   ObsidianBacklinks = "obsidian.commands.backlinks",
      --   ObsidianSearch = "obsidian.commands.search",
      --   ObsidianTags = "obsidian.commands.tags",
      --   ObsidianTemplate = "obsidian.commands.template",
      --   ObsidianNewFromTemplate = "obsidian.commands.new_from_template",
      --   ObsidianQuickSwitch = "obsidian.commands.quick_switch",
      --   ObsidianLinkNew = "obsidian.commands.link_new",
      --   ObsidianLink = "obsidian.commands.link",
      --   ObsidianLinks = "obsidian.commands.links",
      --   ObsidianFollowLink = "obsidian.commands.follow_link",
      --   ObsidianWorkspace = "obsidian.commands.workspace",
      --   ObsidianRename = "obsidian.commands.rename",
      --   ObsidianPasteImg = "obsidian.commands.paste_img",
      --   ObsidianExtractNote = "obsidian.commands.extract_note",
      --   ObsidianDebug = "obsidian.commands.debug",
      --   ObsidianTOC = "obsidian.commands.toc",
      -- };
    },
    keys = {
      { "<leader>od", ":ObsidianDailies<cr>", desc = "Pick Obsidian Dailies", silent = true },
      { "<leader>os", ":ObsidianSearch<cr>", desc = "Search Obsidian Words", silent = true },
      { "<leader>ot", ":ObsidianTomorrow<cr>", desc = "Todo Tomorrow", silent = true },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "Kicamon/markdown-table-mode.nvim",
    ft = { "markdown" },
    cmd = "Mtm",
    opts = {},
  },
  {
    "Myzel394/easytables.nvim",
    ft = { "markdown" },
    opts = {},
  },
}
