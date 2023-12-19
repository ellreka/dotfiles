return {
  -- https://github.com/Shatur/neovim-ayu
  {
    'Shatur/neovim-ayu',
    lazy = false,
    config = function()
      require('ayu').setup({
        mirage = true
      })
      require('ayu').colorscheme()
    end
  },
  -- https://github.com/numToStr/Comment.nvim
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  -- https://github.com/nvim-tree/nvim-tree.lua
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup({
        sort_by = 'case_sensitive',
        view = {
          adaptive_size = true,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
    end
  },
  -- https://github.com/nvim-lualine/lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'ayu_mirage',
        }
      })
    end
  },
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
      require("telescope").load_extension("file_browser")
      require("telescope").setup({
        extensions = {
          file_browser = {
            theme = "ayu-mirage",
          },
        }
      })
    end
  },
}
