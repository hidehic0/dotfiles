-- lua_source {{{
local dap, dapui = require("dap"), require("dapui")

local python_venv_path = vim.fn.system("which python"):gsub("\n", "")
require("dap-python").setup(python_venv_path)

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  -- Masonはここにデバッガを入れてくれる
  command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
  {
    name = "Attach to gdbserver :1234",
    type = "cppdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "~/.nix-profile/bin/gdb",
    cwd = "${workspaceFolder}",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
  },
}

-- キーマッピング設定
vim.keymap.set("n", "<F5>", "<CMD>DapContinue<CR>", { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<F10>", function()
  dap.step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", function()
  dap.step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", function()
  dap.step_out()
end, { desc = "Step Out" })
vim.keymap.set("n", "<leader>b", "<CMD>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })

dapui.setup({
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 1,
        },
        -- {
        --   id = "stacks",
        --   size = 0.25,
        -- },
        -- {
        --   id = "watches",
        --   size = 0.25,
        -- },
      },
      position = "left",
      size = 40,
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.5,
        },
        {
          id = "console",
          size = 0.5,
        },
      },
      position = "bottom",
      size = 10,
    },
  },
}) -- デフォルト設定でdap-uiをセットアップ

-- デバッグ開始時にUIを開く
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

-- デバッグ終了時にUIを閉じる
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
-- }}}
