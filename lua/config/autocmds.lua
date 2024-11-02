-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = ":,/,?",
  callback = function()
    vim.cmd("echo ''")
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.defer_fn(function()
      vim.cmd("echo ''")  -- Clears the command line without triggering ENTER prompt
    end, 10)  -- Delay in milliseconds
  end,
})

vim.api.nvim_create_autocmd("TextChanged", {
  callback = function()
    vim.cmd("echo ''")
  end,
})


