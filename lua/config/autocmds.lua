-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- lua/config/autocmds.lua
-- 这个文件专门存放我们的自动命令

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- 修正光标行，实现 "冰川裂隙" 效果
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { underline = true, fg = "#d3cdc3" })
    vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
    -- 2. 小溪飞瀑 (在这里新增一行即可)
    vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#81a1c1" })
    -- 3. 森林轻语 (最终的、统一的实现)
    -- 我们将所有可能产生背景的元素，都在这个唯一有效的地方进行覆盖
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "none" })
    vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "none", fg = "none" })
  end,
})
