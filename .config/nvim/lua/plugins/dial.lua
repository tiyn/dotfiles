return {
  -- improves vims increment and decrement functions
  "monaqa/dial.nvim",
  keys = {
    {
      "<C-a>",
      function()
        require("dial.map").manipulate("increment", "normal")
      end,
      silent = true,
      desc = "Increment value",
    },
    {
      "<C-x>",
      function()
        require("dial.map").manipulate("decrement", "normal")
      end,
      silent = true,
      desc = "Decrement value",
    },
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%d.%m.%Y"],
        augend.date.alias["%d.%m.%y"],
        augend.date.alias["%H:%M"],
        augend.constant.alias.de_weekday,
        augend.constant.alias.de_weekday_full,
        augend.constant.alias.bool,
        augend.constant.alias.Bool,
        augend.semver.alias.semver,
        augend.constant.alias.en_weekday,
        augend.constant.alias.en_weekday_full,
      },
    })
  end,
}
