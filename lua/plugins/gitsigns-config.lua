-- lua/plugins/gitsigns-config.lua
return {
  "lewis6991/gitsigns.nvim",
  opts = {
    -- 禁用对未跟踪文件的标记，保持简洁
    attach_to_untracked = false,
    -- 关键：为标志添加淡入淡出动画
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "▸" },
      topdelete = { text = "▸" },
      changedelete = { text = "▎" },
    },
    signcolumn = true, -- 确保标志总是显示
    numhl = true, -- 同时高亮行号
    linehl = false, -- 但不高亮整行，避免与 cursorline 冲突
    word_diff = false, -- 禁用单词级差异，保持简洁
    -- ... gitsigns 的其他默认设置 ...
  },
}
