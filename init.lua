require("impatient") -- start quickly
require("setup")
require("core.option")

-- 加载插件配置文件
-- 文件树
require("plugins.file-tree")
-- 默认配置
require("plugins.peaceful")
-- debug 配置
require("plugins.debug")
-- mason管理
require("plugins.mason")
-- bufferline
require("plugins.bufferline")
-- 空白缩进
require("plugins.indent_blackline")
-- 底部状态
require("plugins.lualine")
-- 自动保存
require("plugins.auto-do")
-- 通知
require("plugins.notify")
-- 格式化
require("plugins.null-ls")
-- git
require("plugins.gitsigns")
-- 快速跳转
require("plugins.leap")
-- 代码高亮配置
require("plugins.treesitter")
-- lsp 配置
require("lsp.init")
require("lsp.bash")
require("lsp.docker")
require("lsp.frontend")
require("lsp.go")
require("lsp.lua")
require("lsp.protocol")
require("lsp.volar")
-- lspsaga
require("plugins.lspsaga")
-- golang lsp
require("plugins.golang")

-- 载入主题
require("core.theme")
-- 载入按键
require("core.keymapping")
