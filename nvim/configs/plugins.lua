-- Originally from https://github.com/junegunn/vim-plug

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Shorthand notation for GitHub; translates to https://github.com/junegunn/seoul256.vim.git
-- Themes
Plug('junegunn/seoul256.vim')
Plug('gruvbox-community/gruvbox')
Plug('tomasr/molokai')
Plug('sickill/vim-monokai')
-- Other
Plug('majutsushi/tagbar')
Plug('rhysd/vim-clang-format')
Plug('Yggdroot/indentLine')
Plug('airblade/vim-gitgutter')
Plug('brookhong/cscope.vim')
Plug('neovim/nvim-lspconfig')
Plug('nvim-lua/plenary.nvim') -- For telescope
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries' })
Plug('folke/trouble.nvim')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-lualine/lualine.nvim')
vim.call('plug#end')

-- Lualine
require('lualine').setup {
  options = { theme = 'dracula' },
}
