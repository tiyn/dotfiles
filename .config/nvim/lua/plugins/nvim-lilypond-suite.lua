return {
  -- lillypond integration
  "martineausimon/nvim-lilypond-suite",
  ft = "lilypond",
  dependencies = "uga-rosa/cmp-dictionary",
  opts = {
    lilypond = {
      mappings = {
        player = "<NOP>",
        compile = "<NOP>",
        open_pdf = "<NOP>",
        switch_buffers = "<NOP>",
        insert_version = "<NOP>",
        hyphenation = "<NOP>",
        hyphenation_change_lang = "<NOP>",
        insert_hyphen = "<NOP>",
        add_hyphen = "<NOP>",
        del_next_hyphen = "<NOP>",
        del_prev_hyphen = "<NOP>",
      },
    },
    player = {
      options = {
        fluidsynth_flags = {
          "/usr/share/soundfonts/FluidR3_GM.sf2",
        },
      },
    },
  },
  config = function(_, opts)
    local nvls = require("nvls")
    nvls.setup(opts)
    local lily_dicts = {
      "~/.local/share/nvim/lazy/nvim-lilypond-suite/lilywords/keywords",
      "~/.local/share/nvim/lazy/nvim-lilypond-suite/lilywords/musicCommands",
      "~/.local/share/nvim/lazy/nvim-lilypond-suite/lilywords/musicFunctions",
      "~/.local/share/nvim/lazy/nvim-lilypond-suite/lilywords/articulations",
      "~/.local/share/nvim/lazy/nvim-lilypond-suite/lilywords/dynamics",
    }
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "lilypond",
      callback = function(args)
        local bufnr = args.buf
        require("cmp_dictionary").setup({
          paths = lily_dicts,
        })
        local fluidsynth_job = nil
        vim.keymap.set("n", "<leader>pm", function()
          local midi = vim.fn.expand("%:r") .. ".midi"
          if fluidsynth_job then
            vim.fn.jobstop(fluidsynth_job)
            fluidsynth_job = nil
            print("fluidsynth stopped")
            return
          end
          fluidsynth_job = vim.fn.jobstart({ "fluidsynth", "-i", midi })
          print("fluidsynth playing (Ctrl-C to stop)")
        end, {
          buffer = bufnr,
          desc = "Lilypond: output MIDI",
        })
        vim.keymap.set("n", "<leader>pp", "<cmd>Viewer<CR>", {
          buffer = bufnr,
          desc = "Lilypond: open PDF",
        })
        vim.keymap.set("n", "<C-c>", function()
          if fluidsynth_job then
            vim.fn.jobstop(fluidsynth_job)
            fluidsynth_job = nil
            print("fluidsynth stopped")
          else
            vim.cmd("normal! <C-c>")
          end
        end, {
          buffer = bufnr,
          desc = "Stop MIDI playback",
        })
        if vim.b[bufnr].first_start_lilypond then
          return
        end
        vim.b[bufnr].first_start_lilypond = true
        vim.schedule(function()
          if vim.fn.exists(":Viewer") == 2 then
            vim.cmd.Viewer()
          end
        end)
      end,
    })
  end,
}
