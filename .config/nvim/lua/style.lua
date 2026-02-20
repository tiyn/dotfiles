-- set signs for various uses
Return_sign = ""
Space_sign = "·"

Reference_sign = "%s"
Definition_sign = ""

Error_sign = " "
Hack_sign = " "
Hint_sign = " "
Info_sign = " "
Perfect_sign = " "
Test_sign = " "
Todo_sign = " "
Warn_sign = " "

Menu_signs = {
  buffer = "",
  luasnip = "",
  nvim_lsp = "",
  path = "",
}


Lsp_signs = {
  Array = "",
  Boolean = "⊥",
  Class = "",
  Color = "",
  Component = "",
  Constant = "π",
  Constructor = "",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "■",
  File = "",
  Folder = "",
  Fragment = "",
  Function = "φ",
  Interface = "",
  Keyword = "",
  Method = "",
  Module = "",
  Namespace = "",
  Null = "∅",
  Number = "#",
  Object = "",
  Operator = "",
  Package = "",
  Property = "",
  Reference = "",
  Snippet = "",
  String = "",
  Struct = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Variable = "β",
}

Install_signs = {
  package_installed = "",
  package_pending = "",
  package_uninstalled = "✗",
}

Git_signs = {
  deleted = "",
  ignored = "",
  renamed = "",
  staged = "",
  unmerged = "",
  unstaged = "",
  untracked = "",
}

Lazy_signs = {
  cmd = " ",
  config = " ",
  event = " ",
  ft = " ",
  import = " ",
  init = " ",
  keys = " ",
  lazy = "󰒲 ",
  list = {
    "●",
    "➜",
    "",
    "",
  },
  loaded = " ",
  not_loaded = " ",
  plugin = " ",
  runtime = " ",
  source = " ",
  start = " ",
  task = " ",
}

Lualine_signs = {
  modified = "",
  newfile = "",
  readonly = "",
  unnamed = "",
}

vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = Error_sign,
      [vim.diagnostic.severity.WARN] = Warn_sign,
      [vim.diagnostic.severity.INFO] = Info_sign,
      [vim.diagnostic.severity.HINT] = Hint_sign,
    },
  },
})

-- enable colorcolumn when textwidth is set
vim.o.cursorline = true
vim.opt_local.colorcolumn = "+" .. vim.fn.join(vim.fn.range(0, 254), ",+")
-- alternatively highlight only one line for colorcolumn
-- vim.o.colorcolumn = "-0"

-- display certain invisible chars
vim.o.list = true
vim.opt.listchars:append("space:" .. Space_sign)
vim.opt.listchars:append("eol:" .. Return_sign)
