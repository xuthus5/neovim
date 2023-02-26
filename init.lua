require("impatient") -- start quickly
require("setup")
require("core.option")

-- 加载插件配置文件
-- 文件树
require("plugins.file-tree")
-- 行号模式切换
require("plugins.line-numbers")
-- 模糊搜索
require("plugins.telescope")
-- mason管理
require("plugins.mason")
-- 终端管理
require("plugins.terminal")
-- bufferline
require("plugins.bufferline")
-- 空白缩进
require("plugins.indent_blackline")
-- 底部状态
require("plugins.lualine")
-- 自动保存
require("plugins.auto-save")
-- 通知
require("plugins.notify")
-- 格式化
require("plugins.null-ls")
-- 错误列表
require("plugins.trouble")
-- git
require("plugins.gitsigns")
-- 快速跳转
require("plugins.leap")
-- 代码高亮配置
require("plugins.treesitter")
-- lspsaga
require("plugins.lspsaga")
-- golang lsp
require("plugins.golang")
require("lsp.init")
require("lsp.bash")
require("lsp.docker")
require("lsp.frontend")
require("lsp.go")
require("lsp.lua")
require("lsp.protocol")
require("lsp.volar")

-- 载入主题
require("core.theme")
-- 载入按键
require("core.keymapping")
