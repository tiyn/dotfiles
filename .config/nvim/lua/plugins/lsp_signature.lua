return {
  -- show function signature while typing
  {
    'ray-x/lsp_signature.nvim',
    opts = {
      bind = true,
      handler_opts = {
        border = "none"
      },
      hint_prefix = Hint_sign,
      hint_scheme = "DiagnosticSignHint"
    }
  }
}
