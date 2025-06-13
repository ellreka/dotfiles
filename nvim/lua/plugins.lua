local neovim_plugins = {
  -- https://github.com/Shatur/neovim-ayu
  {
    'Shatur/neovim-ayu',
    lazy = false,
    config = function()
      require('ayu').setup({
        mirage = false,
        terminal = true,
        overrides = {
          LineNr = { fg = "None" }
        }
      })
      require('ayu').colorscheme()
    end
  },
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "tsx", "typescript", "javascript", "fish", "php", "json", "yaml", "css", "html", "lua" },
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        }
      })
    end
  }
}
local common_plugins = {
  {
    'echasnovski/mini.indentscope',
    version = '*',
    config = function()
      require('mini.indentscope').setup()
    end
  },
  {
    'echasnovski/mini.cursorword',
    lazy = false,
    version = '*',
    config = function()
      require('mini.cursorword').setup()
    end
  },
  {
    'echasnovski/mini.surround',
    lazy = false,
    version = '*',
    config = function()
      require('mini.surround').setup()
    end
  },
  {
    'echasnovski/mini.trailspace',
    version = '*',
    config = function()
      require('mini.trailspace').setup()
    end
  },
  -- https://github.com/nvim-tree/nvim-tree.lua
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        sort_by = 'case_sensitive',
        view = {
          adaptive_size = true,
        },
        renderer = {
          group_empty = true
        },
        filters = {
          dotfiles = true
        }
      })
    end
  },
  -- https://github.com/nvim-lualine/lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'ayu_mirage'
        }
      })
    end
  },
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim',
      'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope-fzf-native.nvim' },
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
  },
  -- https://github.com/akinsho/toggleterm.nvim
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
  },
  -- https://github.com/romgrk/barbar.nvim
  {
    'romgrk/barbar.nvim',
    dependencies = { 'lewis6991/gitsigns.nvim', 'nvim-tree/nvim-web-devicons' },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      sidebar_filetypes = {
        NvimTree = true,
      }
    },
    version = '^1.7.0'
  },
  -- https://github.com/windwp/nvim-autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}
  },
  -- AI
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("claude-code").setup()
    end
  },
  -- LSP
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonUpdate", "MasonLog", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
    config = true,
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      automatic_enable = true,
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = true,
    keys = {
      { "<C-n>", "<cmd>lua vim.lsp.completion.get() <CR>", mode = "i" },
      { "gh",    "<cmd>lua vim.lsp.buf.hover()       <CR>" },
      { "gd",    "<cmd>lua vim.lsp.buf.definition()  <CR>" },
      { "gD",    "<cmd>lua vim.lsp.buf.declaration() <CR>" },
    }
  }
}

vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert", "preview" }

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = chars

      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.keymap.set('n', '<S-A-f>', function()
        vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
      end, { buffer = args.buf })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

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
