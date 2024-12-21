-- Welcome to my new and improved neovim configs! --
-- Step 1. Add all my files --

-- plugins uses vim plug

require("neowovim.defaultsAndMaps")

require('neowovim.plugins')

-- configs for my plugins
require("neowovim.PluginConfigs.init")

-- defaults and things

-- lsp stuff
require("neowovim.lsp-config")
