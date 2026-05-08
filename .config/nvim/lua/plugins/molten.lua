return {
  -- jupyter notebook support
  "benlubas/molten-nvim",
  build = ":UpdateRemotePlugins",
  version = "^1.0.0",
  dependencies = {
    "3rd/image.nvim",
    "quarto-dev/quarto-nvim",
    "GCBallesteros/jupytext.nvim",
  },
  lazy = false,
  init = function()
    vim.g.molten_auto_open_output = false
    vim.g.molten_wrap_output = true
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_max_height = 20
  end,
  config = function()
    local imb = function(e)
      vim.schedule(function()
        local kernels = vim.fn.MoltenAvailableKernels()
        local try_kernel_name = function()
          local f = io.open(e.file, "r")
          if not f then
            return nil
          end
          local content = f:read("*a")
          f:close()
          local ok, decoded = pcall(vim.json.decode, content)
          if not ok then
            return nil
          end
          return decoded.metadata
            and decoded.metadata.kernelspec
            and decoded.metadata.kernelspec.name
        end
        local ok, kernel_name = pcall(try_kernel_name)
        if not ok or not vim.tbl_contains(kernels, kernel_name) then
          kernel_name = nil
          local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or ".venv"
          if venv ~= nil then
            kernel_name = string.match(venv, "/.+/(.+)")
          end
        end
        if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
          vim.cmd(("MoltenInit %s"):format(kernel_name))
        end
        vim.cmd("MoltenImportOutput")
      end)
    end

    vim.api.nvim_create_autocmd("BufAdd", {
      pattern = { "*.ipynb" },
      callback = imb,
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = { "*.ipynb" },
      callback = function(e)
        if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then
          imb(e)
        end
      end,
    })

    local default_notebook = [[
  {
    "cells": [
     {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        ""
      ]
     }
    ],
    "metadata": {
     "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
     },
     "language_info": {
      "codemirror_mode": {
        "name": "ipython"
      },
      "file_extension": ".py",
      "mimetype": "text/x-python",
      "name": "python",
      "nbconvert_exporter": "python",
      "pygments_lexer": "ipython3"
     }
    },
    "nbformat": 4,
    "nbformat_minor": 5
  }
]]

    local function new_notebook(filename)
      local path = filename .. ".ipynb"
      local file = io.open(path, "w")
      if file then
        file:write(default_notebook)
        file:close()
        vim.cmd("edit " .. path)
      else
        print("Error: Could not open new notebook file for writing.")
      end
    end

    vim.api.nvim_create_user_command("NewNotebook", function(opts)
      new_notebook(opts.args)
    end, {
      nargs = 1,
      complete = "file",
    })
  end,
}
