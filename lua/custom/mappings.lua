local M = {}

M.format = {
    n = {
        ["="] = { "<cmd>lua vim.lsp.buf.format()<cr>", "general format" },
    },
}

M.dap = {
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line",
        },
        ["<leader>dus"] = {
            function()
                local widgets = require "dap.ui.widgets"
                local sidebar = widgets.sidebar(widgets.scopes)
                sidebar.open()
            end,
            "Open debugging sidebar",
        },
    },
}

M.dap_go = {
    n = {
        ["<leader>dgt"] = {
            function()
                require("dap-go").debug_test()
            end,
            "Debug go test",
        },
        ["<leader>dgl"] = {
            function()
                require("dap-go").debug_last()
            end,
            "Debug last go test",
        },
    },
}

M.beacon = {
    n = {
        ["n"] = { "n:Beacon<CR>", "" },
        ["N"] = { "N:Beacon<CR>", "" },
        ["*"] = { "*:Beacon<CR>", "" },
        ["#"] = { "#:Beacon<CR>", "" },
    },
}

M.trouble = {
    n = {
        ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
        ["<leader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        ["<leader>xL"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
        ["<leader>xQ"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
        ["[q"] = {
            function()
                if require("trouble").is_open() then
                    require("trouble").previous { skip_groups = true, jump = true }
                else
                    vim.cmd.cprev()
                end
            end,
            desc = "Previous trouble/quickfix item",
        },
        ["]q"] = {
            function()
                if require("trouble").is_open() then
                    require("trouble").next { skip_groups = true, jump = true }
                else
                    vim.cmd.cnext()
                end
            end,
            desc = "Next trouble/quickfix item",
        },
    },
}

M.fine_cmdline = {
    n = {
        [":"] = { "<cmd>FineCmdline<CR>", "cmd" },
    },
}

return M
