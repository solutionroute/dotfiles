" Neovim config, go and python centric
" See: https://github.com/solutionroute/dotfiles

" Paths
set spellfile=~/.vim/spell.en.add 
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'


" Plugins and tuning, after adding a new Plug, remember to 
" <leader>w		- save
" <leader>SO    - reload init file
" :PlugInstall  - also do a PlugUpgrade once in a while...
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.pyc\|tags'
let g:lightline = { 'colorscheme': 'seoul256', }
let g:vimspectrItalicComment='on'

call plug#begin('~/.local/share/nvim/plugged')

Plug 'neomake/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'				" run once  :GoInstallBinaries
Plug 'itchyny/lightline.vim'	
Plug 'nightsense/vimspectr'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'

call plug#end()

" appearance
set termguicolors				" for truecolor terms
set background=dark
colorscheme vimspectrgrey-dark
"colorscheme vimspectr210-dark
"set background=light
"colorscheme vimspectr0-light

" tuning
set noerrorbells				" no beeps
set visualbell
set noshowmode					" lightline plugin shows us mode
set noswapfile					" don't use swapfile
set nobackup					" these just get in the way
set nostartofline				" don't jump to start of line when scrolling
set nocursorcolumn       		" do not highlight column
set nocursorline         		" do not highlight cursor line
syntax sync minlines=256 		" start highlighting from 256 lines backwards
set synmaxcol=300        		" do not highlight long lines
set ignorecase					" search case insensitive
set hidden						" allows buf switch even if modified
set scrolloff=3					" keep n lines of context while scrolling
set completeopt+=noinsert
set completeopt+=noselect

set pastetoggle=<F2>			" Insert "Paste" mode toggle

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
" set colorcolumn=+1				" vertical bar warns of too long line
set formatoptions=qrn1

" golang
au FileType go set noexpandtab
let g:go_fmt_command="goimports"	" adds missing dependencies on save

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Autocommands ===============
autocmd VimResized * :wincmd = 		" Resize splits when the window is resized
autocmd BufEnter * cd %:p:h 		" auto set dir to dir of current file
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"i.e LS=/bin/ls works only with:
set isfname-== 				" filename autocompletion, gf (go file) tweak

" key mappings ===============
" remapping leader to SPACE from "\" makes for accessible Normal mode mappings
let g:mapleader = " "

" Quick save
noremap <leader>w :w<CR>
" Reload nvim/init.vim
noremap <leader>so :so $MYVIMRC<CR> 

" ESCaping 
" make it easier to go to Normal mode command line (no need to Shift + :)
nnoremap ; :
" alternative way of getting Normal mode back in addition to ESC
" i for insert mode, ii for exit insert
inoremap ii <ESC>l

" Buffer navigation
" buffer next, previous, ONLY in normal mode 
nnoremap <C-j> :bn!<CR>
nnoremap <C-k> :bp!<CR>
" delete buffer
nnoremap <C-d> :bd<CR>

" CtrlP, best general plugin since sliced bread. 
" Recent files
nnoremap <leader>r <ESC>:CtrlPMRU<CR>
" Project list
nnoremap <leader>p <ESC>:CtrlP<CR>
" Buffer list
nnoremap <leader>b <ESC>:CtrlPBuffer<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" formatting "
" """"""""""""
nnoremap <leader>f gwap
