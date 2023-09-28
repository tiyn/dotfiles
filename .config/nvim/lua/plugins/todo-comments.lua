return {
  -- todo symbols and highlighting
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      keywords = {
        ERRO = { icon = Error_sign, color = "error" },
        WARN = { icon = Warn_sign, color = "warning" },
        HACK = { icon = Hack_sign, color = "warning" },
        HINT = { icon = Hint_sign, color = "hint" },
        TODO = { icon = Todo_sign, color = "info" },
        INFO = { icon = Info_sign, color = "hint", alt = { "NOTE" } },
        PERF = { icon = Perfect_sign, color = "default" },
        TEST = { icon = Test_sign, color = "test" }
      },
      colors = {
        default = { "Operator" }
      }
    }
  }
}
