-- set diagnostic signs
Error_sign = " "
Warn_sign = " "
Info_sign = " "
Hint_sign = " "
Hack_sign = " "
Todo_sign = " "
Perfect_sign = " "
Test_sign = " "

Menu_signs = {
  nvim_lsp = "",
  path = "",
  buffer = "",
  luasnip = "",
}

Symbol_map = {
  Text = "",
  Method = "",
  Function = "φ",
  Constructor = "",
  Field = "■",
  Variable = "β",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "π",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

Install_icons = {
  package_installed = "✓",
  package_pending = "➜",
  package_uninstalled = "✗"
}

vim.fn.sign_define(
  "DiagnosticSignError",
  { texthl = "DiagnosticSignError", text = Error_sign, numhl = "DiagnosticSignError" }
)
vim.fn.sign_define(
  "DiagnosticSignWarn",
  { texthl = "DiagnosticSignWarn", text = Warn_sign, numhl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
  "DiagnosticSignInfo",
  { texthl = "DiagnosticSignInfo", text = Info_sign, numhl = "DiagnosticSignInfo" }
)
vim.fn.sign_define(
  "DiagnosticSignHint",
  { texthl = "DiagnosticSignHint", text = Hint_sign, numhl = "DiagnosticSignHint" }
)
