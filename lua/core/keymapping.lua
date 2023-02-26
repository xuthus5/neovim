vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap
local noreopt = { noremap = true, silent = true }

-- save
map.set({ "n", "i" }, "<C-s>", "<cmd>w<cr>", noreopt)
-- format
map.set({ "n", "v", "x" }, "=", "<cmd>lua vim.lsp.buf.format()<cr>", noreopt)
-- fine cmdline
map.set("n", ":", "<cmd>FineCmdline<CR>", noreopt)
-- telescope
map.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
map.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
map.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
map.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
map.set("n", "<leader>lds", "<cmd>Telescope lsp_document_symbols<cr>") -- list all functions/structs/classes/modules in the current buffer
-- 重置窗口大小
map.set("n", "<C-Up>", ":resize -2<CR>", noreopt)
map.set("n", "<C-Down>", ":resize +2<CR>", noreopt)
map.set("n", "<C-Left>", ":vertical resize -2<CR>", noreopt)
map.set("n", "<C-Right>", ":vertical resize +2<CR>", noreopt)
-- 窗口切换
map.set("n", "<C-h>", "<C-w>h", noreopt)
map.set("n", "<C-j>", "<C-w>j", noreopt)
map.set("n", "<C-k>", "<C-w>k", noreopt)
map.set("n", "<C-l>", "<C-w>l", noreopt)
-- 分屏
map.set("n", "<leader>sv", ":vsp<CR>", noreopt)
map.set("n", "<leader>sh", ":sp<CR>", noreopt)
-- 代码块移动
map.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi", noreopt)
map.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi", noreopt)
map.set("v", "<", "<gv", noreopt)
map.set("v", ">", ">gv", noreopt)
map.set("v", "<A-j>", ":m .+1<CR>==", noreopt)
map.set("v", "<A-k>", ":m .-2<CR>==", noreopt)
map.set("x", "J", ":move '>+1<CR>gv-gv", noreopt)
map.set("x", "K", ":move '<-2<CR>gv-gv", noreopt)
map.set("x", "<A-j>", ":move '>+1<CR>gv-gv", noreopt)
map.set("x", "<A-k>", ":move '<-2<CR>gv-gv", noreopt)
-- 快所退出
map.set("n", "q", ":wq<CR>", noreopt)
map.set("n", "qn", ":q!<CR>", noreopt)
map.set("n", "qq", ":qa!<CR>", noreopt)
map.set("i", "jk", "<ESC>", noreopt)
-- 文件页切换
map.set("n", "<leader>bl", ":BufferLineCyclePrev<CR>", noreopt)
map.set("n", "<leader>br", ":BufferLineCycleNext<CR>", noreopt)
map.set("n", "<leader>bpi", ":BufferLineTogglePin<CR>", noreopt)
map.set("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", noreopt)
map.set("n", "<leader>bcr", ":BufferLineCloseRight<CR>", noreopt)
map.set("n", "<leader>bp", ":BufferLinePick<CR>", noreopt)
-- 开关文件树
map.set("n", "<leader>t", ":NvimTreeToggle<CR>", noreopt)
-- git lazy
map.set("n", "<leader>lg", ":LazyGit<CR>", noreopt)
-- 错误列表UI
map.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", noreopt)
map.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", noreopt)
map.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", noreopt)
map.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", noreopt)
map.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", noreopt)
map.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", noreopt)
-- 高亮跳转
map.set("n", "n", "n:Beacon<CR>", noreopt)
map.set("n", "N", "N:Beacon<CR>", noreopt)
map.set("n", "*", "*:Beacon<CR>", noreopt)
map.set("n", "#", "#:Beacon<CR>", noreopt)
-- markdown
map.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", noreopt)
-- lspsage
function _G.set_lspsage_keymaps()
	local keymap = vim.keymap.set
	keymap("n", "cf", "<cmd>Lspsaga lsp_finder<CR>")

	-- Code action
	keymap({ "n", "v" }, "ca", "<cmd>Lspsaga code_action<CR>")

	-- Rename all occurrences of the hovered word for the entire file
	keymap("n", "rn", "<cmd>Lspsaga rename<CR>")

	-- Rename all occurrences of the hovered word for the selected files
	keymap("n", "<leader>rn", "<cmd>Lspsaga rename ++project<CR>")

	-- Peek definition
	-- You can edit the file containing the definition in the floating window
	-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
	-- It also supports tagstack
	-- Use <C-t> to jump back
	keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")

	-- Peek type definition
	-- You can edit the file containing the type definition in the floating window
	-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
	-- It also supports tagstack
	-- Use <C-t> to jump back
	keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

	-- Show line diagnostics
	-- You can pass argument ++unfocus to
	-- unfocus the show_line_diagnostics floating window
	keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

	-- Show cursor diagnostics
	-- Like show_line_diagnostics, it supports passing the ++unfocus argument
	keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

	-- Show buffer diagnostics
	keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

	-- Diagnostic jump
	-- You can use <C-o> to jump back to your previous location
	keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
	keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

	-- Diagnostic jump with filters such as only jumping to an error
	keymap("n", "[E", function()
		require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end)
	keymap("n", "]E", function()
		require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
	end)

	-- Toggle outline
	keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

	-- Hover Doc
	-- If there is no hover doc,
	-- there will be a notification stating that
	-- there is no information available.
	-- To disable it just use ":Lspsaga hover_doc ++quiet"
	-- Pressing the key twice will enter the hover window
	keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

	-- If you want to keep the hover window in the top right hand corner,
	-- you can pass the ++keep argument
	-- Note that if you use hover with ++keep, pressing this key again will
	-- close the hover window. If you want to jump to the hover window
	-- you should use the wincmd command "<C-w>w"
	keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

	-- Call hierarchy
	keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
	keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

	-- Floating terminal
	keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
end

vim.cmd("lua set_lspsage_keymaps()")
