local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.golines.with {
        extra_args = {
            "--max-len=180",
            "--base-formatter=gofumpt",
        },
    },
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.formatting.protolint,
    -- 诊断
    null_ls.builtins.diagnostics.protolint,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
}

null_ls.setup {
    debounce = 1000,
    default_timeout = 5000,
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("InsertLeave", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format { bufnr = bufnr }
                end,
            })
        end
    end,
}
