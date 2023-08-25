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
    -- colorscheme
    {
      'tiyn/tccs.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        require('tccs').setup({
          require('tccs').load()
        })
      end
    },

    -- display git status per line
    {
      'lewis6991/gitsigns.nvim',
      opts = {}
    },

    -- show indentation lines
    {
      'lukas-reineke/indent-blankline.nvim',
      event = "BufReadPre",
      opts = {
        show_current_context = true,
        show_current_context_start = true
      }
    },

    -- statusline
    {
      'nvim-lualine/lualine.nvim',
      dependencies = {
        {
          'nvim-tree/nvim-web-devicons',
          lazy = true
        },
        {
          'f-person/git-blame.nvim',
          config = function()
            vim.g.gitblame_display_virtual_text = 0
          end
        },
        { 'tiyn/tccs.nvim' },
      },
      config = function()
        require('lualine').setup({
          options = {
            globalstatus = true,
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
          sections = {
            lualine_b = {
              { require('gitblame').get_current_blame_text, cond = require('gitblame').is_blame_text_available }
            },
            lualine_c = {},
            lualine_x = {
              'encoding',
              'fileformat',
              {
                'filetype',
                icon_only = true
              }
            },
            lualine_y = {
              {
                'filename',
                file_status = true,
                newfile_status = true,
                path = 1,
                shorting_target = 50,
                symbols = {
                  modified = Lualine_signs["modified"],
                  readonly = Lualine_signs["readonly"],
                  unnamed = Lualine_signs["unnamed"],
                  newfile = Lualine_signs["newfile"],
                }
              }
            },
            lualine_z = { 'progress', 'location' },
          }
        })
      end
    },

    -- show function signature while typing
    {
      'ray-x/lsp_signature.nvim',
      opts = {
        bind = true,
        handler_opts = {
          border = "none"
        },
        hint_prefix = Hint_sign,
        hint_scheme = "DiagnosticSignHint"
      }
    },

    -- preview for markdown filetypes
    {
      "iamcco/markdown-preview.nvim",
      ft = { 'markdown' },
      build = "cd app && yarn install",
      config = function()
        vim.cmd([[
          function OpenMarkdownPreview (url)
            execute "silent ! firefox --kiosk --new-window " . a:url
          endfunction
        ]])
        vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
      end
    },

    -- automatic closing of brackets
    {
      'windwp/nvim-autopairs',
      opts = {}
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
                require("null-ls").builtins.formatting.black,
                require("null-ls").builtins.formatting.mdformat
              }
            })
          end
        },
        {
          'jay-babu/mason-null-ls.nvim',
          opts = {
            automatic_installation = true,
            ensure_installed = { "black", "mdformat" }
          }
        },

      },
      opts = {
        ui = {
          icons = Install_signs
        }
      }
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
            "lua_ls",
            "marksman",
            "nimls",
            "pylsp",
            "texlab"
          }
        })
        local servers = {
          lua_ls = {
            Lua = {
              diagnostics = {
                globals = { 'vim' }
              },
              telemetry = { enable = false },
            },
          }
        }
        local default = { __index = function() return {} end }
        setmetatable(servers, default)
        require("mason-lspconfig").setup_handlers({
          function(server_name)
            require('lspconfig')[server_name].setup({
              on_attach = Attach_func,
              capabilities = Capabilities,
              flags = {
                debounce_text_changes = 150
              },
              settings = servers[server_name]
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
            require("luasnip.loaders.from_snipmate")
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
    -- 'antoinemadec/fixcursorhold.nvim',

    -- showing color of hex values, etc
    {
      'nvchad/nvim-colorizer.lua',
      opts = {
        filetypes = {
          '*',
          '!markdown'
        },
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          RRGGBBAA = true,
          AARRGGBB = true,
          rgb_fn = true,
          hsl_fn = true,
          css_fn = true,
          mode = "virtualtext",
          virtualtext = " ",
        },
        -- all the sub-options of filetypes apply to buftypes
        buftypes = {
          "*",
          "!prompt",
          "!popup"
        },
      }
    },

    -- fileexplorer on the side
    {
      "nvim-tree/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      dependencies = {
        {
          "nvim-tree/nvim-web-devicons",
          lazy = true
        },
      },
      opts = {
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
      }
    },

    -- better language highlighting by improved parsing
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      dependencies = {
        -- automatically close html-tags
        'windwp/nvim-ts-autotag',
        -- color brackets
        'p00f/nvim-ts-rainbow',
      },
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "bash",
            "css",
            "html",
            "markdown",
            "markdown_inline",
            "latex",
            "python",
            "lua",
          },
          highlight = { enable = true },
          autotag = { enable = true },
          rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
            -- colors = {},
            -- termcolors = {}
          }
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
      opts = {}
    },

    -- clean up white spaces and empty lines before writing
    {
      "mcauley-penney/tidy.nvim",
      opts = {
        filetype_exclude = {}
      }
    },

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
    },

    -- additional quote/parantheses funtions
    {
      'kylechui/nvim-surround',
      version = "*",
      event = "VeryLazy",
      opts = {}
    },

    -- commenting improvements
    {
      'numToStr/Comment.nvim',
      opts = {}
    },

    -- latex asynchronous pdf rendering
    {
      'frabjous/knap',
      ft = { 'tex' },
      config = function()
        vim.g.knap_settings = {
          texoutputext = "pdf",
          textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
          textopdfviewerlaunch =
          "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
          textopdfviewerrefresh = "none",
          textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%"
        }
      end
    },

    -- improved wild menu
    {
      'gelguy/wilder.nvim',
      dependencies = {
        {
          "nvim-tree/nvim-web-devicons",
          lazy = true
        },
        'roxma/nvim-yarp',
        'roxma/vim-hug-neovim-rpc',
        'romgrk/fzy-lua-native'
      },
      config = function()
        local wilder = require('wilder')
        wilder.setup({
          modes = { ':', '/', '?' },
          accept_key = '<CR>',
          reject_key = '<C-e>'
        })
        wilder.set_option('renderer', wilder.popupmenu_renderer({
          highlighter = wilder.basic_highlighter(),
          left = { ' ', wilder.popupmenu_devicons() },
          right = { ' ', wilder.popupmenu_scrollbar() },
        }))
        wilder.set_option('pipeline', {
          wilder.branch(
            wilder.python_file_finder_pipeline({
              file_command = { 'find', '.', '-type', 'f', '-printf', '%P\n' },
              dir_command = { 'find', '.', '-type', 'd', '-printf', '%P\n' },
              filters = { 'fuzzy_filter', 'difflib_sorter' },
            }),
            wilder.cmdline_pipeline({
              language = 'python',
              fuzzy = 2,
            }),
            wilder.python_search_pipeline({
              pattern = wilder.python_fuzzy_pattern(),
              sorter = wilder.python_difflib_sorter(),
              engine = 're',
            })
          ),
        })
      end,
    },

    -- scrollbar with git and diagnostics support for easier navigation
    {
      'petertriho/nvim-scrollbar',
      dependencies = {
        'kevinhwang91/nvim-hlslens',
        'lewis6991/gitsigns.nvim'
      },
      config = function()
        require("scrollbar").setup({
          marks = {
            Cursor = {
              highlight = "Normal"
            },
            Search = {
              highlight = "Special"
            },
            Error = {
              highlight = "DiagnosticSignError"
            },
            Warn = {
              highlight = "DiagnosticSignWarn"
            },
            Info = {
              highlight = "DiagnosticSignInfo"
            },
            Hint = {
              highlight = "DiagnosticSignHint"
            },
            Misc = {
              highlight = "Special"
            },
            GitAdd = {
              highlight = "GitGutterAdd"
            },
            GitChange = {
              highlight = "GitGutterChange"
            },
            GitDelete = {
              highlight = "GitGutterDelete"
            }
          },
          excluded_filetypes = {
            "cmp_docs",
            "cmp_menu",
            "noice",
            "prompt",
            "TelescopePrompt",
            "NvimTree",
            "Navbuddy",
            "FTerm",
            "",
          },
        })
        require("scrollbar.handlers.search").setup()
        require("scrollbar.handlers.gitsigns").setup()
      end
    },

    -- floating terminal to toggle
    {
      'numToStr/FTerm.nvim',
      opts = {}
    },

    -- side by side git diffs for merge conflicts
    {
      'sindrets/diffview.nvim',
      opts = {}
    },

    -- list of errors
    {
      'folke/trouble.nvim',
      dependencies = {
        {
          'nvim-tree/nvim-web-devicons',
          lazy = true
        }
      },
      opts = {}
    },

    -- improve spelling check for coding to feature camelcase, etc
    {
      'kamykn/spelunker.vim',
      dependencies = { 'kamykn/popup-menu.nvim' },
      config = function()
        vim.o.nospell = true
        vim.g.enable_spelunker_vim = 0
        vim.g.spelunker_disable_acronym_checking = 1
      end
    },

    -- improved gui for renaming
    {
      'filipdutescu/renamer.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts = {}
    },

  },
  -- lazy.nvim configuration
  {
    ui = {
      icons = Lazy_signs
    }
  }
)
