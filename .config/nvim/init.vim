set termguicolors
set noswapfile
set cursorline
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set splitbelow splitright
set nu rnu
set noshowmode
" set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
" set ruler               " show line and column number of the cursor on right side of statusline
syntax enable

call plug#begin('~/.config/plugged-nvim')

    " Live server
    " Plug 'turbio/bracey.vim'

    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " fuzzy search
    " Plug 'nvim-lua/plenary.nvim'
    " Plug 'nvim-telescope/telescope.nvim'
    " Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    " Commenting
    Plug 'tpope/vim-commentary'

    " Colorful brackets
    Plug 'frazrepo/vim-rainbow'

    " Smoothe scrolling
    Plug 'psliwka/vim-smoothie'

    " Formatter
    Plug 'rhysd/vim-clang-format'

    " Themes
    " Plug 'gosukiwi/vim-atom-dark'
    " Plug 'kyoz/purify'
    Plug 'morhetz/gruvbox'
    Plug 'tomasiser/vim-code-dark'
    " Plug 'ErichDonGubler/vim-sublime-monokai'
    " Plug 'arcticicestudio/nord-vim'
    " Plug 'NLKNguyen/papercolor-theme'

    " i3 color
    " Plug 'mboughaba/i3config.vim'

    " File
    " Plug 'scrooloose/nerdtree'                         " Nerdtree
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    " Plug 'ryanoasis/vim-devicons'



    " Instant markdown
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
    " Airline
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes

    " Auto completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Auto bracket pair
    Plug 'jiangmiao/auto-pairs'
    " Plug 'tpope/vim-surround'

    " Git change
    Plug 'airblade/vim-gitgutter'

    " Vim snippets
    " Plug 'SirVer/ultisnips' 
    " Plug 'honza/vim-snippets' 

    " Start
    "Plug 'mhinz/vim-startify'

    " Syntax checking
    " Plug 'scrooloose/syntastic'

    " Goyo - Distraction free writing
    " Plug 'junegunn/goyo.vim'    

    " Limelight
    " Plug 'junegunn/limelight.vim'
    
    " Maximizer
    Plug 'szw/vim-maximizer'

call plug#end()

" coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"""""" colorscheme  """"""
colorscheme gruvbox
set background=dark
"""""" colorscheme  """"""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Find files using telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:codesdir=$HOME . "/codes/X"

" Key mapping for cp
autocmd filetype cpp map <F3> :!g++ % -D LOCAL -std=c++17 -o /home/labib/codes/X/program && timeout 5 /home/labib/codes/X/program <CR>
autocmd filetype cpp map <F5> :!g++ % -D LOCAL -std=c++17 -o /home/labib/codes/X/program <CR> 
" autocmd filetype cpp map <F4> :!g++ % -D LOCAL -std=c++17 -o /home/labib/codes/X/program &&  timeout 5 /home/labib/codes/X/program > /home/labib/codes/X/out <CR>
autocmd filetype cpp map <F6> :!g++ % -D LOCAL -std=c++17 -o /home/labib/codes/X/program && (timeout 5 /home/labib/codes/X/program < /home/labib/codes/X/in) >  /home/labib/codes/X/out<CR>
autocmd filetype python map <F5> :!python3 % <CR>
autocmd filetype sh map <F5> :!chmod +x % && ./% <CR>
autocmd filetype js map<F6> :!node % <CR>

" Copy/Paste Output/Input
fu UpdateInput()
    exe "silent !xclip -o -sel clip > " . g:codesdir . "/in"
endfu

fu CopyOutput()
    exe "silent !xclip -sel clip " . g:codesdir . "/out"
endfu

map <F4> :call UpdateInput() <CR>
map<leader><F3> :call CopyOutput() <CR>

" Leader key
let mapleader=',,'

" Copy whole file
map <Leader>y :%y+ <CR>  
" Delete whole file
map <Leader>d :%d <CR>

" More comfortable esc
" map <C-[> <ESC>
map <A> <ESC>

" Save file
noremap <C-s> :w <CR>
inoremap <C-s> <ESC>:w<CR>

noremap <Leader>s :w <CR> :ClangFormat <CR>
inoremap <Leader>s <ESC>:w<CR> :ClangFormat <CR>

" Copy template
noremap <Leader>t :!cp template.cpp %<CR><CR>

" Open IO
noremap <Leader>i :call IO()<CR>

" Maximize current tab 
nnoremap <C-a> :MaximizerToggle<CR>

" Proper home
noremap <Home> ^
inoremap <Home> <ESC>^i

" Close all window
"nnoremap <C-w> :wqa! <CR>
map <Leader>q :wqa! <CR>

" Focus current window
nnoremap <C-t> :Goyo <CR>

" things
nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Move highlighted lines up or down

" Testing
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

 let t:is_transparent = 0
 function! Toggle_transparent()
     if t:is_transparent == 0
         hi Normal guibg=NONE ctermbg=NONE
         let t:is_transparent = 1
     else
         set background=dark
         let t:is_tranparent = 0
     endif
 endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>

call Toggle_transparent()

function! CUR()
    "highlight clear CursorLine
    "hi CursorLine gui=underline
endfunction

call CUR()

function! CLR()
    highlight clear StatusLine
endfunction

call CLR()

function! IO()
    vs ~/codes/X/in
    split ~/codes/X/out
endfunction

" FAHIM

hi CursorLineNr guibg=none
hi VertSplit cterm=none gui=none guibg=none
hi Search guibg=none guifg=#8d93a1 gui=underline
hi snipLeadingSpaces guifg=bg

set wildmenu
set path+=**
set hidden
set scrolloff=8

set statusline=\ %M\ %r\ %f 
set statusline+=%=
set statusline+=\ [%{getcwd()}]\ [%n]\ %p%%

set noequalalways

" Sets the cursor as a 'block' in insert mode
"set guicursor=n-v-c:block-Cursor 
