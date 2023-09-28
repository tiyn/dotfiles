return {
  -- lang server installations
  {
    'williamboman/mason.nvim',
    dependencies = {
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require("null-ls").setup({
            sources = {
              require("null-ls").builtins.formatting.black,
              require("null-ls").builtins.formatting.mdformat
            }
          })
        end
      },
      {
        'jay-babu/mason-null-ls.nvim',
        opts = {
          automatic_installation = true,
          ensure_installed = { "black", "mdformat" }
        }
      },

    },
    opts = {
      ui = {
        icons = Install_signs
      }
    }
  }
}
