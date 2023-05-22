local g = require("custom.configs.table")

local jdtls_bin = g.jdtls_home .. "/bin/jdtls"
local lombok_jar = g.jdtls_home .. "/lombok.jar"

if g.is_windows then
    jdtls_bin = g.path_to_windows(jdtls_bin)
    lombok_jar = g.path_to_windows(lombok_jar)
end

if not g.is_file_exist(jdtls_bin) then
    vim.notify("jdtls plugin not exist", "error")
    return
end

if not g.is_file_exist(lombok_jar) then
    vim.notify("lombok plugin not exist", "error")
    return
end

if not g.is_directory_exist(g.jdtls_workspace) then
    os.execute("mkdir " .. g.jdtls_workspace)
end
