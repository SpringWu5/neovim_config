-- lua/plugins/navic.lua
return {
  -- 这是 nvim-navic 插件本身
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      LazyVim.lsp.on_attach(function(client, buffer)
        if client.supports_method("textDocument/documentSymbol") then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = {
      separator = " » ", -- 我们可以自定义分隔符
      highlight = true,
      depth_limit = 5,
      icons = {
        File = "",
        Module = "",
        Package = "",
        Namespace = "󱢗",
        Class = "",
        Struct = "",
        Enum = "",
        Function = "",
        Method = "",
        Constructor = "",
        Variable = "󰌪",
        Property = "󱁄",
        Field = "󱁄",
        Constant = "󰇈",
        Number = "",
        Boolean = "",
        Array = "󰔬",
        Object = "󰔬",
        Key = "󰌆",
        Event = "󰉁",
        Operator = "󱗺",
        TypepParameter = "󰲴",
      },
    },
  },

  -- 这是 lualine 与 navic 的集成
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, {
        "navic",
        color_correction = "dynamic",
        -- 我们可以选择不显示图标，让它更简洁
        -- navic_opts = { icons = {} },
      })
    end,
  },
}
