return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd",
                    "cmake",
                    "gradle_ls",
                    "lua_ls",
                    "html",
                    "cssls",
                    "kotlin_language_server",
                    "java_language_server",
                    "ltex",
                    "pylsp",
                    "rust_analyzer",
                    "taplo",
                    "marksman",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = true,
                severity_sort = true,
            })
            vim.lsp.config['clangd'] = {
                capabilities = capabilities,
            --     cmd = {
            --         "clangd",
            --         "--compile-commands-dir=build",
            --         "--query-driver=/usr/bin/g++,/usr/bin/clang++"
            --     },
            }
            vim.lsp.config['taplo'] = {
                capabilities = capabilities
            }
            vim.lsp.config['lua_ls'] = {
                capabilities = capabilities
            }
            vim.lsp.config['cssls'] = {
                capabilities = capabilities
            }
            vim.lsp.config['marksman'] = {
                capabilities = capabilities
            }
            vim.lsp.config['kotlin_language_server'] = {
                capabilities = capabilities
            }
            vim.lsp.config['verible'] = {
                capabilities = capabilities
            }
            -- vim.lsp.config['clangd'] = {
            --     cmd = { "clangd", "--compile-commands-dir=." },
            --     root_dir = function(fname)
            --         return require('lspconfig.util').root_pattern('compile_commands.json')(fname)
            --             or vim.fn.getcwd()
            --     end,
            -- }
            vim.lsp.config['pylsp'] = {
                on_attach = custom_attach,
                settings = {
                    pylsp = {
                        plugins = {
                            -- formatter options
                            black = { enabled = true },
                            autopep8 = { enabled = false },
                            yapf = { enabled = false },
                            -- linter options
                            pylint = { enabled = true, executable = "pylint" },
                            pyflakes = { enabled = false },
                            pycodestyle = { enabled = false },
                            -- type checker
                            pylsp_mypy = { enabled = true },
                            -- auto-completion options
                            jedi_completion = { fuzzy = true },
                            -- import sorting
                            pyls_isort = { enabled = true },
                        },
                    },
                },
                flags = {
                    debounce_text_changes = 200,
                },
                capabilities = capabilities,

            }
            vim.lsp.enable({
                "clangd",
                "pylsp",
                "verible",
                "taplo",
                "lua_ls",
                "cssls",
                "marksman",
                "kotlin_language_server"
            })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
