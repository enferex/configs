call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format'
Plug 'gruvbox-community/gruvbox'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'brookhong/cscope.vim'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'nvim-lua/plenary.nvim' " For telescope
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif
call plug#end()

" Spacing and general vim settings
set ts=2
set sw=2
set et
set cindent
set belloff=all
set number

set colorcolumn=80
set wildmenu " Show completions in status.
set modeline

" Colors
syntax enable
set t_Co=256
set background=dark
colorscheme gruvbox

" Syntastic settings
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" cscope settings
let g:cscope_silent = 1

" IndentLines settings
let g:indentLine_enabled = 1

" Airline settings
let g:airline_powerline_fonts = 1

" Mappings
nnoremap <leader>C :SyntasticCheck<CR> :SyntasticToggleMode<CR>
map <leader>N :NERDTree<cr>
map <leader>T :TagbarOpenAutoClose<cr>
map <leader>n :tabnext<cr>
map <leader>p :tabprev<cr>
map <leader>s :mks!<cr>
map <leader>I :IndentLinesToggle<cr>
map <leader>F :copen<CR>
map <leader>f :cclose<CR>

" Cscope mappings
" s: Find this C symbol
" g: Find this definition
" d: Find functions called by this function
" c: Find functions calling this function
" t: Find this text string
" e: Find this egrep pattern
" f: Find this file
" i: Find files #including this file
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

if has('nvim')
" LSP and CMP
  luafile ~/.vim/cmp_config.lua
  luafile ~/.vim/lsp_config2.lua
  luafile ~/.vim/ts_config.lua

" Other nvim plugin settings
"  nnoremap <silent>K :Lspsaga hover_doc<CR>
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif

" Clean up whitespace (https://idie.ru/posts/vim-modern-cpp#removing-trailing-whitespaces)
highlight ExtraWhitespace ctermbg=white guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Continue where you left off.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
