local M = {}
M.indent_blackline = {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    space_char_blankline = " ",
}
M.nvimtree = {
    filters = {
        dotfiles = true,
        exclude = { ".golangci*", ".protolint*", ".gitignore", ".eslintrc*" },
    },
}
return M
