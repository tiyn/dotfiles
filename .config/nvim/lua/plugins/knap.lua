return {
  {
    'frabjous/knap',
    ft = { 'tex' },
    config = function()

      local function detect_engine()
        local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""
        if first_line:match("^%%%s*xelatex") then
          return "xelatex"
        else
          return "pdflatex"
        end
      end

      local function set_engine()
        local engine = detect_engine()

        if engine == "xelatex" then
          vim.g.knap_settings.textopdf =
            "xelatex -synctex=1 -interaction=batchmode %docroot%"
        else
          vim.g.knap_settings.textopdf =
            "pdflatex -synctex=1 -interaction=batchmode %docroot%"
        end
      end

      vim.g.knap_settings = {
        delay = 100,
        texoutputext = "pdf",
        textopdf = "xelatex -synctex=1 -interaction=batchmode %docroot%",
        textopdfviewerlaunch =
          "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' ./%outputfile%",
        textopdfviewerrefresh = "reload",
        textopdfforwardjump =
          "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
      }

      vim.api.nvim_create_autocmd("User", {
        pattern = "KnapShowView",
        callback = set_engine
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "KnapCompile",
        callback = set_engine
      })

      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.tex",
        callback = set_engine
      })
    end
  }
}
