return {
  -- lang server management
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      {
        "mrcjkb/rustaceanvim",
        version = "^6",
        lazy = false,
      },
      {
        "hrsh7th/cmp-nvim-lsp",
        config = function()
          Capabilities = require("cmp_nvim_lsp").default_capabilities()
          Capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          }
        end,
      },
    },
    config = function()
      require("mason-lspconfig").setup({
        automatic_setup = true,
        ensure_installed = {
          -- assembler
          "asm_lsp",
          -- c
          "clangd",
          -- docker
          "dockerls",
          -- go
          "gopls",
          -- html
          "html",
          -- json
          "jsonls",
          -- xml
          "lemminx",
          -- latex
          "ltex",
          "texlab",
          -- lua
          "lua_ls",
          -- markdown
          "marksman",
          -- nim
          "nimls",
          -- python
          "pyright",
          -- r
          "r_language_server",
          -- shell
          "bashls",
          -- sql
          "sqlls",
          -- typescript / javascript
          "ts_ls",
          -- yaml
          "yamlls",
        },
      })
      local default_flags = {
        debounce_text_changes = 150,
        allow_incremental_sync = true,
        progress = true,
      }
      local servers = {
        ltex = {
          settings = {
            ltex = {
              -- language = "de-DE",
              enabled = { "latex", "markdown" },
              dictionary = Dictionaries,
            },
          },
        },
        lua_ls = {
          settings = {
            lua = {
              diagnostics = { globals = { "vim" } },
              telemetry = { enable = false },
            },
          },
        },
        pyright = {}
      }
      for name, config in pairs(servers) do
        vim.lsp.config(name, vim.tbl_extend("force", config, {
          on_attach = on_attach,
          capabilities = Capabilities,
          flags = default_flags,
        }))
      end
    end,
  },
}
