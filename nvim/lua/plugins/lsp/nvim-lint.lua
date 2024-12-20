return {
  {
    "mfussenegger/nvim-lint",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require("lint").linters_by_ft = {
        python = { "ruff" },
        lua = { "luac" },
        cpp = { "clangd" },
        zsh = { "zsh" }
      }
    end
  }
}
