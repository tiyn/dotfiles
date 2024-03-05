return {
  -- lang server installations
  {
    'williamboman/mason.nvim',
    dependencies = {
      {
        'nvimtools/none-ls.nvim',
        config = function()
          require("null-ls").setup({
            sources = {
              -- python
              require("null-ls").builtins.formatting.isort,
              require("null-ls").builtins.formatting.black,
              -- markdown
              require("null-ls").builtins.formatting.mdformat,
              -- latex
              require("null-ls").builtins.formatting.latexindent,
            }
          })
        end
      },
      {
        'jay-babu/mason-null-ls.nvim',
        opts = {
          automatic_installation = true,
          ensure_installed = {
            "black",
            "isort",
            "latexindent",
            "mdformat",
          }
        }
      }
    },
    opts = { ui = { icons = Install_signs } }
  }
}
