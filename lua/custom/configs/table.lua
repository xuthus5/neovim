local g = {}

g.platform_windows = function()
    local delimeter = package.config:sub(1, 1)
    if delimeter == "/" then
        return false
    end
    return true
end

g.get_homepage = function()
    if g.platform_windows() then
        return os.getenv "USERPROFILE"
    end
    return os.getenv "HOME"
end

g.is_file_exist = function(filename)
    local f = io.open(filename)
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

g.path_to_windows = function(path)
    return (string.gsub(path, "/", "\\"))
end

g.is_directory_exist = function(dirname)
    return os.rename(dirname, dirname) and true or false
end

local jdtls_home = g.get_homepage() .. "/.local/share/nvim/mason/packages/jdtls"
local workspace = g.get_homepage() .. "/.jdtls"

if g.is_windows then
    jdtls_home = g.get_homepage() .. "\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls"
    workspace = g.get_homepage() .. "\\.jdtls"
end

g.is_windows = g.platform_windows()
g.is_linux = not g.is_windows
g.jdtls_home = jdtls_home
g.jdtls_workspace = workspace

return g
