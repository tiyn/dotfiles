return {
  -- improved csv handling
  "hat0uma/csvview.nvim",
  ft = "csv",
  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  opts = {
    parser = { comments = { "#", "//" } },
    keymaps = {
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },
      jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
      jump_next_row = { "<Enter>", mode = { "n", "v" } },
      jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
  },
  config = function(_, opts)
    local csvview = require("csvview")
    csvview.setup(opts)
    csvview.enable()
  end,
}
