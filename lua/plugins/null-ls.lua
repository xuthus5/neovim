local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.buf,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.dart_format,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.fixjson,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.markdown_toc,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.taplo,
        null_ls.builtins.formatting.xmllint,
        null_ls.builtins.formatting.yamlfmt,
        -- 诊断
        null_ls.builtins.diagnostics.buf,
        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.checkstyle,
        null_ls.builtins.diagnostics.clang_check,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.yamllint,
        -- 动作
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.gitrebase,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.code_actions.xo,
        -- 完成
        null_ls.builtins.completion.luasnip,
	},
})
