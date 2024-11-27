return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      options = {
        theme = "auto",
        globalstatus = true, -- Enable global statusline
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
      },
      sections = {
        lualine_a = {}, -- No sections in 'a'
        lualine_b = { "branch" }, -- Display branch name
        lualine_c = {}, -- No sections in 'c'
        lualine_x = {}, -- No sections in 'x'
        lualine_y = {}, -- No sections in 'y'
        lualine_z = {}, -- No sections in 'z'
      },
    }
  end,
}
