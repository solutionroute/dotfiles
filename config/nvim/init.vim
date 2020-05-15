" Neovim configuration Mike Watkins <github@mikewatkins.ca>
"
" Last updated May 2020, aiming for minimalism:
"
"   - No attempt to remain compatible with Vim.
"   - Trimming out all non essential settings/defaults already set by Neovim.
"   - Simple, working, Go (and other langs if desired) completion.
"
" Note: Leader is defined as " " (spacebar in normal mode), and handy here:
"   - Leader-w saves files
"   - Leader-so reloads this file
"   - Leader-ei edits this initialization file
"
" See Key Mapping section for all key mappings and comments.
"
" Issues? Try running :CheckHealth
"
" -- Plugins -----------------------------------------
"
" Remember to :PlugInstall and once in a while run :PlugUpdate/PlugUpgrade
"
" Auto-download vim-plug if this is a new installation
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'tpope/vim-commentary'

    " Autocompletion magic, easy, really:
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " For Go, once coc PlugInstall has been run, install support via:
    " :CocInstall coc-go
    " ... and that's it.
    " https://github.com/josa42/coc-go
    "
   " theme and status bar
    Plug 'tomasiser/vim-code-dark' 
    Plug 'itchyny/lightline.vim'
call plug#end()

" -- Theme & Syntax  ---------------------------------
set termguicolors
highlight clear    
syntax reset    
colorscheme codedark

" -- Appearance --------------------------------------
set cursorline                          " highlight the current line for the cursor
set number                              " show number ruler
set nocursorcolumn                      " do not highlight column
set noshowmode                          " lightline plugin shows us modej
set title                               " let vim set the terminal title
"
" -- Tuning ------------------------------------------
set mouse=a                             " move the cursor with mouse even on terms
set clipboard+=unnamed                  " y(ank) and p(aste) access the global clipboard
set autochdir                           " change to cur dir of cur file
set nobackup                            " these just get in the way
set noswapfile                          " don't use swapfile
set noerrorbells                        " no beeps
set visualbell
set nostartofline                       " don't jump to start while scrolling
set scrolloff=3                         " keep n lines of context above and below above and below
set ignorecase                          " when searching, also impacts command line matching
set smartcase                           " Tunes search if you type mixed case
set hlsearch                            " highlight search result - <leader>/ to cancel
set inccommand=split                    " preview window for search/replace

set autoindent                          " Copy indent from current line on <enter>
set smarttab
set backspace=indent,eol,start          " Let Backspace do more things 

" set shortmess+=c   " Shut off completion messages
" set belloff+=ctrlg " If Vim beeps during completion

" set expandtab                           " set in autocmds
set tabstop=4
set shiftwidth=4
set softtabstop=4

set ffs=unix,dos,mac                    " file format preferences, in order
filetype off
filetype plugin indent on

" -- Paths -------------------------------------------
" A good idea to .gitignore all these...
set spellfile=~/.config/nvim/spell.en.add   
" TODO shada file

" -- Mappings ----------------------------------------
" Save a shift key press... hit ; in Normal for the command line
nnoremap ; :

" Reflow lines - Alt Q like VSCode 
nnoremap <M-q> gwap

" Buffer navigation
" buffer next, previous 
nnoremap <C-j> :bn!<CR>
nnoremap <C-k> :bp!<CR>
" delete buffer
nnoremap <C-d> :bd<CR>

"  <leader> mappings
"  Define SPACE as the leader key.
let g:mapleader = " "
" Write current file
noremap <leader>w :w<CR>
" SOurce (reload)jinit.vim
noremap <leader>so :so $MYVIMRC<CR>     
" Edit Init.vim    
noremap <leader>ei :e $MYVIMRC<CR>
" Toggle comments
noremap <leader>cc :Commentary<CR>
" turn off highlight search
noremap <leader>/ :nohlsearch<CR>
" FZF fuzzy finder
noremap <leader>ff :FZF<CR>
" FZF mappings
" https://github.com/junegunn/fzf.vim
noremap <leader>b :Buffers<CR>
noremap <leader>r :History<CR>
" Open current dir
noremap <leader>e :e .<CR>
noremap <leader>f :Files<CR>

" -- Auto Commands -----------------------------------
autocmd BufEnter * silent! lcd %:p:h    " Enter automatically into the files directory
autocmd filetype go,python,html,javascript,vim,markdown,md,yaml,toml set expandtab

" Last on purpose but hardly least, disable your normal-mode cursor keys if
" you want to learn hjkl faster!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

