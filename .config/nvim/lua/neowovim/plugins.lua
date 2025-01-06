local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Essentials --
Plug('jiangmiao/auto-pairs')
Plug('tpope/vim-fugitive')
Plug('f-person/git-blame.nvim')
Plug('tpope/vim-commentary')
Plug('preservim/nerdtree')
Plug('airblade/vim-gitgutter')
Plug('hrsh7th/nvim-cmp')
Plug('saadparwaiz1/cmp_luasnip')
Plug('L3MON4D3/LuaSnip')
Plug('lewis6991/gitsigns.nvim')

-- lsp, etc
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
Plug('hrsh7th/cmp-nvim-lua')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/vim-vsnip')


-- lsp downloaders
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- rust
Plug('simrat39/rust-tools.nvim')

-- Aesthetics --
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('JoshPorterDev/nvim-base16')
Plug('ryanoasis/vim-devicons')
Plug('tiagofumo/vim-nerdtree-syntax-highlight') 
Plug('Xuyuanp/nerdtree-git-plugin') 
Plug('Yggdroot/indentLine')

vim.call('plug#end')
