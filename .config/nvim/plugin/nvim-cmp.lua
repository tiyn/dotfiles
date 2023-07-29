-- hrsh7th/nvim-cmp

-- jose-elias-alvarez/null-ls.nvim
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    require("null-ls-embedded").nls_source,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.mdformat,
  },
})

require("null-ls").setup({
  sources = {
    require("null-ls-embedded").nls_source.with({
      -- default filetypes:
      filetypes = { "markdown" },
    }),
  },
})

-- mason package manager
require("mason").setup()

require("mason-lspconfig").setup({
  -- automatically install language servers setup below for lspconfig
  automatic_setup = true,
})

require("mason-null-ls").setup({
  automatic_installation = true,
  ensure_installed = {}
})

-- Add additional capabilities supported by nvim-cmp
capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
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
    format = lspkind.cmp_format({
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
require("luasnip.loaders.from_snipmate").lazy_load()

-- neovim/nvim-lspconfig
local nvim_lsp = require('lspconfig')

require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

local navbuddy = require("nvim-navbuddy")

local attach_func = function(client, bufnr)
  navbuddy.attach(client, bufnr)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "bashls", "texlab", "ccls", "nimls", "marksman" }
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
  flags = {
    debounce_text_changes = 150
  },
  cmd = { 'jdtls' }
}

require 'lspconfig'.lua_ls.setup {
  on_attach = attach_func,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}
