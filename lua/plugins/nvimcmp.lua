return {
  "nvim-cmp",
  dependencies = {
    {
      "zbirenbaum/copilot-cmp",
      dependencies = "copilot.lua",
      opts = {},
      config = function(_, opts)
        local copilot_cmp = require("copilot_cmp")
        copilot_cmp.setup(opts)
        -- attach cmp source whenever copilot attaches
        -- fixes lazy-loading issues with the copilot cmp source
        LazyVim.lsp.on_attach(function(client)
          copilot_cmp._on_insert_enter({})
        end, "copilot")
      end,
    },
    {
      "kristijanhusak/vim-dadbod-completion",
      config = function()
        vim.cmd([[
          augroup DadbodCompletion
            autocmd!
            autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = {{ name = 'vim-dadbod-completion' }} }
          augroup END
        ]])
      end,
    },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    -- vim.api.nvim_set_hl(0, "PopMenu", { bg = "#1d1b21", blend = 0 })
    -- local cmp = require("cmp")
    -- local win_opt = {
    --   col_offset = 0,
    --   side_padding = 1,
    --   winhighlight = "Normal:PopMenu,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    --   border = "",
    -- }
    -- opts.window = {
    --   completion = cmp.config.window.bordered(win_opt),
    --   documentation = cmp.config.window.bordered(win_opt),
    -- }
    opts.experimental = {
      ghost_text = false,
    }
    table.insert(opts.sources, 1, {
      name = "copilot",
      group_index = 1,
      priority = 100,
    })
  end,
}
