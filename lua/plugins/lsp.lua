return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim", opts = {} },
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "seblj/roslyn.nvim",
  },
  ---@class PluginLspOpts
  opts = function()
    return {
      -- options for vim.diagnostic.config()
      ---@type vim.diagnostic.Opts
      diagnostics = {
        underline = true,
        update_in_insert = true,
        virtual_text = true,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
          },
        },
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = true,
        exclude = {}, -- filetypes for which you don't want to enable inlay hints
      },
      -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the code lenses.
      codelens = {
        -- this is annyoing it's always flickering
        enabled = false,
      },
      -- Enable lsp cursor word highlighting
      document_highlight = {
        enabled = true,
      },
      -- add any global capabilities here
      capabilities = {},
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      autoformat = false,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        bicep = {},
        gopls = {},
        jsonls = {},
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          ---@type LazyKeysSpec[]
          -- keys = {},
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
              },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
            },
          },
        },
        pylsp = {},
        -- ruff_lsp = {},
        rust_analyzer = {},
        -- pyright = {
        --   settings = {
        --     python = {
        --       analysis = {
        --         autoSearchPaths = true,
        --         useLibraryCodeForTypes = true,
        --       },
        --     },
        --   },
        -- },
        -- cssls = {},
        jdtls = {},
        tailwindcss = {
          -- root_dir = function(...)
          --   return require("lspconfig.util").root_pattern(".git")(...)
          -- end,
        },
        ts_ls = {
          -- root_dir = function(...)
          --   return require("lspconfig.util").root_pattern(".git")(...)
          -- end,
          -- single_file_support = false,
          -- settings = {
          --   typescript = {
          --     inlayHints = {
          --       includeInlayParameterNameHints = "literal",
          --       includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          --       includeInlayFunctionParameterTypeHints = true,
          --       includeInlayVariableTypeHints = false,
          --       includeInlayPropertyDeclarationTypeHints = true,
          --       includeInlayFunctionLikeReturnTypeHints = true,
          --       includeInlayEnumMemberValueHints = true,
          --     },
          --   },
          --   javascript = {
          --     inlayHints = {
          --       includeInlayParameterNameHints = "all",
          --       includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          --       includeInlayFunctionParameterTypeHints = true,
          --       includeInlayVariableTypeHints = true,
          --       includeInlayPropertyDeclarationTypeHints = true,
          --       includeInlayFunctionLikeReturnTypeHints = true,
          --       includeInlayEnumMemberValueHints = true,
          --     },
          --   },
          -- },
        },
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        require("roslyn").setup({
          config = {
            -- Here you can pass in any options that that you would like to pass to `vim.lsp.start`
            -- The only options that I explicitly override are, which means won't have any effect of setting here are:
            --     - `name`
            --     - `cmd`
            --     - `root_dir`
            --     - `on_init`
            settings = {
              ["csharp|inlay_hints"] = {
                csharp_enable_inlay_hints_for_implicit_object_creation = false,
                csharp_enable_inlay_hints_for_implicit_variable_types = false,
                csharp_enable_inlay_hints_for_lambda_parameter_types = false,
                csharp_enable_inlay_hints_for_types = false,
                dotnet_enable_inlay_hints_for_indexer_parameters = false,
                dotnet_enable_inlay_hints_for_literal_parameters = false,
                dotnet_enable_inlay_hints_for_object_creation_parameters = false,
                dotnet_enable_inlay_hints_for_other_parameters = false,
                dotnet_enable_inlay_hints_for_parameters = false,
                dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = false,
                dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = false,
                dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = false,
              },
              ["csharp|code_lens"] = {
                dotnet_enable_references_code_lens = false,
              },
            },
          },
          exe = {
            "dotnet",
            vim.fs.joinpath(vim.fn.stdpath("data"), "roslyn", "Microsoft.CodeAnalysis.LanguageServer.dll"),
          },
          -- NOTE: Set `filewatching` to false if you experience performance problems.
          -- Defaults to true, since turning it off is a hack.
          -- If you notice that the server is _super_ slow, it is probably because of file watching
          -- I noticed that neovim became super unresponsive on some large codebases, and that was because
          -- it schedules the file watching on the event loop.
          -- This issue went away by disabling that capability. However, roslyn will fallback to its own
          -- file watching, which can make the server super slow to initialize.
          -- Setting this option to false will indicate to the server that neovim will do the file watching.
          -- However, in `hacks.lua` I will also just don't start off any watchers, which seems to make the server
          -- a lot faster to initialize.
          filewatching = true,
        }),
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    }
  end,
}
