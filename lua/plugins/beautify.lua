---- lua/plugins/beautify.lua (现代化版本)
return {
  -- 禁用默认主题
  { "folke/tokyonight.nvim", enabled = false },

  -- 您的核心主题，保持不变
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_transparent_background = 1
      vim.cmd.colorscheme("everforest")
    end,
  },

  -- 您的自定义标签栏，保持不变
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        separator_style = "",
        indicator = { style = "none" },
        offsets = { { filetype = "neo-tree", text = "File Explorer", text_align = "left", separator = true } },
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          if context.buffer:current() then
            return ""
          end
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " " or (e == "warning" and " " or " ")
            s = s .. n .. sym
          end
          return s
        end,
      },
    },
  },
  -- 您的光标特效，保持不变
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      legacy_computing_symbols_support = false,
      transparent_bg_fallback_color = "#3a4145",
      cursor_color = "#d3cdc3",
    },
  },
}
