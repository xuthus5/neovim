require("bufferline").setup({
	options = {
        -- 使用 nvim 内置lsp
		diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict)
			return "("..count..")"
		end,
		always_show_bufferline = false,
		-- 左侧让出 nvim-tree 的位置
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})
