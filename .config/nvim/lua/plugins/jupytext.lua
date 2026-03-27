return {
  -- open jupyter notebooks as their plain text alternatives
  "GCBallesteros/jupytext.nvim",
  lazy = true, -- load as dependency
  opts = {
    style = "markdown",
    output_extension = "md",
    force_ft = "markdown",
  },
}
