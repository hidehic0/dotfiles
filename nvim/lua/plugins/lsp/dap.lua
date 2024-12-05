return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      local dap = require("dap")

      -- キーマッピング設定
      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { desc = "Start/Continue Debugging" })
      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end, { desc = "Step Over" })
      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { desc = "Step Into" })
      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end, { desc = "Step Out" })
      vim.keymap.set("n", "<Leader>b", function()
        dap.toggle_breakpoint()
      end, { desc = "Toggle Breakpoint" })
    end,
    dependencies = {
      { "nvim-neotest/nvim-nio" },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-nio" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

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

      -- UIのトグル用キーマッピング
      vim.keymap.set("n", "<Leader>tu", function()
        dapui.toggle()
      end, { desc = "Toggle DAP UI" })
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
      require("dap-python").setup("pypy3") -- debugpyのパスを指定
    end,
  },
}
