-- lua/plugins/beautify.lua
return {
  {
    "folke/tokyonight.nvim",
    enabled = false, -- 禁用默认的 tokyonight
  },
  -- colorscheme-everforest
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "hard" -- hard, medium, soft
      vim.g.everforest_transparent_background = 1 -- 关键！让 Neovide 的透明生效
      vim.cmd.colorscheme("everforest")
    end,
  },
  -- lualine-everforest
  -- 这是最终的、正确的 "山间溪流" 配置
  {
    "nvim-lualine/lualine.nvim",
    -- 我们将所有的配置都放在 opts 中，让 LazyVim 来处理
    opts = function()
      -- 我们需要一个函数来动态生成配置，确保所有东西都已加载

      -- 这是我们自定义的主题
      local theme = {
        normal = { a = { fg = "#3a4145", bg = "#a7c080" } },
        insert = { a = { fg = "#3a4145", bg = "#7fbbb3" } },
        visual = { a = { fg = "#3a4145", bg = "#d699b6" } },
        command = { a = { fg = "#3a4145", bg = "#e69875" } },
        replace = { a = { fg = "#3a4145", bg = "#db4f4f" } },
        -- 关键：为所有其他部分定义透明背景
        b = { bg = "none" },
        c = { bg = "none" },
        x = { bg = "none" },
        y = { bg = "none" },
        z = { bg = "none" },
      }

      -- 遍历主题，确保所有模式下的所有部分都是透明的
      for mode, colors in pairs(theme) do
        if type(colors) == "table" then
          colors.b = { bg = "none" }
          colors.c = { bg = "none" }
          colors.x = { bg = "none" }
          colors.y = { bg = "none" }
          colors.z = { bg = "none" }
        end
      end

      return {
        options = {
          theme = theme, -- 使用我们上面完全定义好的透明主题
          component_separators = "",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            "diff",
            "diagnostics",
            "filename",
          },
          lualine_c = { "navic" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl", -- 指定插件主入口
    opts = {
      -- indent 模块控制基础的缩进线
      indent = {
        char = "│", -- 我们的 "溪流" 字符
        -- 使用我们即将定义的自定义高亮组名称
        highlight = { "IblIndentChar" },
      },
      -- scope 模块控制当前作用域的高亮
      scope = {
        enabled = true,
        -- 使用我们即将定义的自定义高亮组名称
        highlight = { "IblScopeChar" },
      },
    },
    config = function(_, opts)
      -- 使用钩子来创建我们的自定义高亮组，这是官方推荐的最佳实践
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        -- 定义 "溪流" 的颜色 (冰川融水)
        vim.api.nvim_set_hl(0, "IblIndentChar", { fg = "#7fbbb3" })
        -- 定义 "流动中溪流" (当前作用域) 的颜色 (鲜活绿植)
        vim.api.nvim_set_hl(0, "IblScopeChar", { fg = "#83c092" })
      end)

      -- 将我们上面定义的 opts 传递给 setup 函数
      require("ibl").setup(opts)
    end,
  },
  -- smooth scrolling
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        -- 设置动画曲线，'quadratic' 提供了不错的加速/减速感
        easing_function = "quadratic",
        -- 在所有可能的情况下都启用平滑滚动
        -- 这样无论是按 C-d, C-u, C-f, C-b, 'zz' 还是用鼠标滚轮，都会很流畅
        mappings = {
          "<C-u>",
          "<C-d>",
          "<C-b>",
          "<C-f>",
          "<C-y>",
          "<C-e>",
          "zt",
          "zz",
          "zb",
        },
        hide_cursor = true, -- 滚动时隐藏光标，更清爽
        stop_eof = true, -- 到达文件末尾时平滑停止
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        pre_hook = nil,
        post_hook = nil,
      })
    end,
  },
  -- telescope beautify
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
        },
        -- 为Telescope窗口添加Everforest风格的边框
        border = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
    },
  },
  -- smear cursor
  {
    "sphamba/smear-cursor.nvim",
    -- 我们可以让它在需要时再加载，以加快启动速度
    event = "VeryLazy",
    opts = {
      -- FiraCode 不支持旧版计算符号，所以我们保持 false
      legacy_computing_symbols_support = false,

      -- 关键！为透明背景设置一个“阴影”颜色
      -- 这里我选择了 Everforest 主题中的一个深灰色，让拖影在透明背景下看起来更自然
      transparent_bg_fallback_color = "#3a4145",

      -- 明确设置光标颜色，以防终端覆盖它
      -- 这个颜色来自 Everforest 的前景亮色，确保拖影清晰可见
      cursor_color = "#d3cdc3",
    },
  },
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        -- 核心修改 1：移除活动标签与非活动标签之间的分隔符
        separator_style = "",

        -- 核心修改 2：移除标签栏末尾的指示器
        indicator = {
          style = "none",
        },

        -- 让标签页更紧凑，更有现代感
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },

        -- 移除标签页背景色，让它与背景融为一体
        -- (这个函数会保留诊断信息的图标，但移除背景)
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
}
