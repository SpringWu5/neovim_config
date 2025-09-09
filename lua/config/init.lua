-- lua/config/init.lua
-- 自定义诊断符号
local signs = { Error = "🔥", Warn = "💧", Hint = "🍃", Info = "💡" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
