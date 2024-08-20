return {
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-jest",
      "Issafalcon/neotest-dotnet",
      -- { dir = "~/repos/neotest-dotnet" },
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
        -- log_level = , -- For verbose logs
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
          }),
          require("neotest-plenary"),
          require("neotest-dotnet")({
            discovery_root = "solution",
          }),
          require("neotest-jest")({
            jestCommand = "npm test -- --runInBand --no-cache --watchAll=false",
            env = { CI = "true" },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
  },
}
