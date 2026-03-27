return {
  -- inject lsp diagnostics, etc
  "nvimtools/none-ls.nvim",
  lazy = true, -- load as dependency
  config = function()
    require("null-ls").setup({
      sources = {
        -- assembler
        require("null-ls").builtins.formatting.asmfmt,
        -- lua
        require("null-ls").builtins.formatting.stylua,
        -- markdown
        require("null-ls").builtins.formatting.mdformat,
        -- python
        require("null-ls").builtins.formatting.isort,
        require("null-ls").builtins.formatting.yapf,
        -- shell
        require("null-ls").builtins.formatting.shfmt,
        -- yaml
        require("null-ls").builtins.formatting.yamlfmt,
      },
    })
  end,
}
