" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
filetype off


Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'

Plug 'mattn/emmet-vim'

Plug 'scrooloose/nerdtree'

Plug 'flazz/vim-colorschemes'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline-themes'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hu,-neovim-rpc'
endif
Plug 'Shougo/neco-syntax'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'thalesmello/webcomplete.vim'

Plug 'pangloss/vim-javascript'


call plug#end()


"cambio de NERDTreeToggle con compando de sublime
nmap <C-k><C-b> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30


colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1



""""""""

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8





if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab
set gdefault " para dejar a g como default en las busquedas

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
"muestra cursor
set ruler
set showcmd
set wildmenu

set autoread

" tabs de 2 espacios, no tabs, sino espacios
set tabstop=2
set shiftwidth=2
set expandtab
set listchars=tab:▒░,trail:▓
set list

inoremap <C-U> <C-G>u<C-U>

" muestra numeros
set number



""BUSQUEDAS -------------

" busqueda en tiempo real
set incsearch
"highlight a la busqueda
set hlsearch
set ignorecase
set smartcase




" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
" ??
set mousemodel=popup

"" Disable the blinking cursor. // TESTING
set gcr=a:blinkon0
set scrolloff=3


" do not history when leavy buffer
set hidden

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" exit insert mode 
inoremap <C-c> <Esc>

set completeopt=menuone,longest,preview






"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall










"---------------
" Plugins config
"---------------

" CtrlP

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" comando para optimizar la busqueda, intalar silversearcher-ag
" con esto se puede usar un .agignore
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

set wildmode=list:longest,list:full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 



" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" Indent
vnoremap <Tab> >
vnoremap <S-Tab> <

" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S



" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i



" lazy ':' // no lo uso
" map \ :

let mapleader = ','
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>

"para git gutter en real time
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'

"para ver la columna negra
highlight SignColumn ctermbg=black



" para guardar una sesion presionando ,s
nnoremap <leader>s :mksession!<CR> " type ',s' to save the buffers etc. Reopen where you were with Vim with 'vim -S'

"para abrir el .vimrc mas rapidamente
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR> " type,evto edit the Vimrc

" ctrl + shift abajo y arriba para mover una linea
nnoremap <C-Down> :m+1<CR>
nnoremap <C-Up> :m-1<CR>


" tabulacion
" vmap <Tab> >gv
" vmap <S-Tab> <gv

" http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! w !sudo tee > /dev/null %



"---- DEOPLETE
let g:deoplete#enable_at_startup = 1
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
