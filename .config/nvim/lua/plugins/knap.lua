return {
  -- latex asynchronous pdf rendering
  {
    'frabjous/knap',
    ft = { 'tex' },
    config = function()
      vim.g.knap_settings = {
        -- tex
        texoutputext = "pdf",
        textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
        textopdfviewerlaunch =
        "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' ./%outputfile%",
        textopdfviewerrefresh = "none",
        textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
        -- markdown
        mdoutputext = "pdf",
        mdtopdf = "pandoc %docroot% -o %outputfile%",
        mdtopdfviewerlaunch = "zathura ./%outputfile%",
        mdtohtml = "pandoc --standalone %docroot% -o %outputfile%",
        mdtohtmlviewerlaunch = "firefox --kiosk --new-window %outputfile%",
        mdtohtmlviewerrefresh = "none",
        mdtopdfviewerrefresh = "none",
      }
    end
  }
}
