return {
  -- agentic coding
  "carlos-algms/agentic.nvim",
  --- @type agentic.PartialUserConfig
  opts = {
    provider = "gemini-acp",
    diagnostic_icons = {
      error = Error_sign,
      warn = Warn_sign,
      info = Info_sign,
      hint = Hint_sign,
    },
    status_icons = {
      pending = "󰄉",
      in_progress = "󱥸",
      completed = "󰗠",
      failed = "󰅙",
    },
    permission_icons = {
      allow_once = "󰄬",
      allow_always = "󰄭",
      reject_once = "󰅖",
      reject_always = "",
    },
    chat_icons = {
      user = "󰀄",
      agent = "󰚩",
    },
    message_icons = {
      thinking = "󰧑",
      finished = "",
      stopped = "",
      error = "󰀦",
    },
  },
  keys = {
    {
      "<leader>aa",
      function()
        require("agentic").toggle()
      end,
      mode = { "n", "v" },
      desc = "Agentic: Toggle chat",
    },
    {
      "<leader>af",
      function()
        require("agentic").add_selection_or_file_to_context()
      end,
      mode = { "n", "v" },
      desc = "Agentic: Add file or selection to context",
    },
    {
      "<leader>as",
      function()
        require("agentic").new_session()
      end,
      mode = { "n", "v" },
      desc = "Agentic: Create new session",
    },
    {
      "<leader>ar",
      function()
        require("agentic").restore_session()
      end,
      mode = { "n", "v" },
      desc = "Agentic: Restore session",
    },
    {
      "<leader>ad",
      function()
        require("agentic").add_current_line_diagnostics()
      end,
      desc = "Agentic: Add current line diagnostic",
    },
    {
      "<leader>aD",
      function()
        require("agentic").add_buffer_diagnostics()
      end,
      desc = "Agentic: Add current buffer diagnostic",
    },
  },
}
