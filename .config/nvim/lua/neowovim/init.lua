-- Welcome to my new and improved neovim configs! --
-- Step 1. Add all my files --

-- theme -- (must be loaded before lualine!)


-- plugins with vim plug

require("neowovim.defaultsAndMaps")

require('neowovim.plugins')

-- configs for my plugins
require("neowovim.PluginConfigs.lualine")
require("neowovim.PluginConfigs.treesitter")
require("neowovim.PluginConfigs.gitsigns")

require("neowovim.PluginConfigs.init")

-- defaults and things

-- lsp stuff
require("neowovim.lsp-config")

-- theme
require("laserwave").setup({
  flavor = "original", -- "original" | "hi_c"
  -- possible modes: "lsp" (semantic highlights) | "treesitter" (no semantic highlights) | "vim" (builtins only)
  syntax_mode = "lsp",
  transparent = true,
  terminal_colors = true,
  italic_comments = true,
  italic_keywords = true,
  italic_functions = false,
  italic_variables = false,
  plugins = {
    blink = true,
    cmp = false,
    git = true,
    mini_pick = true,
    neotree = false,
    obsidian = true,
    occurrence = true,
    package_info = false,
    snacks = true,
    space = true,
    telescope = true,
  },
})

vim.api.nvim_command([[
    augroup ChangeBackgroudColour
        autocmd colorscheme * :hi normal guibg=#0a0a0a
    augroup END
]])
vim.o.termguicolors = true

vim.cmd("colorscheme laserwave-hi_c")


