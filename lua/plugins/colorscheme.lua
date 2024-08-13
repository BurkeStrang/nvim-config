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
          fg = "#c5c8c6",
          blue = "#00FFD1", -- Neon green blue
          cyan = "#00FFFF", -- Neon cyan
          green = "#33FF33", -- Lighter green
          orange = "#FFA500", -- Neon orange
          yellow = "#FFFF00", -- Neon yellow
        },
        highlight = {
        },
        -- overrides = function(colors)
        --   return {
        --     LineNr = { fg = colors.cyan },
        --   }
        -- end,
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
      integration = { lualine = {enabled = false} },
      -- Warn if any required option above is missing. May emit false positives
      -- if some other plugin modifies them, which in that case you can just
      -- ignore. Feel free to remove this line after you've gotten Modicator to
      -- work properly.
      show_warnings = true,
    },
  },
}
