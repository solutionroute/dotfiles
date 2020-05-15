" Neovim configuration Mike Watkins <github@mikewatkins.ca>
"
" Last updated May 2020, aiming for minimalism:
"
"   - No attempt to remain compatible with Vim.
"   - Trimming out all non essential settings/defaults already set by Neovim.
"
" Note: Leader is defined as " " (spacebar in normal mode), and handy here:
"   - Leader-w saves files
"   - Leader-so reloads this file
"   - Leader-ei edits this initialization file
"
" See Key Mapping section for all key mappings and comments.
"
" Issues? Try running :checkhealth

" -- Plugins -----------------------------------------
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
    Plug 'tpope/vim-commentary'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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

" -- Tuning ------------------------------------------
set mouse=a                             " move the cursor with mouse even on terms
set clipboard+=unnamed                  " y(ank) and p(aste) access the global clipboard
set autochdir                           " change to cur dir of cur file
set nobackup                            " these files just get in the way
set nowritebackup
set noswapfile                          " don't use swapfile
set noerrorbells                        " no beeps
set visualbell
set nostartofline                       " don't jump to start while scrolling
set scrolloff=3                         " keep n lines of context above and below above and below
set ignorecase                          " when searching, also impacts command line matching
set smartcase                           " Tunes search if you type mixed case
set hlsearch                            " highlight search result - <leader>/ to cancel
set inccommand=split                    " preview window for search/replace
" set expandtab                           " set in autocmds
set autoindent                          " Copy indent from current line on <enter>
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start          " Let Backspace do more things 
set ffs=unix,dos,mac                    " file format preferences, in order
filetype off
filetype plugin indent on

" -- Paths -------------------------------------------
" A good idea to .gitignore these, and shada file
set spellfile=~/.config/nvim/spell.en.add   

" -- Mappings ----------------------------------------
" Save a shift key press... hit ; in Normal to go to command line
nnoremap ; :
" In insert mode, two ;; takes you to Normal (so a third will give you cmd)
inoremap ;; <ESC>  
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
" Write current file, also ctrl-s to match VS Code
noremap <leader>w :w<CR>
noremap <C-s> :w<CR>
" SOurce (reload)jinit.vim
noremap <leader>so :so $MYVIMRC<CR>     
" Edit Init.vim    
noremap <leader>ei :e $MYVIMRC<CR>
" Toggle comments 
noremap <leader>cc :Commentary<CR>
" turn off highlight search
noremap <leader>/ :nohlsearch<CR>
" FZF mappings
" https://github.com/junegunn/fzf.vim
noremap <leader>b :Buffers<CR>
noremap <leader>r :History<CR>
" FZF fuzzy finder no preview window
noremap <leader>ff :FZF<CR>
" with preview
noremap <leader>fa :Files<CR>
" Open current dir
noremap <leader>e :e .<CR>

" -- Auto Commands -----------------------------------
" Puts nvim into dir of current file 
autocmd BufEnter * silent! lcd %:p:h    
" Restore last position in file. See:
"   :help last-position-jump
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
" Filetype specific
augroup config
    autocmd filetype go,python,html,javascript,vim,markdown,md,yaml,toml setlocal expandtab
    autocmd BufNewFile,BufRead *.html,*.htm,*.gohtml,*.tpl  setf html
augroup end

" A tweak gor vim-go, auto add imports on save
let g:go_imports_autosave = 1

" -- A Gift ------------------------------------------
" Last on purpose but hardly least - I saw this somewhere years ago
" And it helped me develop my vim keys muscle memory faster: 
" Disable your normal-mode cursor keys!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

