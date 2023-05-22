local plugins = {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        opts = {
            ensure_installed = {
                "bash-language-server",
                "cmake-language-server",
                "css-lsp",
                "docker-compose-language-service",
                "dockerfile-language-server",
                "emmet-ls",
                "eslint-lsp",
                "goimports",
                "goimports-reviser",
                "golangci-lint",
                "golangci-lint-langserver",
                "golines",
                "gopls",
                "html-lsp",
                "json-lsp",
                "lua-language-server",
                "rust-analyzer",
                "rustfmt",
                "stylua",
                "taplo",
                "typescript-language-server",
                "vue-language-server",
                "yaml-language-server",
                "yamlfmt",
                "yamllint",
                "jdtls",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
                require "custom.configs.null-ls"
            end,
        },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "mfussenegger/nvim-jdtls",
        ft = { "java" },
        config = function()
            require "custom.configs.java"
            -- require "custom.configs.jdtls"
        end,
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },
    {
        "mfussenegger/nvim-dap",
        init = function()
            require("core.utils").load_mappings "dap"
        end,
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function(_, opts)
            require("dap-go").setup(opts)
        end,
    },
    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<leader>un",
                function()
                    require("notify").dismiss { silent = true, pending = true }
                end,
                desc = "Dismiss all Notifications",
            },
        },
        opts = {
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
        },
        init = function()
            -- when noice is not enabled, install notify on VeryLazy
            vim.notify = require "notify"
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = function()
            return require("custom.configs.others").indent_blackline
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function()
            return require "custom.configs.treesitter"
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = true,
        opts = require("custom.configs.others").nvimtree,
    },
    {
        "danilamihailov/beacon.nvim",
        cmd = { "Beacon" },
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
    },
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        opts = { delay = 200 },
        config = function(_, opts)
            require("illuminate").configure(opts)

            local function map(key, dir, buffer)
                vim.keymap.set("n", key, function()
                    require("illuminate")["goto_" .. dir .. "_reference"](false)
                end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
            end

            map("]]", "next")
            map("[[", "prev")

            -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local buffer = vim.api.nvim_get_current_buf()
                    map("]]", "next", buffer)
                    map("[[", "prev", buffer)
                end,
            })
        end,
        keys = {
            { "]]", desc = "Next Reference" },
            { "[[", desc = "Prev Reference" },
        },
    },
    {
        "ggandor/flit.nvim",
        keys = function()
            ---@type LazyKeys[]
            local ret = {}
            for _, key in ipairs { "f", "F", "t", "T" } do
                ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
            end
            return ret
        end,
        opts = { labeled_modes = "nx" },
        event = { "CmdlineEnter" },
    },
    {
        "ggandor/leap.nvim",
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
            { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
        },
        event = { "CmdlineEnter" },
        config = function(_, opts)
            local leap = require "leap"
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)
            vim.keymap.del({ "x", "o" }, "x")
            vim.keymap.del({ "x", "o" }, "X")
        end,
    },
    {
        "Pocco81/auto-save.nvim",
        lazy = false,
        opts = {
            trigger_events = { "InsertLeave", "BufLeave", "BufWinLeave" },
        },
    },
    {
        "VonHeikemen/fine-cmdline.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        cmd = { "FineCmdline" },
    },
    {
        "j-hui/fidget.nvim",
        config = true,
        event = { "BufWinEnter" },
    },
}

return plugins
