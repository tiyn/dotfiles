-- loadplugins

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  -- indicate git diff status of line
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },

  -- show indentation lines (in empty lines too)
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
      })
    end,
  },

  -- improved java syntax highlighting
  {
    'uiiaoo/java-syntax.vim',
    ft = { 'java' },
  },

  -- custom statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          symbols = {
            error = Error_sign,
            warn = Warn_sign,
            hint = Hint_sign,
            info = Info_sign,
          },
          theme = 'tccs',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      })
    end,
  },

  -- show signature while typing
  'ray-x/lsp_signature.nvim',

  -- preview for markdown filetypes
  {
    "iamcco/markdown-preview.nvim",
    ft = { 'markdown' },
    build = "cd app && yarn install",
  },

  -- latex asynchronous pdf rendering
  {
    'donRaphaco/neotex',
    ft = { 'tex' },
    config = function()
      vim.g.neotex_enabled = 2
    end,
  },

  -- nim language support
  {
    'zah/nim.vim',
    ft = { 'nim' },
  },

  -- automatic closing of brackets
  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup()
    end
  },

  -- autocompletion and its sources
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-buffer',
      -- standalone cmp sources
      'hrsh7th/cmp-path',
      'lukas-reineke/cmp-under-comparator',
      -- lsp cmp source
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind-nvim',
      -- luasnip cmp source
      'l3mon4d3/luasnip',
      'saadparwaiz1/cmp_luasnip',
      -- lang server management
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'LostNeophyte/null-ls-embedded',
      'jay-babu/mason-null-ls.nvim',
      -- dependencies
      'nvim-lua/plenary.nvim',
    },
    config = function()
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
      require("null-ls").setup({
        sources = {
          require("null-ls-embedded").nls_source.with({
            filetypes = { "markdown" },
          }),
          require("null-ls").builtins.formatting.black,
          require("null-ls").builtins.formatting.mdformat,
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
          border = "none"
        },
        hint_prefix = Hint_sign,
        hint_scheme = "DiagnosticSignHint",
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
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
          },
        },
      }
    end,
  },

  -- fix for cursorhold function
  'antoinemadec/fixcursorhold.nvim',

  -- showing color of hex values, etc
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        '*',
        '!markdown',
      })
    end,
  },

  -- show tags
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
  },

  -- fileexplorer on the side
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
  },

  -- better language highlighting by improved parsing
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "css",
          "html",
          "java",
          "markdown",
          "latex",
          "python",
        },
        autotag = { enable = true },
      })
    end,
  },

  -- automatically close html-tags
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  -- folding improvements
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require('ufo').setup()
      vim.api.nvim_create_autocmd({ 'BufEnter', 'FileType' },
        {
          pattern = { '*' },
          command = 'lua require("ufo").closeAllFolds()'
        })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'FileType' },
        {
          pattern = { '*' },
          command = 'lua require("ufo").openAllFolds()'
        })
    end,
  },

  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup()
    end,
  },

  -- clean up white spaces and empty lines before writing
  {
    "mcauley-penney/tidy.nvim",
    config = function()
      require("tidy").setup({
        filetype_exclude = {},
      })
    end
  },

  -- todo symbols and highlighting
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'todo-comments'.setup {
        signs = true,
        sign_priority = 8,
        keywords = {
          ERRO = { icon = Error_sign, color = "error" },
          WARN = { icon = Warn_sign, color = "warning" },
          HACK = { icon = Hack_sign, color = "warning" },
          HINT = { icon = Hint_sign, color = "hint" },
          TODO = { icon = Todo_sign, color = "hint" },
          INFO = { icon = Info_sign, color = "info", alt = { "NOTE" } },
          PERF = { icon = Perfect_sign, color = "perfect" },
          TEST = { icon = Test_sign, color = "test" },
        },
        gui_style = {
          fg = "NONE",
          bg = "BOLD",
        },
        merge_keywords = true,
        highlight = {
          multiline = true,
          multiline_pattern = "^.",
          multiline_context = 10,
          before = "",
          keyword = "wide",
          after = "fg",
          pattern = [[.*<(KEYWORDS)\s*:]],
          comments_only = true,
          max_line_len = 400,
          exclude = {},
        },
        colors = {
          error = "DiagnosticSignError",
          warning = "DiagnosticSignWarn",
          hint = "DiagnosticSignHint",
          info = "DiagnosticSignInfo",
          perfect = "Special",
          test = "Identifier",
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          pattern = [[\b(KEYWORDS):]],
        },
      }
    end,
  },

  -- git wrapper
  'tpope/vim-fugitive',

  -- golang language support
  {
    'fatih/vim-go',
    ft = { 'go' },
    config = function()
      vim.g.go_def_mapping_enabled = 0
    end,
  },

  -- markdown language support
  {
    'preservim/vim-markdown',
    ft = { 'markdown' },
    dependencies = { 'godlygeek/tabular' },
    config = function()
      vim.g.vim_markdown_folding_style_pythonic = 1
      vim.g.vim_markdown_folding_disabled = 0
      vim.g.vim_markdown_conceal = 2
    end,
  },

  -- bulk renamer
  'qpkorr/vim-renamer',

  -- additional quote/parantheses funtions
  'tpope/vim-surround',

  -- colorscheme
  {
    'tiyn/vim-tccs',
    config = function()
      vim.cmd('colorscheme tccs')
    end,
  },
})
