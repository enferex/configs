-- Originaly from: https://github.com/mplusp/minimal-nvim-0.11-lsp-setup/blob/main/lua/config/options.lua

vim.cmd('colorscheme gruvbox')
vim.opt.number = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.colorcolumn = '80'
vim.g.have_nerd_font = true

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = 'red' })
vim.fn.matchadd("TrailingWhitespace", "\\s\\+$\\|^\\n\\n\\+")

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Preview substitutions
vim.opt.inccommand = 'split'

-- Text wrapping
vim.opt.wrap = true
vim.opt.breakindent = true

-- Tabstops
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Save undo history
vim.opt.undofile = true

-- Set the default border for all floating windows
vim.opt.winborder = 'rounded'

-- Keybindings
vim.keymap.set('n', '<leader>T', ':TagbarOpenAutoClose<cr>')
vim.keymap.set('n', '<leader>n', ':tabnext<cr>')
vim.keymap.set('n', '<leader>p', ':tabprev<cr>')
vim.keymap.set('n', '<leader>s', ':mks!<cr>')
vim.keymap.set('n', '<leader>I', ':IndentLinesToggle<cr>')
vim.keymap.set('n', '<leader>F', ':copen<CR>')
vim.keymap.set('n', '<leader>f', ':cclose<CR>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', 'cmd>Telescope help_tags<cr>')
