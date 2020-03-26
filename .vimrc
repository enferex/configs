call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'rhysd/vim-clang-format'
Plug 'ycm-core/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'rust-lang/rust'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'brookhong/cscope.vim'
call plug#end()

" Spacing and general vim settings
set ts=2
set sw=2
set et
set cindent
set belloff=all

set colorcolumn=80
set wildmenu " Show completions in status.
set modeline

" Colors
syntax enable
set background=dark
set t_Co=256
colorscheme gruvbox

" YCM settings
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
set completeopt-=preview

" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" cscope settings
let g:cscope_silent = 1

" IndentLines settings
let g:indentLine_enabled = 0

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

" Continue where you left off.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
