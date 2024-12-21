local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Essentials --
Plug('jiangmiao/auto-pairs')
Plug('tpope/vim-fugitive')
Plug('airblade/vim-gitgutter')
Plug('tpope/vim-commentary')
Plug('preservim/nerdtree')
Plug('neovim/nvim-lspconfig')

Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('saadparwaiz1/cmp_luasnip')
Plug('L3MON4D3/LuaSnip')

-- Aesthetics --
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')

Plug('JoshPorterDev/nvim-base16')
Plug('ryanoasis/vim-devicons') -- For icons
Plug('tiagofumo/vim-nerdtree-syntax-highlight') -- Optional syntax highlighting
Plug('Xuyuanp/nerdtree-git-plugin') -- Optional Git integration
Plug('Yggdroot/indentLine')

vim.call('plug#end')
