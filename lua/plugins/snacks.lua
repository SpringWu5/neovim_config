-- File: ~/.config/nvim/lua/plugins/snacks.lua

-- 精心挑选的、符合“阿尔卑斯”风格的引言
-- 你可以随意替换或增加更多你喜欢的引言
local quotes = {
  "In every walk with nature, one receives far more than he seeks.", -- John Muir
  "The mountains are calling and I must go.", -- John Muir
  "Still waters run deep.",
  "Simplicity is the ultimate sophistication.", -- Leonardo da Vinci
  "An investment in knowledge pays the best interest.", -- Benjamin Franklin
}

-- 每次启动时随机选择一句
local quote_of_the_day = quotes[math.random(#quotes)]

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        -- *** 这是成功的关键：我们不再使用 logo，而是使用 header ***
        logo = nil, -- 明确禁用图形 Logo
        header = {
          -- 将我们随机选择的引言作为标题
          quote_of_the_day,
          "", -- 添加一个空行来增加间距
        },
        -- 让引言使用一种柔和、不刺眼的颜色
        header_hl = "Comment",
        -- 保持精简的按钮列表
        buttons = {
          { icon = "", text = "Find File", key = "f", action = "FzfLua files" },
          { icon = "", text = "Recent Files", key = "r", action = "FzfLua oldfiles" },
          { icon = "", text = "Projects", key = "p", action = "Telescope projects" },
          { icon = "", text = "Config", key = "c", action = "e $MYVIMRC" },
          { icon = "", text = "Quit", key = "q", action = "qa" },
        },
        -- 页脚可以显示 Neovim 版本信息，或留空
        footer = { "Neovim " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch },
        footer_hl = "String",
      },
    },
  },
}
