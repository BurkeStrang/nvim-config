return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      opts.transparent = true
      opts.italic_comments = true
      opts.borderless_telescope = false
      opts.theme = {
        colors = {
          fg = "#6C9EC8",
          blue = "#0099CC",
          cyan = "#20B2AA",
          green = "#1CA191",
          orange = "#009090",
          yellow = "#AD9111",
          pink = "#8F65B4",
          red = "#AD2222",
          purple = "#9370DB",
          magenta = "#4C8D8B",
        },
        highlight = {},
        overrides = function(colors)
          return {
            Number = { fg = colors.purple },
            Boolean = { fg = colors.pink },
            Type = { fg = colors.blue },
            Operator = { fg = colors.orange },
            Keyword = { fg = colors.orange },
            Identifier = { fg = colors.blue },
            Delimiter = { fg = colors.magenta },
          }
        end,
      }
      return opts
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
  {
    "mawkler/modicator.nvim",
    lazy = false,
    dependencies = "scottmckendry/cyberdream.nvim",
    init = function()
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    opts = {
      integration = { lualine = { enabled = false } },
      show_warnings = false,
    },
  },
}
