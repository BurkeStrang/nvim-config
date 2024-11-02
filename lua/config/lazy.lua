local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.filetype.add({ extension = { props = "xml" } })
vim.filetype.add({ extension = { sln = "xml" } })
vim.filetype.add({ extension = { nswag = "json" } })
vim.filetype.add({ extension = { http = "http" } })
-- vim.filetype.add({ extension = { cs = "csharp" } })

-- remove the status line and lines at the bottom
vim.opt.laststatus = 0
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.statusline = " "
vim.opt.report = 9999
vim.opt.shortmess:append("c")  -- Don't show ins-completion messages

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  -- install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true, notify = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
vim.ui.open = function(url)
  -- Check if running in WSL
  local is_wsl = vim.fn.has("wsl") == 1

  if is_wsl then
    -- Use wslview in WSL
    vim.fn.system({ "wslview", url })
  else
    -- Use start in Windows
    vim.fn.system({ "cmd.exe", "/C", "start", url })
  end
end

-- vim.g.clipboard = {
--   name = "WslClipboard",
--   copy = {
--     ["+"] = "clip.exe",
--     ["*"] = "clip.exe",
--   },
--   paste = {
--     ["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     ["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   },
--   cache_enabled = 0,
-- }


-- vim.g.clipboard = {
--   name = "WslClipboard",
--   copy = {
--     ["+"] = "win32yank.exe -i --crlf",
--     ["*"] = "win32yank.exe -i --crlf",
--   },
--   paste = {
--     ["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     ["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   },
--   cache_enabled = 0,
-- }

vim.opt.foldmethod = "marker"
vim.opt.foldmarker = { "#region", "#endregion" }

-- vim.g.clipboard = {
--   name = 'win32yank',
--   copy = {
--     ['+'] = 'win32yank.exe -i --crlf',
--     ['*'] = 'win32yank.exe -i --crlf',
--   },
--   paste = {
--     ['+'] = 'win32yank.exe -o --lf',
--     ['*'] = 'win32yank.exe -o --lf',
--   },
--   cache_enabled = 0,
-- }

-- vim.cmd("highlight Visual ctermbg=0 guibg=#1d1b21")
