-- hrsh7th/nvim-cmp

-- mason package manager
require("mason").setup()
require("mason-lspconfig").setup({
    -- automatically install language servers setup below for lspconfig
    automatic_setup = true,
})

-- jose-elias-alvarez/null-ls.nvim
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.nimpretty,
    },
})

require("mason-null-ls").setup({
    automatic_installation = true
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
  }},
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
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      },
    }),
  },
}
require("luasnip.loaders.from_snipmate").lazy_load()


-- local on_attach = function(client, bufnr)
--     if client.server_capabilities.documentHighlightProvider then
--         vim.cmd [[
--             hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
--             hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
--             hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
--         ]]
--         vim.api.nvim_create_augroup('lsp_document_highlight', {
--             clear = false
--         })
--         vim.api.nvim_clear_autocmds({
--             buffer = bufnr,
--             group = 'lsp_document_highlight',
--         })
--         vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--             group = 'lsp_document_highlight',
--             buffer = bufnr,
--             callback = vim.lsp.buf.document_highlight,
--         })
--         vim.api.nvim_create_autocmd('CursorMoved', {
--             group = 'lsp_document_highlight',
--             buffer = bufnr,
--             callback = vim.lsp.buf.clear_references,
--         })
--     end
-- end
--
-- vim.g.cursorhold_updatetime = 100

-- neovim/nvim-lspconfig
local nvim_lsp = require('lspconfig')

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "bashls", "texlab", "ccls", "nimls", "marksman" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach=on_attach,
        capabilities=capabilities,
        flags = {
            debounce_text_changes = 150
            }
        }
end


require'lspconfig'.jdtls.setup{
    on_attach=on_attach,
    flags = {
        debounce_text_changes = 150
        },
    cmd = { 'jdtls' }
    }
