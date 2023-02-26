require("dapui").setup()
require("nvim-dap-virtual-text").setup()
-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
    library = { plugins = { "nvim-dap-ui" }, types = true },
})
