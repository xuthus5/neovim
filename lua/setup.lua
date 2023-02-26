local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
        use({ "wbthomason/packer.nvim" })
        use({ "folke/tokyonight.nvim" })
        use({ "catppuccin/nvim", as = "catppuccin" })

        -- bufferline
        use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
        -- 行号模式自动切换
        use({ "nkakouros-original/numbers.nvim" })
        -- 模糊搜索
        use({
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1",
            requires = {
                { "nvim-lua/plenary.nvim" },
                { "nvim-treesitter/nvim-treesitter" },
                { "kdheepak/lazygit.nvim" },
            },
        })
        -- 文件树
        use({
            "nvim-tree/nvim-tree.lua",
            requires = {
                "nvim-tree/nvim-web-devicons", -- optional, for file icons
            },
            tag = "nightly", -- optional, updated every week. (see issue #1193)
        })
        -- 终端管理
        use({ "akinsho/toggleterm.nvim", tag = "*" })
        -- LSP管理器
        use({
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "jose-elias-alvarez/null-ls.nvim",
        })
        -- 命令行
        use({
            "VonHeikemen/fine-cmdline.nvim",
            requires = {
                { "MunifTanjim/nui.nvim" },
            },
        })
        -- 通知
        use({ "rcarriga/nvim-notify" })
        -- 缩进线
        use({ "lukas-reineke/indent-blankline.nvim" })
        -- 注释管理
        use({
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup({})
            end,
        })
        -- git管理
        use({ "lewis6991/gitsigns.nvim" })
        use({
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
        })
        -- 自动修复部分按键
        use({ "tummetott/unimpaired.nvim" })
        -- 标签补全
        use({ "windwp/nvim-autopairs" })
        use({ "windwp/nvim-ts-autotag" })
        -- 自动保存
        use({
            "Pocco81/auto-save.nvim",
        })
        -- lspsaga
        use({
            "glepnir/lspsaga.nvim",
            branch = "main",
            requires = {
                "nvim-tree/nvim-web-devicons",
                --Please make sure you install markdown and markdown_inline parser
                "nvim-treesitter/nvim-treesitter",
                "folke/lsp-colors.nvim",
            },
        })
        -- 错误列表
        use({
            "folke/trouble.nvim",
            requires = "nvim-tree/nvim-web-devicons",
        })
        -- 上下高亮跳动
        use({ "danilamihailov/beacon.nvim" })
        -- markdown lsp
        use({
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            setup = function()
                vim.g.mkdp_filetypes = { "markdown" }
            end,
            ft = { "markdown" },
        })
        -- 跳转
        use({ "ggandor/leap.nvim" })
        use({ "ggandor/flit.nvim" })
        -- 项目管理
        use({ "ahmedkhalf/project.nvim" })
        -- 优化启动速度
        use({ "lewis6991/impatient.nvim" })
        -- TODO 管理
        use({
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
        })
        -- 代码高亮
        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
        })
        -- 自动完成相关
        use({
            "hrsh7th/nvim-cmp",
            requires = {
                "onsails/lspkind-nvim",
                "octaltree/cmp-look",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-calc",
                "hrsh7th/cmp-cmdline",
                "hrsh7th/nvim-cmp",
                "hrsh7th/cmp-vsnip",
                "hrsh7th/vim-vsnip",
                "hrsh7th/cmp-emoji",
            },
        })
        -- golang ide
        use({
            "ray-x/go.nvim",
            "ray-x/guihua.lua", -- recommended if need floating window support
        })
        -- 高亮当前关键词
        use({ "RRethy/vim-illuminate" })
        -- 罗列文件中的所有url
        use("axieax/urlview.nvim")
        -- 快捷键提示
        use({
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
            end,
        })
        -- debug
        use({
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap",
            "folke/neodev.nvim",
        })
        -- 自动保存
        if packer_bootstrap then
            require("packer").sync()
        end
    end)
