return {
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
  }
}
