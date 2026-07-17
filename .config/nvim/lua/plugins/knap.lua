return {
  "frabjous/knap",
  ft = { "tex", "markdown" },
  keys = {
    {
      "<leader>p",
      function()
        require("knap").toggle_autopreviewing()
      end,
      desc = "Knap: toggle autopreview",
    },
  },
  config = function()
    local knap = require("knap")
    vim.g.knap_settings = {
      delay = 100,
      texoutputext = "pdf",
      textopdf = "pdflatex --shell-escape -synctex=1 -interaction=batchmode %docroot%",
      textopdfviewerlaunch = "zathura --synctex-editor-command "
        .. "'nvim --headless -es --cmd "
        .. "\"lua require('\"'\"'knaphelper'\"'\"').relayjump("
        .. "'\"'\"'%servername%'\"'\"',"
        .. "'\"'\"'%{input}'\"'\"',%{line},0)\"' "
        .. "%outputfile%",
      textopdfviewerrefresh = "none",
      textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
    }
    local function set_tex_engine(bufnr)
      bufnr = bufnr or vim.api.nvim_get_current_buf()
      if not vim.api.nvim_buf_is_valid(bufnr) then
        return
      end
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 15, false)
      local use_xelatex = false
      for _, line in ipairs(lines) do
        local lower = line:lower()
        -- Detect XeLaTeX from the first 15 lines. Supported forms include the following.
        --   % !TeX program = xelatex
        --   % xelatex
        -- and packages which require or commonly imply XeLaTeX.
        if
          lower:match("^%%+%s*!tex%s+program%s*=%s*xelatex")
          or lower:match("^%%+%s*xelatex%s*$")
          or lower:match("\\usepackage[^}]*{fontspec}")
          or lower:match("\\usepackage[^}]*{unicode%-math}")
          or lower:match("\\usepackage[^}]*{mathspec}")
        then
          use_xelatex = true
          break
        end
      end
      local settings = vim.b[bufnr].knap_settings or {}
      if use_xelatex then
        settings.textopdf = "xelatex --shell-escape -synctex=1 -interaction=batchmode %docroot%"
      else
        settings.textopdf = "pdflatex --shell-escape -synctex=1 -interaction=batchmode %docroot%"
      end
      vim.b[bufnr].knap_settings = settings
    end
    vim.api.nvim_create_autocmd({
      "BufReadPost",
      "BufNewFile",
      "BufWritePost",
    }, {
      pattern = "*.tex",
      callback = function(args)
        set_tex_engine(args.buf)
      end,
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "tex", "markdown" },
      callback = function(args)
        local bufnr = args.buf
        vim.keymap.set({ "n", "v", "i" }, "<F7>", function()
          knap.forward_jump()
        end, {
          buffer = bufnr,
          desc = "Knap: jump to cursor",
        })
        if vim.bo[bufnr].filetype == "tex" then
          set_tex_engine(bufnr)
          knap.toggle_autopreviewing()
        end
      end,
    })
  end,
}
