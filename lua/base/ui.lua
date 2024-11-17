return {
  {
    "nvim-tree/nvim-web-devicons",
    dependencies = { "DaikyXendo/nvim-material-icon" },
    config = function()
      require("nvim-web-devicons").setup {
        override = require("nvim-material-icon").get_icons(),
      }
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- Load during startup
    priority = 1000, -- Load before other plugins
    config = function()
      -- Load the colorscheme
      require("kanagawa").setup {
        compile = false, -- Don't compile the colorscheme (optional)
        theme = "wave", -- Choose a theme style (wave, dragon, lotus)
        background = {
          dark = "wave",
          light = "lotus",
        },
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          return {
            -- Customize specific highlights here if needed
            LineNr = { fg = colors.theme.ui.fg_dim },
            CursorLineNr = { fg = colors.palette.oniViolet },
          }
        end,
      }
      vim.cmd "colorscheme kanagawa"
    end,
  },
  --[[
  {
    "Shatur/neovim-ayu",
    config = function()
      -- Set the colorscheme to ayu and specify the style
      -- vim.cmd "termguicolors true" -- Default ayu theme
      -- Optionally, you can use these styles
      -- vim.cmd "colorscheme ayu-dark" -- Dark mode
      -- vim.cmd('colorscheme ayu-light') -- Light mode
      require("ayu").setup {
        mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
        terminal = true, -- Set to `false` to let terminal manage its own colors.
        overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
      }
      require("lualine").setup {
        options = {
          theme = "ayu",
        },
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      local tokyonight = require "tokyonight"
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  },
  ]]
  --
  --
  -- { "catppuccin/nvim", lazy = false, name = "catppuccin" },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
