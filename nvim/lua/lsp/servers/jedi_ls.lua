return {
  cmd = { "jedi-language-server" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
  },
  init_options = {
    diagnostics = {
      enable = false, -- 診断（Lint）を無効化
    },
    workspace = {
      environmentPath = vim.fn.exepath("python3") or vim.fn.exepath("python"),
    },
  },
}
