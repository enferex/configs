call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format'
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'hrsh7th/nvim-compe'
else
  Plug 'vim-syntastic/syntastic'
  Plug 'ycm-core/YouCompleteMe', {'do': './install.py --clang-completer'}
endif
Plug 'rust-lang/rust'
Plug 'junegunn/seoul256.vim'
Plug 'gruvbox-community/gruvbox'
"Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'brookhong/cscope.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown'
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

" YCM settings
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
set completeopt=preview,menuone,noselect

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

" FZF settings
nmap <C-P> :FZF<CR>

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

" LSP bindings
if has('nvim')
luafile ~/.vim/lsp_config.lua
nnoremap <silent>K :Lspsaga hover_doc<CR>
endif

" Compe settings
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

" Continue where you left off.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
