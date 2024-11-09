return {
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        window = {
          winblend = 0,
          border = "rounded",
        },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
      render = "compact",
      -- max_height = function()
      --   return math.floor(vim.o.lines * 0.8)
      -- end,
      -- max_width = function()
      --   return math.floor(vim.o.columns * 0.3)
      -- end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  },
  -- filename
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guifg = "#AFA0F0" },
            InclineNormalNC = { guifg = "#AFA0F0" },
          },
        },
        window = {
          margin = { vertical = 0, horizontal = 1 },
          placement = { vertical = "bottom", horizontal = "right" },
        },
        hide = { cursorline = true },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[*]" .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)

          -- if not a git repository, return the filename
          if not require("plenary.job")
            :new({
              command = "git",
              args = { "rev-parse", "--is-inside-work-tree" },
              cwd = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":p:h"),
            })
            :sync()[1]
            then
            return { { icon, guifg = color }, { " " }, { filename } }
          end

          local branch = require("plenary.job")
            :new({
              command = "git",
              args = { "rev-parse", "--abbrev-ref", "HEAD" },
              cwd = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":p:h"),
            })
            :sync()[1]

          local remote_url = require("plenary.job")
            :new({
              command = "git",
              args = { "remote", "get-url", "origin" },
              cwd = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":p:h"),
            })
            :sync()[1]

          local repo_symbol = " "
          if remote_url:find("github.com") then
            repo_symbol = " " -- GitHub symbol
          elseif remote_url:find("dev.azure.com") then
            repo_symbol = " " -- Azure DevOps symbol
          end

          return {
            { repo_symbol .. branch, guifg = "#AA1188" },
            { "  " },
            { icon, guifg = color },
            { " " },
            { filename },
          }
        end,
      })
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
}
