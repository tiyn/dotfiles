-- display certain invisible chars
vim.opt.list = true
vim.opt.listchars:append "space:·"
vim.opt.listchars:append "eol:"

-- set signs for various uses
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

Lsp_signs = {
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

Install_signs = {
  package_installed = "",
  package_pending = "",
  package_uninstalled = "✗"
}

Git_signs = {
  unstaged = "",
  staged = "",
  unmerged = "",
  renamed = "",
  deleted = "",
  untracked = "",
  ignored = "",
}

Lazy_signs = {
  cmd = " ",
  config = "",
  event = "",
  ft = " ",
  init = " ",
  import = " ",
  keys = " ",
  lazy = "󰒲 ",
  loaded = " ",
  not_loaded = "",
  plugin = " ",
  runtime = " ",
  source = " ",
  start = "",
  task = " ",
  list = {
    "●",
    "➜",
    "",
    "",
  }
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
