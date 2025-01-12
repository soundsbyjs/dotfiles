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

vim.cmd("colorscheme base16-bright")
