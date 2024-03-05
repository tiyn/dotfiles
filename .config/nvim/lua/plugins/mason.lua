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
              -- latex
              require("null-ls").builtins.formatting.latexindent,
              -- lua
              require("null-ls").builtins.formatting.stylua,
              -- markdown
              require("null-ls").builtins.formatting.mdformat,
              -- python
              require("null-ls").builtins.formatting.black,
              require("null-ls").builtins.formatting.isort,
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
            "stylua",
          }
        }
      }
    },
    opts = { ui = { icons = Install_signs } }
  }
}
