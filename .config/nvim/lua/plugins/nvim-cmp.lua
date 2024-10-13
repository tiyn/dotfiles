return {
  -- autocompletion and its sources and snippets
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'onsails/lspkind-nvim',
      -- cmp sources
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'lukas-reineke/cmp-under-comparator',
      -- luasnip
      {
        'l3mon4d3/luasnip',
        config = function()
          require("luasnip.loaders.from_snipmate").lazy_load()
        end,
        build = "make install_jsregexp",
        dependencies = { 'saadparwaiz1/cmp_luasnip' }
      },
    },
    config = function()
      local cmp = require("cmp")
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
            cmp.config.compare.order
          },
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        mapping = {
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              require("luasnip").jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
          }
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' }
        },
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol_text",
            preset = "codicons",
            maxwidth = 50,
            menu = Menu_signs,
            symbol_map = Lsp_signs
          })
        }
      }
    end
  }
}
