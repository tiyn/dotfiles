-- hrsh7th/nvim-cmp
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_snipmate").lazy_load()

cmp.setup {
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require "cmp-under-comparator".under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'luasnip' },
  },
  formatting = {
    format = require("lspkind").cmp_format({
      mode = "symbol_text",
      preset = "codicons",
      maxwidth = 50,
      menu = {
        nvim_lsp = "[LSP]",
        path = "[PATH]",
        buffer = "[BUF]",
        luasnip = "[SNIP]",
      },
      symbol_map = {
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
      },
    }),
  },
}

-- jose-elias-alvarez/null-ls.nvim
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    require("null-ls-embedded").nls_source.with({
      filetypes = { "markdown" },
    }),
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.mdformat,
  },
})

-- williamboman/mason.nvim
require("mason").setup()

-- williamboman/mason-lspconfig.nvim
require("mason-lspconfig").setup({
  automatic_setup = true,
  ensure_installed = { "pyright", "bashls", "texlab", "nimls", "marksman", "jdtls", "lua_ls" }
})

-- jay-babu/mason-null-ls.nvim
require("mason-null-ls").setup({
  automatic_installation = true,
  ensure_installed = {}
})

-- ray-x/lsp_signature.nvim
require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

-- smiteshp/nvim-navbuddy
local navbuddy = require("nvim-navbuddy")

-- hrsh7th/cmp-nvim-lsp
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- neovim/nvim-lspconfig
local nvim_lsp = require('lspconfig')

local servers = { "pyright", "bashls", "texlab", "nimls", "marksman" }

local attach_func = function(client, bufnr)
  navbuddy.attach(client, bufnr)
end

local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = attach_func,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150
    }
  }
end

require 'lspconfig'.jdtls.setup {
  on_attach = attach_func,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150
  },
  cmd = { 'jdtls' }
}

require 'lspconfig'.lua_ls.setup {
  on_attach = attach_func,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}

require('ufo').setup()

vim.fn.sign_define(
  "DiagnosticSignError",
  { texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define(
  "DiagnosticSignWarn",
  { texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
  "DiagnosticSignInfo",
  { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" }
)
vim.fn.sign_define(
  "DiagnosticSignHint",
  { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" }
)
