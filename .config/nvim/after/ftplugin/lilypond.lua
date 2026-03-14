local wk = require("which-key")

local fluidsynth_job = nil

-- setup interactive midi player
wk.add({
  { mode = "n", "<leader>p", desc = "Lilypond: output" },
  {
    mode = "n",
    "<leader>pm",
    function()
      local midi = vim.fn.expand("%:r") .. ".midi"

      if fluidsynth_job then
        vim.fn.jobstop(fluidsynth_job)
        fluidsynth_job = nil
        print("fluidsynth stopped")
        return
      end

      fluidsynth_job = vim.fn.jobstart({ "fluidsynth", "-i", midi })
      print("fluidsynth playing (Ctrl-C to stop)")
    end,
    desc = "Lilypond: output MIDI",
    buffer = true,
  },
  {
    mode = "n",
    "<leader>pp",
    "<cmd>Viewer<CR>",
    desc = "Lilypond: open PDF",
    buffer = true,
  },
  {
    mode = "n",
    "<C-c>",
    function()
      if fluidsynth_job then
        vim.fn.jobstop(fluidsynth_job)
        fluidsynth_job = nil
        print("fluidsynth stopped")
      else
        vim.cmd("normal! <C-c>")
      end
    end,
    desc = "Stop MIDI playback",
    buffer = true,
  },
})

-- autostart
if vim.b.first_start_lilypond then
  return
end
vim.b.first_start_lilypond = true

vim.cmd.Viewer()
