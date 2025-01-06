-- PluginConfigs --
-- Directory where all plugins are configured --
-- some are .vim files, some are .lua files
-- I could put these in different directories but i dont care!

vimdex = "~/.config/nvim/lua/neowovim/"
plugindex = vimdex .. "/PluginConfigs"
vim.cmd('source' .. plugindex .. "/*.vim")
