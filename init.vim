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
Plug 'tpope/vim-fugitive'
Plug 'dkarter/bullets.vim' " Bullet points & number lists
Plug 'junegunn/vim-peekaboo' " Peekaboo (shows content of registers when using \"/@ in normal mode and CTRL-R in insert mode)

if exists('g:vscode')
	Plug 'asvetliakov/vim-easymotion', { 'as': 'asvetliakov_vim-easymotion' }
	set clipboard=unnamedplus
else
	Plug 'easymotion/vim-easymotion', { 'as': 'normal_easy_motion' }

	" VIM Icons
	Plug 'ryanoasis/vim-devicons'

	" Nerdtree
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'scrooloose/nerdcommenter'
	let g:NERDTreeMapOpenVSplit = '\'
	let g:NERDTreeMapOpenSplit = '-'
	let NERDTreeShowHidden=1

	" Add colors for the hightlighting plugin
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	let g:NERDTreeFileExtensionHighlightFullName = 1
	let g:NERDTreeExactMatchHighlightFullName = 1
	let g:NERDTreePatternMatchHighlightFullName = 1

	Plug 'airblade/vim-gitgutter'
	Plug 'prettier/vim-prettier', { 'do': 'yarn install' }


	Plug 'jreybert/vimagit'
	Plug 'tpope/vim-commentary'

	" Syntastic
	Plug 'vim-syntastic/syntastic'
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0


	" Airline (bottom stats tab)
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" FZF
	Plug 'junegunn/fzf', { 'do': './install --bin' }
	Plug 'junegunn/fzf.vim'

	Plug 'Rigellute/shades-of-purple.vim' " Color Theme; Plug 'dracula/vim'

	Plug 'mbbill/undotree'


	" Ctrl-Space (instead of Ctrl-P)
	" Plug 'vim-ctrlspace/vim-ctrlspace'
	" let g:CtrlSpaceDefaultMappingKey = '<C-p> '
	" set nocompatible
	" set hidden

	" Ctrl-P
	Plug 'ctrlpvim/ctrlp.vim'
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP' "'CtrlPMixed'

	" Auto Pairs
	Plug 'jiangmiao/auto-pairs' " https://github.com/jiangmiao/auto-pairs

	" Ack
	Plug 'mileszs/ack.vim' " For the :Ack command

	" Autocompletion
	Plug 'zxqfl/tabnine-vim'
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" TMUX like zooming
	Plug 'dhruvasagar/vim-zoom'
	nmap <Leader>z <Plug>(zoom-toggle)
	vmap <Leader>z <Plug>(zoom-toggle)

	" TMUX improvements, including Allow Navigating between TMUX and VIM panes
	Plug 'tmux-plugins/vim-tmux-focus-events'
	Plug 'roxma/vim-tmux-clipboard'
	Plug 'christoomey/vim-tmux-navigator'
	let g:tmux_navigator_no_mappings = 1
	nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
	nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
	nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
	nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
	nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
	" The below mappings don't work so well in Visual Mode
	" vnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
	" vnoremap <silent> <C-j> :TmuxNavigateDown<cr>
	" vnoremap <silent> <C-k> :TmuxNavigateUp<cr>
	" vnoremap <silent> <C-l> :TmuxNavigateRight<cr>
	" vnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
	let g:tmux_navigator_disable_when_zoomed = 1

	" Allow for session saving
	Plug 'tpope/vim-obsession'

	" Javascript plugin
	Plug 'pangloss/vim-javascript'

	" Plug 'vim-scripts/nextval'
	" nmap <silent> <unique> = <Plug>nextvalInc
	" nmap <silent> <unique> - <Plug>nextvalDec

	Plug 'haya14busa/incsearch.vim'
	Plug 'haya14busa/incsearch-easymotion.vim'
	Plug 'haya14busa/incsearch-fuzzy.vim'
	map /  <Plug>(incsearch-forward)
	map ?  <Plug>(incsearch-backward)
	map g/ <Plug>(incsearch-stay
	map <Leader>/ <Plug>(incsearch-easymotion-/)
	map <Leader>? <Plug>(incsearch-easymotion-?)
	map <Leader>g/ <Plug>(incsearch-easymotion-stay)
	map <Leader>. <Plug>(incsearch-fuzzy-/)
	map <Leader>> <Plug>(incsearch-fuzzy-?)
	map <Leader>g/ <Plug>(incsearch-fuzzy-stay)

endif
call plug#end()

" Plug 'junegunn/goyo.vim'
" Plug 'vimwiki/vimwiki'
" Plug 'vifm/vifm.vim'

" ------------------------------------------------------------
" PLUGINS END
" ------------------------------------------------------------

"""""""""""""""""""""""""""""""
"" SHARED KEYBINDINGS
""""""""""""""""""""""""""""""
nnoremap <M-s> <esc>:w<cr>                 " save files
inoremap <M-s> :w<cr>
nnoremap <M-w> <esc>:q<cr>               " close current file
inoremap <M-w> :q<cr>
nnoremap <M-q> <esc>:qa<cr>               " quit all
inoremap <M-q> :qa<cr>
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
" Easymotion binding
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
nmap <Leader>b <Plug>(easymotion-bd-w)
nmap <Leader>e <Plug>(easymotion-bd-e)
nmap <Leader>w <Plug>(easymotion-bd-w)
vmap <Leader>b <Plug>(easymotion-bd-w)
vmap <Leader>e <Plug>(easymotion-bd-e)
vmap <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>u :UndotreeToggle<cr>

if exists('g:vscode')
	xmap gc  <Plug>VSCodeCommentary
	nmap gc  <Plug>VSCodeCommentary
	omap gc  <Plug>VSCodeCommentary
	nmap gcc <Plug>VSCodeCommentaryLine
else
	inoremap <M-f> <esc>:PrettierAsync<cr>
	nnoremap <M-f> :PrettierAsync<cr>

	nmap <F5> <esc>:Git <cr>
	imap <F5> :Git <cr>
	nmap <F6> <esc>:Git blame <cr>
	imap <F6> :Git blame <cr>

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

	" " Nerd tree
		map <leader>N :NERDTreeToggle<CR>
		map <C-\> :NERDTreeToggle<CR>
	"" 	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
	nmap <C-b> <C-v>

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

	" Makes VI toggle paste mode during paste
	set pastetoggle=<f3>
	set showcmd " Shows command that is being typed

	" Settings for syntax highlighter
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:airline_section_x = '%{zoom#statusline()} %3*%y%*'

	" Nerdtree configuration
	let g:NERDTreeIgnore = ['^node_modules$']
	vmap <C-/> <plug>NERDCommenterToggle
	nmap <C-_> <plug>NERDCommenterToggle

	" sync open file with NERDTree
	" This doesn't work currently
	" " Check if NERDTree is open or active

	" function! IsNERDTreeOpen()
	"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
	" endfunction

	" " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
	" " file, and we're not in vimdiff
	" function! SyncTree()
	"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
	"     NERDTreeFind
	"     wincmd p
	"   endif
	" endfunction

	" " Highlight currently open buffer in NERDTree
	" autocmd BufEnter * call SyncTree()


	""""""""""""""""""""""""""""""""""
	"" COC SETTINGS
	""""""""""""""""""""""""""""""""""
	nmap <F2> <Plug>(coc-rename)
	"" TextEdit might fail if hidden is not set.
	"set hidden

	"" Some servers have issues with backup files, see #649.
	"set nobackup
	"set nowritebackup

	"" Give more space for displaying messages.
	set cmdheight=1

	"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
	"" delays and poor user experience.
	"" Set updatetime to 100 also for GitGutter plugin
	set updatetime=100

	"" Don't pass messages to |ins-completion-menu|.
	set shortmess+=c

	"" Always show the signcolumn, otherwise it would shift the text each time
	"" diagnostics appear/become resolved.
	set signcolumn=yes

	"" Use tab for trigger completion with characters ahead and navigate.
	"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	"" other plugin before putting this into your config.
	inoremap <silent><expr> <TAB>
	      \ pumvisible() ? "\<C-n>" :
	      \ <SID>check_back_space() ? "\<TAB>" :
	      \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	"" Can't get the below working, but don't think I will need it..
	"" Use <c-space> to trigger completion.
	"" inoremap <silent><expr> <C-;> coc#refresh()
	"" "also tried: nmap <C-'> coc#refresh()

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	" position. Coc only does snippet and additional edit on confirm.
	if has('patch8.1.1068')
	  " Use `complete_info` if your (Neo)Vim version supports it.
	  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
	  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif

	" Use `[g` and `]g` to navigate diagnostics
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
	    execute 'h '.expand('<cword>')
	  else
	    call CocAction('doHover')
	  endif
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	" autocmd CursorHold * silent call CocActionAsync('highlight')

	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	" Formatting selected code.
	" xmap <leader>f  <Plug>(coc-format-selected)
	" nmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
	  autocmd!
	  " Setup formatexpr specified filetype(s).
	  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	  " Update signature help on jump placeholder.
	  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	" Applying codeAction to the selected region.
	" Example: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap keys for applying codeAction to the current line.
	nmap <leader>ac  <Plug>(coc-codeaction)
	" Apply AutoFix to problem on the current line.
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Introduce function text object
	" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
	xmap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap if <Plug>(coc-funcobj-i)
	omap af <Plug>(coc-funcobj-a)

	"" Use <TAB> for selections ranges.
	"" NOTE: Requires 'textDocument/selectionRange' support from the language server.
	"" coc-tsserver, coc-python are the examples of servers that support it.
	"nmap <silent> <TAB> <Plug>(coc-range-select)
	"xmap <silent> <TAB> <Plug>(coc-range-select)

	" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')

	" Add `:Fold` command to fold current buffer.
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" Add `:OR` command for organize imports of the current buffer.
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	" Add (Neo)Vim's native statusline support.
	" NOTE: Please see `:h coc-status` for integrations with external plugins that
	" provide custom statusline: lightline.vim, vim-airline.
	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

	"" Mappings using CoCList:
	"" Show all diagnostics.
	"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	"" Manage extensions.
	"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	"" Show commands.
	"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	"" Find symbol of current document.
	"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	"" Search workspace symbols.
	"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	"" Do default action for next item.
	"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	"" Do default action for previous item.
	"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	"" Resume latest coc list.
	"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
	"""""""""""""""""""

	"" Git Gutter configuration options
	let g:gitgutter_highlight_linenrs = 1 " Highlights new lines
	let g:gitgutter_preview_win_floating = 0
	let g:gitgutter_use_location_list = 1
	nmap ]h <Plug>(GitGutterNextHunk)
	nmap [h <Plug>(GitGutterPrevHunk)

	"" More prettier
	"let g:prettier#quickfix_enabled = 0
	"let g:prettier#quickfix_auto_focus = 0
	" prettier command for coc
	" command! -nargs=0 Prettier :CocCommand prettier.formatFile
	" run prettier on save
	" let g:prettier#autoformat = 1
	" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
	nmap <Leader>p <esc>:Prettier<cr>

	" Allow to run macros over visual selection
	xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

	function! ExecuteMacroOverVisualRange()
	  echo "@".getcmdline()
	  execute ":'<,'>normal @".nr2char(getchar())
	endfunction

endif

" Set tabs to be 4 spaces
set ts=4 sw=4

set diffopt+=vertical

" Persistant undo
set undofile
set undodir

" Set transparent bg color
hi Normal guibg=NONE ctermbg=NONE

nnoremap <C-a> ggVG


" Remap decrement number from Ctrl-x -> Ctrl-y
" nnoremap <C-y> <C-x>
" Remap increment number from Ctrl-a -> Ctrl-t
" nnoremap <C-t> <C-a>

" Improve incrementing/decrementing
function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
nmap <silent> <unique> - :call AddSubtract("\<C-x>", '')<CR>
nmap <silent> <unique> + :call AddSubtract("\<C-a>", '')<CR>

" nmap <silent> <unique> = :call AddSubtract("\<C-a>", '')<CR>
" nmap <silent> <unique> + :call AddSubtract("\<C-a>", 'b')<CR>
" nmap <silent> <unique> - :call AddSubtract("\<C-x>", '')<CR>
" nmap <silent> <unique> _ :call AddSubtract("\<C-x>", 'b')<CR>


" noremap +:call AddSubtract("\<C-a>", '')<CR>
" noremap -:call AddSubtract("\<C-x>", '')<CR>
" noremap <A-+>:call AddSubtract("\<C-a>", 'b')<CR>
" noremap <A-->:call AddSubtract("\<C-x>", 'b')<CR>

" nnoremap <silent> <Leader>:<C-u>call AddSubtract("\<C-a>", '')<CR>
" nnoremap <silent> <Leader>= :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
" nnoremap <Leader>=:<C-u>call AddSubtract("\<C-x>", '')<CR>
" nnoremap <silent> <Leader><C-y> :<C-u>call AddSubtract("\<C-x>", 'b')<CR>


" Automatically add yanked text to clipboard in WSL: https://waylonwalker.com/vim-wsl-clipboard/
" if system('uname -r') =~ "Microsoft"
"     augroup Yank
"         autocmd!
"         autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
"         augroup END
" endif

set clipboard=unnamedplus " default
if has('clipboard') || exists('g:vscode') " [1]
    let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point [2]
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
        augroup END
    endif
endif
