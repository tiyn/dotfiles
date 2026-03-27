return {
  -- bridge mason and null-ls
  "jay-babu/mason-null-ls.nvim",
  lazy = true, -- load as dependency
  opts = {
    automatic_installation = true,
    ensure_installed = {
      -- assembler
      "asmfmt",
      -- lua
      "stylua",
      -- markdown
      "mdformat",
      -- python
      "isort",
      "yapf",
      -- shell
      "shfmt",
      -- yaml
      "yamlfmt",
    },
  },
}
