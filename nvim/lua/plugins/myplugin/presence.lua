-- ~/.config/nvim/lua/discord_status/init.lua
local M = {}

-- ジョブIDを保存する変数
local job_id = nil

-- Pythonスクリプトを起動
function M.start_discord_presence()
  local script_path = vim.fn.stdpath("config") .. "/neovim_discord_presence.py"
  job_id = vim.fn.jobstart({ "python3", script_path }, {
    detach = true,
    on_stderr = function(_, data)
      if data then
        print("Discord Presence Error: " .. table.concat(data, "\n"))
      end
    end,
  })
  if job_id > 0 then
    print("Started Discord Presence for Neovim (Job ID: " .. job_id .. ")")
  else
    print("Failed to start Discord Presence")
  end
end

-- プロセスを停止
function M.stop_discord_presence()
  if job_id and job_id > 0 then
    vim.fn.jobstop(job_id)
    print("Stopped Discord Presence (Job ID: " .. job_id .. ")")
    job_id = nil
  end
end

-- Neovim起動時に開始
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    M.start_discord_presence()
  end,
})

-- Neovim終了時に停止
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    M.stop_discord_presence()
  end,
})

return M
