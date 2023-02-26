-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
common_lsp_on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
end

common_lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}
