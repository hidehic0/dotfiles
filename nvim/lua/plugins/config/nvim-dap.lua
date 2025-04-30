local dap, dapui = require("dap"), require("dapui")

local python_venv_path = vim.fn.system("which python"):gsub("\n", "")
require("dap-python").setup(python_venv_path)

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

-- キーマッピング設定
-- vim.keymap.set("n", "<F5>", "<CMD>DapContinue<CR>", { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<F10>", function()
  dap.step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", function()
  dap.step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", function()
  dap.step_out()
end, { desc = "Step Out" })
-- vim.keymap.set("n", "<leader>b", "<CMD>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })

dapui.setup() -- デフォルト設定でdap-uiをセットアップ

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
