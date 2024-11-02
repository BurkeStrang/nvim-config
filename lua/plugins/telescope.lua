return {

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {

      {
        "<leader>gu",
        function()
          require("custom.usersecrets").open_user_secrets()
        end,
        desc = "Select User Secret",
      },
    },

    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "top",
            horizontal = {
              width = 0.99,
              height = 0.99,
              preview_width = 0.5,
            },
          },
          sorting_strategy = "ascending",
          winblend = 0,
        },
        pickers = {
          live_grep = {
            layout_config = {
              horizontal = {
                width = 0.99,
                height = 0.99,
                preview_width = 0.5,
              },
            },
          },
          grep_string = {
            layout_config = {
              horizontal = {
                width = 0.99,
                height = 0.99,
                preview_width = 0.5,
              },
            },
          },
        },
      })
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
}
