local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.eslint_d,
        -- 诊断
        null_ls.builtins.diagnostics.eslint_d,
    }
})
