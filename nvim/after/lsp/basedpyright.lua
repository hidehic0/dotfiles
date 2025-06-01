local python_venv_path = vim.fn.system("which python"):gsub("\n", "")

return {
  settings = {
    python = {
      pythonPath = python_venv_path,
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
}
