return {
  -- lang server management
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      {
        'hrsh7th/cmp-nvim-lsp',
        config = function()
          Capabilities = require("cmp_nvim_lsp").default_capabilities()
          Capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
          }
        end
      },
    },
    config = function()
      require("mason-lspconfig").setup({
        automatic_setup = true,
        ensure_installed = {
          "bashls",
          "clangd",
          "dockerls",
          "gopls",
          "html",
          "jsonls",
          "lua_ls",
          "marksman",
          "nimls",
          "pyright",
          "r_language_server",
          "sqlls",
          "texlab",
          "tsserver",
          "lemminx",
          "yamlls",
        }
      })
      local servers = {
        lua_ls = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            },
            telemetry = { enable = false },
          },
        }
      }
      local default = { __index = function() return {} end }
      setmetatable(servers, default)
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require('lspconfig')[server_name].setup({
            on_attach = Attach_func,
            capabilities = Capabilities,
            flags = {
              debounce_text_changes = 150
            },
            settings = servers[server_name]
          })
        end
      })
    end
  }
}
