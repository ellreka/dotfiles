local neovim_plugins = {{
    -- https://github.com/Shatur/neovim-ayu
    'Shatur/neovim-ayu',
    lazy = false,
    config = function()
        require('ayu').setup({
            mirage = true
        })
        require('ayu').colorscheme()
    end
}, {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {"tsx", "typescript", "javascript", "fish", "php", "json", "yaml", "css", "html", "lua"},
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            }
        })
    end
}}

local common_plugins = {{
    -- https://github.com/numToStr/Comment.nvim
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false
}, {
    -- https://github.com/nvim-tree/nvim-tree.lua
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require('nvim-tree').setup({
            sort_by = 'case_sensitive',
            view = {
                adaptive_size = true
            },
            renderer = {
                group_empty = true
            },
            filters = {
                dotfiles = true
            }
        })
    end
}, {
    -- https://github.com/nvim-lualine/lualine.nvim
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require('lualine').setup({
            options = {
                theme = 'ayu_mirage'
            }
        })
    end
}, -- https://github.com/nvim-telescope/telescope.nvim
{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    lazy = false,
    dependencies = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim',
                    'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope-fzf-native.nvim'},
    config = function()
        require("telescope").load_extension("file_browser")
        require("telescope").setup({
            extensions = {
                file_browser = {
                    theme = "ayu-mirage"
                },
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case"
                }
            },
            defaults = {
                -- initial_mode = "normal",
                hidden = true
            },
            hidden = true,
            cwd = vim.fn.expand("%:p:h")
        })
        vim.keymap.set('n', '<Leader>f', '<cmd>Telescope file_browser path=%:p:h select_buffer=true hidden=true<CR>')
        vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files cwd=%:p:h<CR>')
        vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>')
        vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<CR>')
    end
}, -- https://github.com/akinsho/toggleterm.nvim
{
    'akinsho/toggleterm.nvim',
    version = "*",
    lazy = false,
    config = function()
        require("toggleterm").setup({
            size = 10,
            open_mapping = [[<leader>t]],
            insert_mappings = false,
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            persist_size = true
        })
    end
}, -- https://github.com/romgrk/barbar.nvim
{
    'romgrk/barbar.nvim',
    dependencies = {'lewis6991/gitsigns.nvim', 'nvim-tree/nvim-web-devicons'},
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
    },
    version = '^1.7.0'
}, -- https://github.com/windwp/nvim-autopairs
{
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}
}, -- https://github.com/stevearc/conform.nvim
{
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        local conform = require('conform')
        conform.setup({
            formatters_by_ft = {
                javascript = {"prettier"},
                typescript = {"prettier"},
                typescriptreact = {"prettier"}
            },
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500
            }
        })
        vim.keymap.set({'n', 'v'}, '<Leader>l', function(args)
            conform.format({
                async = true,
                lsp_fallback = false
            })
        end)
    end
}, -- LSP
{
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {}
}, {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig", "onsails/lspkind-nvim", "hrsh7th/nvim-cmp",
                    'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/vim-vsnip',
                    'hrsh7th/cmp-vsnip'},
    config = function()
        -- nvim-cmp
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        cmp.setup({
            enabled = true,
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end
            },
            sources = {{
                name = "nvim_lsp"
            }, {
                name = 'vsnip'
            }, {
                name = "buffer"
            }, {
                name = "path"
            }},
            mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({
                    select = true
                })
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            formatting = {
                fields = {'abbr', 'kind', 'menu'},
                format = lspkind.cmp_format({
                    mode = 'text'
                })
            }
        })

        local mason = require('mason')
        local lspconfig = require('lspconfig')
        local mason_lspconfig = require('mason-lspconfig')

        mason.setup()
        mason_lspconfig.setup()
        mason_lspconfig.setup_handlers({function(server_name)
            lspconfig[server_name].setup({})
        end})

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(_)
                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
                vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
                vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
                vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
                vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
                vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
                vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
                vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
            end
        })

        vim.lsp.handlers["textDocument/publishDiagnostics"] =
            vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false
            })
    end
}}

function merge_tables(t1, t2)
    local merged = {}
    for _, v in ipairs(t1) do
        table.insert(merged, v)
    end
    for _, v in ipairs(t2) do
        table.insert(merged, v)
    end
    return merged
end

local is_vscode = vim.g.vscode == 1

return merge_tables(common_plugins, is_vscode and {} or neovim_plugins)
