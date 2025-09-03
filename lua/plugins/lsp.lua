-- lua/plugins/lsp.lua
-- The LazyVim Way: 只声明我们需要的插件，让 LazyVim 处理集成
return {
  -- LSP Server 管理 + 自动安装
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- 核心 LSP 引擎
  "neovim/nvim-lspconfig",

  -- 代码补全引擎 (LazyVim 默认使用 nvim-cmp)
  "hrsh7th/nvim-cmp",

  -- 面包屑导航
  "SmiteshP/nvim-navic",
}
