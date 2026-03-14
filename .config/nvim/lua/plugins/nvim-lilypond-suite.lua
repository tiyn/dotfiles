return {
  -- lillypond integration
  "martineausimon/nvim-lilypond-suite",
  dependencies = "uga-rosa/cmp-dictionary",
  config = function()
    require("nvls").setup({
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
    })

    local lily_dicts = {
      "~/.local/share/nvim/lazy/nvim-lilypond-suite/lilywords/keywords",
      "~/.local/share/nvim/lazy/nvim-lilypond-suite/lilywords/musicCommands",
      "~/.local/share/nvim/lazy/nvim-lilypond-suite/lilywords/musicFunctions",
      "~/.local/share/nvim/lazy/nvim-lilypond-suite/lilywords/articulations",
      "~/.local/share/nvim/lazy/nvim-lilypond-suite/lilywords/dynamics",
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "lilypond",
      callback = function()
        require("cmp_dictionary").setup({
          paths = lily_dicts,
        })
      end,
    })
  end,
}
