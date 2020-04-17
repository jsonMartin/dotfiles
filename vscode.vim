" Set Leader key to be space
let maplocalleader = ' '
let mapleader = ' '

" ------------------------------------------------------------
" PLUGINS BEGIN
" ------------------------------------------------------------
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'

" Syntastic
Plug 'vim-syntastic/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'asvetliakov/vim-easymotion' " Easymotion fork with VSCode fixes for Neovim plugin

Plug 'dkarter/bullets.vim' " Bullet points & number lists

" Peekaboo (shows content of registers when using "/@ in normal mode and CTRL-R in insert mode)
Plug 'junegunn/vim-peekaboo'

" Auto Pairs
Plug 'jiangmiao/auto-pairs' " https://github.com/jiangmiao/auto-pairs

" Ack
Plug 'mileszs/ack.vim' " For the :Ack command

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <Leader>/ <Plug>(incsearch-easymotion-/)
map <Leader>? <Plug>(incsearch-easymotion-?)
map <Leader>g/ <Plug>(incsearch-easymotion-stay)
map <Leader>. <Plug>(incsearch-fuzzy-/)
map <Leader>> <Plug>(incsearch-fuzzy-?)
map <Leader>g/ <Plug>(incsearch-fuzzy-stay)

call plug#end()
" ------------------------------------------------------------
" PLUGINS END
" ------------------------------------------------------------

let g:airline_powerline_fonts = 1 " For airline fonts
set bg=light
set mouse=a
set ignorecase
set smartcase
" "set nrformats= " Treat all number strings as decimals (to ignore octals etc)

"" Some basics:
	filetype plugin on
	set encoding=utf-8
	set number relativenumber
"" Enable autocompletion:
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
 	set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
	" map <C-h> <C-w>h
	" map <C-j> <C-w>j
	" map <C-k> <C-w>k
	" map <C-l> <C-w>l

" Check file in shellcheck:
	map <leader><leader>s :!clear && shellcheck %<CR>

" Automatically deletes all trailing whitespace on save.
 	autocmd BufWritePre * %s/\s\+$//e

" Shades of Purple Theme
if (has("termguicolors"))
 set termguicolors
endif

" Correct RGB escape codes for vim inside tmux
if !has('nvim') && $TERM ==# 'screen-256color'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax enable
colorscheme shades_of_purple " Other options: dracula
let g:shades_of_purple_airline=1
let g:airline_theme='shades_of_purple'

" Folds
" Start out with all folds expanded
set foldlevelstart=0
set foldlevel=0
" Folding Colors
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" Rebind F1 to open the menu similar to VSCode
nmap <F1> :
" nmap <F2> :set paste!<CR>
" nmap <C-b> <C-v>

" FZF bindings
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Easymotion binding
" nmap <space> <Plug>(easymotion-jumptoanywhere) " This always runs on space press, commenting out since rebinding leader to space
" nmap <Space> <Plug>(easymotion-jumptoanywhere)
" vmap <Space> <Plug>(easymotion-jumptoanywhere)
map <Leader> <Plug>(easymotion-prefix)

map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>F <Plug>(easymotion-overwin-f)
nmap <Leader>S <Plug>(easymotion-overwin-f2)
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
nmap <Leader>W <Plug>(easymotion-overwin-w)
nmap \| <Plug>(easymotion-overwin-w)
nmap <Leader>: <Plug>(easymotion-overwin-w)
vmap <Leader>: <Plug>(easymotion-overwin-w)

nmap <Leader>? <Plug>(easymotion-overwin-w)
vmap <Leader>? <Plug>(easymotion-overwin-w)
nmap <Leader>; <Plug>(easymotion-jumptoanywhere)
nmap <Leader>; <Plug>(easymotion-jumptoanywhere)
vmap \ <Plug>(easymotion-jumptoanywhere)
nmap \ <Plug>(easymotion-jumptoanywhere)
" nmap <Leader>j <Leader><Leader>j
" nmap <Leader>k <Leader><Leader>k
nmap <Leader>b <Plug>(easymotion-bd-w)
nmap <Leader>e <Plug>(easymotion-bd-e)
nmap <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>f <Leader><Leader>s
" nmap <Leader>s <Leader><Leader>s
" nmap <Leader>t <Leader><Leader>t
" nmap <Leader>2t <Plug>(easymotion-t2)
" nmap <Leader><Leader>2t <Plug>(easymotion-t2)
" nmap <Leader>2s <Plug>(easymotion-s2)
" nmap <Leader><Leader>2s <Plug>(easymotion-s2)
" nmap <Leader><Leader><Leader>bde <Plug>(easymotion-bd-e)
" nmap <Leader>G <Plug>(easymotion-bd-jk)
" nmap <Leader>g <Plug>(easymotion-bd-jk)
" nmap <Leader>n <Plug>(easymotion-bd-n)

" vmap <Leader>/ <Plug>(easymotion-jumptoanywhere)
" " vmap <Backspace> <Plug>(easymotion-jumptoanywhere)
" vmap <Leader>/ <Plug>(easymotion-jumptoanywhere)
" vmap <Leader>j <Leader><Leader>j
" vmap <Leader>k <Leader><Leader>k
" vmap <Leader><Leader><Leader>bdb <Plug>(easymotion-bd-w)
" vmap <Leader><Leader><Leader>bde <Plug>(easymotion-bd-e)
" vmap <Leader><Leader><Leader>bdw <Plug>(easymotion-bd-w)
vmap <Leader>b <Plug>(easymotion-bd-w)
vmap <Leader>e <Plug>(easymotion-bd-e)
vmap <Leader>w <Plug>(easymotion-bd-w)
" vmap <Leader>f <Leader><Leader>s
" vmap <Leader>s <Leader><Leader>s
" vmap <Leader>t <Leader><Leader>t
" vmap <Leader>2t <Plug>(easymotion-t2)
" vmap <Leader><Leader>2t <Plug>(easymotion-t2)
" vmap <Leader>2s <Plug>(easymotion-s2)
" vmap <Leader><Leader>2s <Plug>(easymotion-s2)
" vmap <Leader><Leader><Leader>bde <Plug>(easymotion-bd-e)
" vmap <Leader>G <Plug>(easymotion-bd-jk)
" vmap <Leader>g <Plug>(easymotion-bd-jk)
" vmap <Leader>n <Plug>(easymotion-bd-n)

" Makes VI toggle paste mode during paste
set pastetoggle=<f3>
set showcmd " Shows command that is being typed

" Settings for syntax highlighter
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:airline_section_x = '%{zoom#statusline()} %3*%y%*'

""""""""""""""""""""""""""""""
"" KEYBINDINGS
""""""""""""""""""""""""""""""
nnoremap <M-s> <esc>:w<cr>                 " save files
inoremap <M-s> :w<cr>
nnoremap <M-w> <esc>:q<cr>               " close current file
inoremap <M-w> :q<cr>
nnoremap <M-q> <esc>:qa<cr>               " quit all
inoremap <M-q> :qa<cr>
inoremap <M-f> <esc>:PrettierAsync<cr>
nnoremap <M-f> :PrettierAsync<cr>

nmap <F5> <esc>:Git <cr>
imap <F5> :Git <cr>
nmap <F6> <esc>:Git blame <cr>
imap <F6> :Git blame <cr>

" Splits
nmap <Leader>\ :vsp<cr>
vmap <Leader>\ <esc>:vsp<cr>
nmap <Leader>- <esc>:sp<cr>
vmap <Leader>- :sp<cr>
set splitbelow
set splitright

"  Command replacement, replaces the semicolon command for f/F/t/T commands (but I hardly use these)
" Add new binding for command mode (Using Enter instead of rebinding semicolon)
nmap <CR> :
vmap <CR> :
