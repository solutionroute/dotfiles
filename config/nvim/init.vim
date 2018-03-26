" Neovim config
" Master at: https://github.com/solutionroute/dotfiles/blob/master/config/nvim/init.vim
" Last update: March 2018

" Paths
set spellfile=~/.vim/spell.en.add 
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

" Plugins and tuning, after adding a new Plug, remember to 
" <leader>w		- save this file
" <leader>SO    - reload init file
" :UpdateRemotePlugins
" :PlugInstall  - also do a PlugUpgrade once in a while...

call plug#begin('~/.local/share/nvim/plugged')

	Plug 'vim-scripts/mru.vim'						" <leader>r - Recent used files
	Plug 'troydm/easybuffer.vim'					" <leader>b - Buffers
	Plug 'scrooloose/nerdcommenter'					" <leader>cc (and more, see maps)
	" Go / development related
	Plug 'fatih/vim-go'								" run once  :GoInstallBinaries
	Plug 'buoto/gotests-vim'
	Plug 'Shougo/deoplete.nvim'
	Plug 'zchee/deoplete-go', { 'do': 'make'}		" Go auto completion
	Plug 'zchee/deoplete-jedi'						" Python auto completion
	Plug 'ervandew/supertab'						" Make autocompletion work even nicer 
	" ale lint helper and lightline integration
	Plug 'w0rp/ale'
	Plug 'maximbaz/lightline-ale'
	" Look and feel good
	Plug 'itchyny/lightline.vim'
	" colorschemes
	Plug 'nightsense/vimspectr'
	Plug 'tomasiser/vim-code-dark'

call plug#end()

" Tweaks for certain plugins 
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.pyc\|tags'
let g:lightline = { 'colorscheme': 'seoul256', }
let g:vimspectrItalicComment='on'
let g:deoplete#enable_at_startup = 1

" temp tuning
" set completeopt-=preview						" remove preview window
set completeopt=longest,menuone ",preview
" set completeopt+=noinsert
" set completeopt+=noselect

set cursorline									" highlight the current line for the cursor
" set number									" show number ruler
set ruler
set title										" let vim set the terminal title
set updatetime=100								" redraw the status bar often

" go 
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" let g:go_auto_sameids = 1 " highlight other vars of same name 
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

" appearance
set termguicolors								" for truecolor terms
set background=dark

" let g:codedark_conservative = 1
colorscheme codedark
" codedark tweaks
highlight Normal guifg=#a1a1a1
highlight GoReceiver guifg=#4EC9B0
highlight GoReceiverType guifg=#4EC9B0

" colorscheme vimspectrgrey-dark
" colorscheme vimspectr210-dark
" set background=light
" colorscheme vimspectr30-light

" general dark theme tweaks
highlight cursorline guibg=#232323
highlight SignColumn guibg=#232323

" tuning
set mouse=a										" move cursor to mouse click
set noerrorbells								" no beeps
set visualbell
set noshowmode									" lightline plugin shows us mode
set noswapfile									" don't use swapfile
set nobackup									" these just get in the way
set nostartofline								" don't jump to start of line when scrolling
set scrolloff=3									" keep n lines of context while scrolling
set nocursorcolumn								" do not highlight column
set ignorecase									" search case insensitive
set incsearch									" jump to match as typing
set hlsearch									" highlight search result 
set inccommand=split							" preview window for search and replace 

" syntax highlighting performance
syntax sync minlines=256						" start highlighting from 256 lines back
set synmaxcol=300								" do not highlight long lines


set pastetoggle=<F2>							" Insert "Paste" mode toggle

" tabs 
set tabstop=4 
set shiftwidth=4
set softtabstop=4

" encoding and file formats
set encoding=utf-8
set ffs=unix,dos,mac

" Wrapping and formatting
set autoindent
set backspace=indent,eol,start
set wrap
set textwidth=79
" set colorcolumn=+1							" vertical bar warns of too long line
set formatoptions=qrn1

" golang
au FileType go set noexpandtab
let g:go_fmt_command="goimports"				" adds missing dependencies on save
let g:go_list_type = "quickfix"

" Autocommands ===============
autocmd VimResized * :wincmd =		" Resize splits when the window is resized
"autocmd BufEnter * cd %:p:h		" auto set dir to dir of current file
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"autocmd BufReadPost *
"    \ if line("'\"") > 0 && line("'\"") <= line("$") |
"    \   exe "normal g`\"" |
"    \ endif

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"i.e LS=/bin/ls works only with:
set isfname-==				" filename autocompletion, gf (go file) tweak

" key mappings ===============
" remapping leader to SPACE from "\" makes for accessible Normal mode mappings
let g:mapleader = " "

" Quick save
noremap <leader>w :w<CR>
" Reload nvim/init.vim
noremap <leader>so :so $MYVIMRC<CR> 
" Edit init.vim
noremap <leader>ei :e $MYVIMRC<CR>

" ESCaping 
" make it easier to go to Normal mode command line (no need to Shift + :)
nnoremap ; :
" alternative way of getting Normal mode back in addition to ESC
" i for insert mode, ii for exit insert
inoremap ii <ESC>l

" Buffer navigation
" buffer next, previous 
nnoremap <C-j> :bn!<CR>
nnoremap <C-k> :bp!<CR>
" delete buffer
nnoremap <C-d> :bd<CR>

" Recent files
nnoremap <leader>r <ESC>:MRU<CR>
" Buffer list
nnoremap <leader>b <ESC>:EasyBufferHorizontalBelow<CR>

" Search
" Centre the window on the search match
nnoremap n nzzzv
nnoremap N Nzzzv
" Clear or re-enable search highlight
nnoremap <leader>hl :nohlsearch<cr>
nnoremap <leader>hs :set hlsearch<cr>

" formatting "
" """"""""""""
nnoremap <leader>f gwap

" PLUGIN SPECIFIC -----------------------------------------
" avoid annoying expand and collapse while typing
let g:ale_sign_column_always = 1
" alternatively only use it when saving...

" let g:lightline.component_expand = {
"       \  'linter_checking': 'lightline#ale#checking',
"       \  'linter_warnings': 'lightline#ale#warnings',
"       \  'linter_errors': 'lightline#ale#errors',
"       \  'linter_ok': 'lightline#ale#ok',
"       \ }
"
" let g:lightline.component_type = {
"       \     'linter_checking': 'warning',
"       \     'linter_warnings': 'warning',
"       \     'linter_errors': 'error',
"       \     'linter_ok': 'left',
"       \ }
"
" let g:lightline#ale#indicator_checking = "\uf110"
" let g:lightline#ale#indicator_warnings = "\uf071"
" let g:lightline#ale#indicator_errors = "\uf05e"
" let g:lightline#ale#indicator_ok = "\uf00c"
" let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }


" commenting
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" vim-go
autocmd FileType go nmap <leader>g <ESC>:!go run %<CR>

" disable cursor keys if you want to learn hjkl faster
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

