local dap, dapui = require("dap"), require("dapui")
require("dap-python").setup("/home/hidehico/.local/share/mise/installs/python/pypy3.10-7.3.17/bin/python")

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
vim.keymap.set("n", "<leader>b", function()
  dap.toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

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
