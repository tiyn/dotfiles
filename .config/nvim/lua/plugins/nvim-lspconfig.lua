return {
  -- lang server management
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  lazy = false,
  opts = {
    automatic_setup = true,
    ensure_installed = {
      "asm_lsp",
      "clangd",
      "dockerls",
      "gopls",
      "html",
      "jsonls",
      "lemminx",
      "ltex",
      "texlab",
      "lua_ls",
      "marksman",
      "nimls",
      "pyright",
      "r_language_server",
      "bashls",
      "sqlls",
      "ts_ls",
      "yamlls",
    },
  },
  config = function(_, opts)
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup(opts)
    local default_flags = {
      debounce_text_changes = 150,
      allow_incremental_sync = true,
      progress = true,
    }
    local servers = {
      ltex = {
        settings = {
          ltex = {
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
      pyright = {},
    }
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    for name, config in pairs(servers) do
      vim.lsp.config(
        name,
        vim.tbl_extend("force", config, {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = default_flags,
        })
      )
    end
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end,
    })
  end,
}
