-- return {
--   "kristijanhusak/vim-dadbod-ui",
--   -- dependencies = {
--   --   { "tpope/vim-dadbod", lazy = true },
--   --   { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
--   -- },
--   -- cmd = {
--   --   'DBUI',
--   --   'DBUIToggle',
--   --   'DBUIAddConnection',
--   --   'DBUIFindBuffer',
--   -- },
--   init = function()
--     -- Your DBUI configuration
--     -- Get HOME or USERPROFILE depending on the environment
--     local home = os.getenv("HOME") or os.getenv("USERPROFILE")
--     vim.g.db_ui_save_location = home .. "/sqlscripts"
--   end,
-- }
return {
  "kristijanhusak/vim-dadbod-ui",
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  dependencies = "vim-dadbod",
  keys = {
    { "<leader>D", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
  },
  init = function()
    local data_path = os.getenv("HOME") or os.getenv("USERPROFILE")

    vim.g.db_ui_auto_execute_table_helpers = 1
    vim.g.db_ui_save_location = data_path .. "/sqlscripts"
    vim.g.db_ui_show_database_icon = true
    vim.g.db_ui_tmp_query_location = data_path .. "/sqlscripts/tmp"
    vim.g.db_ui_use_nerd_fonts = true
    vim.g.db_ui_use_nvim_notify = true

    -- NOTE: The default behavior of auto-execution of queries on save is disabled
    -- this is useful when you have a big query that you don't want to run every time
    -- you save the file running those queries can crash neovim to run use the
    -- default keymap: <leader>S
    vim.g.db_ui_execute_on_save = false
  end,
}
