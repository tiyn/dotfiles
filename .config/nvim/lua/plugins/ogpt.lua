return {
  -- ollama llm integration
  "huynle/ogpt.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/edgy.nvim",
  },
  keys = {
    {
      "<leader>ai",
      "<cmd>OGPT<CR>",
      desc = "OGPT: Open AI View",
    },
  },
  opts = {
    default_provider = "ollama",
    edgy = true, -- enable this!
    single_window = false, -- set this to true if you want only one OGPT window to appear at a time
    providers = {
      ollama = {
        api_host = "http://localhost:11434", -- free resources: https://github.com/cheahjs/free-llm-api-resources
        api_key = "",
        model = "deepseek-r1:7b",
      },
    },
  },
}
