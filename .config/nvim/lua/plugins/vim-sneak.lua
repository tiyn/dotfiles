return {
  -- improved movement
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").create_default_mappings()
      require("leap").opts.highlight_unlabeled_phase_one_targets = true
      require("leap").opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }
      require("leap").opts.special_keys.prev_target = "<backspace>"
      require("leap").opts.special_keys.prev_group = "<backspace>"
      require("leap.user").set_repeat_keys("<enter>", "<backspace>")
      require("leap").opts.safe_labels = "sfnut/SFNLHMUGTZ?"
      require("leap").opts.labels = "sfnjklhodweimbuyvrgtaqpcxz/SFNJKLHODWEIMBUYVRGTAQPCXZ?"
    end,
  },
}
