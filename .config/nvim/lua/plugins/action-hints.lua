return {
  -- display available options for highlighted word
  "tiyn/action-hints.nvim",
  lazy = true, -- load as dependency
  config = function()
    require("action-hints").setup({
      template = {
        -- definition = { text = "D", color = "#add8e6" },
        -- references = { text = "R%s", color = "#ff6666" },
        definition = { text = Definition_sign, color = "#add8e6" },
        references = { text = Reference_sign, color = "#ff6666" },
      },
    })
  end,
}
