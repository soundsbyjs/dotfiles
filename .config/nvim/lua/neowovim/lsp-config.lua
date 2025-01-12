-- as this grows, I'll make each lang into its own directory
-- iirc neovim has a way to only execute vimscript parts for certain filetypes
-- so that's funky and cool!

local lspconfig = require('lspconfig')
lspconfig.pyright.setup{}
lspconfig.clangd.setup{
    capabilities = capabilities
}

lspconfig.texlab.setup {
  cmd = { "texlab" },
  filetypes = { "tex", "bib" },
  root_dir = function(filename)
    return util.path.dirname(filename)
  end,
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        executable = "latexmk",
        forwardSearchAfter = false,
        onSave = false
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = false
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        args = {}
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = false
      },
    },
  },
}


vim.api.nvim_set_keymap('n','gD',[[:lua vim.lsp.buf.declaration()<cr>]],{})
vim.api.nvim_set_keymap('n','gd',[[:lua vim.lsp.buf.definition()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>K',[[:lua vim.lsp.buf.hover()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>gr',[[:lua vim.lsp.buf.references()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>gs',[[:lua vim.lsp.buf.signature_help()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>gi',[[:lua vim.lsp.buf.implementation()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>gt',[[:lua vim.lsp.buf.type_definition()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>gw',[[:lua vim.lsp.buf.document_symbol()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>gW',[[:lua vim.lsp.buf.workspace_symbol()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>af',[[:lua vim.lsp.buf.code_action()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>ee',[[:lua vim.lsp.util.show_line_diagnostics()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>ar',[[:lua vim.lsp.buf.rename()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>=',[[:lua vim.lsp.buf.formatting()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>ic',[[:lua vim.lsp.buf.incoming_calls()<cr>]],{})
vim.api.nvim_set_keymap('n','<Leader>oc',[[:lua vim.lsp.buf.outgoing_calls()<cr>]],{})

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'ts_ls', 'gopls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 1 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})


-- Mason Setup
-- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()


---------- language specific: ------------


