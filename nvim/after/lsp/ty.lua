local python_venv_path = vim.fn.system("which python"):gsub("\n", "")

return {
  settings = {
    python = {
      pythonPath = python_venv_path,
      typeCheckingMode = "off",
    },
  },
}
