return {
  -- lang server management
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
        -- "asm_lsp", -- TODO: needs extra steps to install (rust)
        -- c
        "clangd",
        -- docker
        -- "dockerls", -- TODO: needs extra steps to install (npm)
        -- go
        -- "gopls", -- TODO: needs extra steps to install (go)
        -- html
        -- "html", -- TODO: needs extra steps to install (npm)
        -- json
        -- "jsonls", -- TODO: needs extra steps to install (npm)
        -- xml
        "lemminx",
        -- latex
        -- "ltex", -- TODO: needs extra steps to install
        "texlab",
        -- lua
        "lua_ls",
        -- markdown
        "marksman",
        -- nim
        -- "nimls", -- TODO: needs extra steps to install (nimble)
        -- python
        -- "pyright", -- TODO: needs extra steps to install (npm)
        -- r
        -- "r_language_server", -- TODO: installation takes really long
        -- shell
        -- "bashls", -- TODO: needs extra steps to install (npm)
        -- sql
        -- "sqlls", -- TODO: needs extra steps to install (npm)
        -- typescript / javascript
        -- "ts_ls", -- TODO: needs extra steps to install (npm)
        -- yaml
        -- "yamlls", -- TODO: needs extra steps to install (npm)
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
      pyright = {},
    }
    for name, config in pairs(servers) do
      vim.lsp.config(
        name,
        vim.tbl_extend("force", config, {
          on_attach = on_attach,
          capabilities = Capabilities,
          flags = default_flags,
        })
      )
    end
  end,
}
