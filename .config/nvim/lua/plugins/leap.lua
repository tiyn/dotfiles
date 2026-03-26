return {
  -- improved movement
  "ggandor/leap.nvim",
  keys = {
    {
      "f",
      "<Plug>(leap-forward)",
      mode = "n",
      desc = "Navigation: enter leap mode for forward movement",
    },
    {
      "F",
      "<Plug>(leap-backward)",
      mode = "n",
      desc = "Navigation: enter leap mode for backwards movement",
    },
    {
      "gf",
      "<Plug>(leap-from-window)",
      mode = "n",
      desc = "Navigation: enter leap mode for other windows",
    },
  },
  config = function()
    require("leap").opts.highlight_unlabeled_phase_one_targets = true
    require("leap").opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }
    require("leap").opts.special_keys.prev_target = "<backspace>"
    require("leap").opts.special_keys.prev_group = "<backspace>"
    require("leap.user").set_repeat_keys("<enter>", "<backspace>")
    require("leap").opts.safe_labels = "sfnut/SFNLHMUGTZ?"
    require("leap").opts.labels = "sfnjklhodweimbuyvrgtaqpcxz/SFNJKLHODWEIMBUYVRGTAQPCXZ?"
  end,
}
