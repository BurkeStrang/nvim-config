return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      opts.transparent = true
      opts.italic_comments = true
      opts.borderless_telescope = false
      -- opts.cache = true
      -- opts.extensions = { telescope = false }
      opts.theme = {
        colors = {

          -- fg = "#D2B48C", -- Light tan
          -- fg = "#FFFFAA", -- Light yellow
          fg = "#AFA0F0", -- Slightly more blue
          -- fg = "#BFE0F0",
          -- magenta = "#FF00FF", -- darker neon magenta
          blue = "#00FFD1", -- Neon green blue
          cyan = "#00FFFF", -- Neon cyan
          green = "#00cc00",
          orange = "#FF7500", -- Neon orange
          yellow = "#99CC00",
          -- pink = "#FF6EC7", -- Neon pink
          red = "#a82828", -- Neon red
          magenta = "#FF00FF", -- Brighter magenta
          -- pink = "#FF60CB", -- Light pink
          pink = "#FF80DB", -- Lighter pink
          purple = "#9932CC", -- Brighter purple
        },
        highlight = {},
        overrides = function(colors)
          return {
            Number = { fg = colors.yellow },
            Boolean = { fg = colors.yellow },
            Type = { fg = colors.blue },
            Operator = { fg = colors.pink },
            Keyword = { fg = colors.orange },
            Identifier = { fg = colors.fg },
            Delimiter = { fg = colors.pink },
          }
        end,
      }
      return opts -- Return the modified opts
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },

  -- modicator (auto color line number based on vim mode)
  {
    "mawkler/modicator.nvim",
    lazy = false,
    dependencies = "scottmckendry/cyberdream.nvim", -- Add your colorscheme plugin here
    init = function()
      -- These are required for Modicator to work
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    opts = {
      integration = { lualine = { enabled = false } },
      -- Warn if any required option above is missing. May emit false positives
      -- if some other plugin modifies them, which in that case you can just
      -- ignore. Feel free to remove this line after you've gotten Modicator to
      -- work properly.
      show_warnings = false,
    },
  },
}
