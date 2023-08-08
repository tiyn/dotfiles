-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
    -- display git status per line
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    },

    -- show indentation lines
    {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require("indent_blankline").setup({
          show_current_context = true,
          show_current_context_start = true
        })
      end,
    },

    -- statusline
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons', },
      config = function()
        require('lualine').setup({
          options = {
            symbols = {
              error = Error_sign,
              warn = Warn_sign,
              hint = Hint_sign,
              info = Info_sign
            },
            theme = 'tccs',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' }
          },
        })
      end
    },

    -- show function signature while typing
    {
      'ray-x/lsp_signature.nvim',
      config = function()
        require "lsp_signature".setup({
          bind = true,
          handler_opts = {
            border = "none"
          },
          hint_prefix = Hint_sign,
          hint_scheme = "DiagnosticSignHint"
        })
      end
    },

    -- preview for markdown filetypes
    {
      "iamcco/markdown-preview.nvim",
      ft = { 'markdown' },
      build = "cd app && yarn install"
    },

    -- latex asynchronous pdf rendering
    {
      'donRaphaco/neotex',
      ft = { 'tex' },
      config = function()
        vim.g.neotex_enabled = 2
      end
    },

    -- nim language support
    {
      'zah/nim.vim',
      ft = { 'nim' }
    },

    -- automatic closing of brackets
    {
      'windwp/nvim-autopairs',
      config = function()
        require("nvim-autopairs").setup()
      end
    },

    -- lang server installations
    {
      'williamboman/mason.nvim',
      dependencies = {
        {
          'jose-elias-alvarez/null-ls.nvim',
          config = function()
            require("null-ls").setup({
              sources = {
                require("null-ls-embedded").nls_source.with({
                  filetypes = { "markdown" }
                }),
                require("null-ls").builtins.formatting.black,
                require("null-ls").builtins.formatting.mdformat
              }
            })
          end
        },
        {
          'jay-babu/mason-null-ls.nvim',
          config = function()
            -- jay-babu/mason-null-ls.nvim
            require("mason-null-ls").setup({
              automatic_installation = true,
              ensure_installed = { "black", "mdformat" }
            })
          end
        },
        'LostNeophyte/null-ls-embedded'
      },
      config = function()
        require("mason").setup({
          ui = {
            icons = Install_signs
          }
        })
      end
    },

    -- lang server management
    {
      'williamboman/mason-lspconfig.nvim',
      dependencies = {
        'neovim/nvim-lspconfig',
        {
          'hrsh7th/cmp-nvim-lsp',
          config = function()
            Capabilities = require("cmp_nvim_lsp").default_capabilities()
            Capabilities.textDocument.foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true
            }
          end
        },
        -- navigation menu
        {
          'SmiteshP/nvim-navbuddy',
          config = function()
            local navbuddy = require("nvim-navbuddy")
            Attach_func = function(client, bufnr)
              navbuddy.attach(client, bufnr)
            end
          end,
          dependencies = {
            'SmiteshP/nvim-navic',
            'MunifTanjim/nui.nvim'
          }
        },
      },
      config = function()
        require("mason-lspconfig").setup({
          automatic_setup = true,
          ensure_installed = {
            "bashls",
            "jdtls",
            "lua_ls",
            "marksman",
            "nimls",
            "pyright",
            "texlab"
          }
        })
        require("mason-lspconfig").setup_handlers({
          function(server_name)
            require('lspconfig')[server_name].setup({
              on_attach = Attach_func,
              capabilities = Capabilities,
              flags = {
                debounce_text_changes = 150
              }
            })
          end,
          ["lua_ls"] = function()
            require 'lspconfig'.lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' }
                  }
                }
              }
            })
          end
        })
      end
    },

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
            { name = 'path' },
            { name = 'buffer' },
            { name = 'luasnip' }
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
    },

    -- fix for cursorhold function
    'antoinemadec/fixcursorhold.nvim',

    -- showing color of hex values, etc
    {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('colorizer').setup({
          '*',
          '!markdown'
        })
      end
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
          filters = {
            dotfiles = true,
          },
          renderer = {
            group_empty = true,
            icons = {
              glyphs = {
                git = Git_signs
              },
            },
          }
        })
      end
    },

    -- better language highlighting by improved parsing
    {
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        -- automatically close html-tags
        'windwp/nvim-ts-autotag',
      },
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
          autotag = { enable = true }
        })
      end
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
      end
    },

    -- fuzzy finder
    {
      'nvim-telescope/telescope.nvim',
      version = '0.1.2',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require("telescope").setup()
      end
    },

    -- clean up white spaces and empty lines before writing
    {
      "mcauley-penney/tidy.nvim",
      event = "VeryLazy",
      config = function()
        require("tidy").setup({
          filetype_exclude = {}
        })
      end
    },

    -- todo symbols and highlighting
    {
      'folke/todo-comments.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require 'todo-comments'.setup {
          keywords = {
            ERRO = { icon = Error_sign, color = "error" },
            WARN = { icon = Warn_sign, color = "warning" },
            HACK = { icon = Hack_sign, color = "warning" },
            HINT = { icon = Hint_sign, color = "hint" },
            TODO = { icon = Todo_sign, color = "info" },
            INFO = { icon = Info_sign, color = "hint", alt = { "NOTE" } },
            PERF = { icon = Perfect_sign, color = "default" },
            TEST = { icon = Test_sign, color = "test" }
          }
        }
      end
    },

    -- git wrapper
    {
      'tpope/vim-fugitive',
      event = "VeryLazy"
    },

    -- markdown language support
    {
      'preservim/vim-markdown',
      ft = { 'markdown' },
      config = function()
        vim.g.vim_markdown_folding_style_pythonic = 1
      end
    },

    -- bulk renamer
    {
      'qpkorr/vim-renamer',
      event = "VeryLazy"
    },

    -- additional quote/parantheses funtions
    {
      "kylechui/nvim-surround",
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup()
      end
    },

    -- colorscheme
    {
      'tiyn/vim-tccs',
      config = function()
        vim.cmd('colorscheme tccs')
      end
    },
  },
  {
    ui = {
      icons = Lazy_signs
    }
  }
)
