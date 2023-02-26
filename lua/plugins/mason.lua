require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"gopls",
		"golangci_lint_ls",
		"tsserver",
		"volar",
		"taplo",
		"lemminx",
		"yamlls",
		"sqlls",
		"jsonls",
		"jdtls",
		"bashls",
		"cssls",
		"dockerls",
		"docker_compose_language_service",
		"eslint",
		"html",
	},
	automatic_installation = true,
})
