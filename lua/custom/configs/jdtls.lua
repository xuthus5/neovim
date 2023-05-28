local g = require "custom.configs.table"

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
    return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace = g.jdtls_workspace .. "/" .. project_name
local launcher = g.jdtls_home .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local configuration = g.jdtls_home .. "/config_linux"
local lombok_bin = g.jdtls_home .. "/lombok.jar"

if g.is_windows then
    workspace = g.path_to_windows(workspace)
    launcher = g.path_to_windows(launcher)
    configuration = g.path_to_windows(g.jdtls_home) .. "\\config_win"
    lombok_bin = g.path_to_windows(lombok_bin)
end

local jdtls = require "jdtls"
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)

return {
    flags = {
        debounce_text_changes = 80,
    },
    capabilities = capabilities,
    on_attach = function(_, bufnr)
        jdtls.setup_dap { hotcodereplace = "auto" }
        -- https://github.com/mfussenegger/dotfiles/blob/833d634251ebf3bf7e9899ed06ac710735d392da/vim/.config/nvim/ftplugin/java.lua#L88-L94
        local opts = { silent = true, buffer = bufnr }
        vim.keymap.set("n", "<leader>lo", jdtls.organize_imports, { desc = "Organize imports", buffer = bufnr })
        -- Should 'd' be reserved for debug?
        vim.keymap.set("n", "<leader>df", jdtls.test_class, opts)
        vim.keymap.set("n", "<leader>dn", jdtls.test_nearest_method, opts)
        vim.keymap.set("n", "<leader>rv", jdtls.extract_variable_all, { desc = "Extract variable", buffer = bufnr })
        vim.keymap.set(
            "v",
            "<leader>rm",
            [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
            { desc = "Extract method", buffer = bufnr }
        )
        vim.keymap.set("n", "<leader>rc", jdtls.extract_constant, { desc = "Extract constant", buffer = bufnr })
    end,
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-javaagent:" .. lombok_bin,
        "-Xbootclasspath/a:" .. lombok_bin,
        "-jar",
        launcher,
        "-configuration",
        configuration,
        "-data",
        workspace,
    },
    root_dir = root_dir,
    settings = {
        java = {
            maven = {
                downloadSources = true,
            },
            eclipse = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            format = {
                enabled = true,
                settings = {
                    url = vim.fn.stdpath "config" .. "/intellij-java-google-style.xml",
                    profile = "GoogleStyle",
                },
            },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" }, -- Use fernflower to decompile library code
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*",
                    "sun.*",
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                hashCodeEquals = {
                    useJava7Objects = true,
                },
                useBlocks = true,
            },
        },
    },
    init_options = {
        bundles = {},
    },
}
