
" vim-plug
	call plug#begin('~/.config/nvim/plugged')
	" Vim Tools
	Plug 'scrooloose/nerdtree'
	Plug 'junegunn/goyo.vim'
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --ts-completer' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'flazz/vim-colorschemes'
	Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
	" Language Tools
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'pangloss/vim-javascript'
	Plug 'sheerun/vim-polyglot'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	" Formatting
	Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
	call plug#end()

" Plugin Options
	let g:airline_theme='minimalist'
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	let g:UltiSnipsSnippetDir='~/.vim/ultisnips'
	let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
	let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

	let g:javascript_plugin_jsdoc = 1

	let g:prettier#autoformat = 0
	autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.md,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync
	let g:prettier#config#print_width = 80
	let g:prettier#config#tab_width = 2
	let g:prettier#config#use_tabs = 'false'
	let g:prettier#config#semi = 'false'
	let g:prettier#config#single_quote = 'true'
	let g:prettier#config#bracket_spacing = 'true'
	let g:prettier#config#jsx_bracket_same_line = 'false'
	let g:prettier#config#arrow_parens = 'always'
	let g:prettier#config#trailing_comma = 'all'

" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	highlight EndOfBuffer ctermfg=black ctermbg=black
	colorscheme darkglass
	autocmd filetype crontab setlocal nobackup nowritebackup
	autocmd FileType markdown setlocal expandtab

" don't use arrowkeys
	noremap <Up> <NOP>
	noremap <Down> <NOP>
	noremap <Left> <NOP>
	noremap <Right> <NOP>

" really, just don't
	inoremap <Up>    <NOP>
	inoremap <Down>  <NOP>
	inoremap <Left>  <NOP>
	inoremap <Right> <NOP>

" tab sizing
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2

"colorscheme wal
	set encoding=utf-8
	set number
	set relativenumber


" Pandoc compiles
	map <F1> :silent ! md2pdf % &<CR>
	map <F2> :silent ! md2slides % &<CR>

" Reset
	map <F4> :e<CR> :pc<CR>
	map <F5> :noh<CR>

" Spell-check set to F6:
	map <F6> :setlocal spell! spelllang=en_us<CR>
	inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Bind for markdown lists and big tables
  map <F7> <esc>I<!-- prettier-ignore-start --><CR><!-- prettier-ignore-end --><CR><esc>kkA

" NERDTree
	let NERDTreeShowHidden=1
	map <silent> <F9> :NERDTreeToggle<CR>

	let g:NERDTreeQuitOnOpen=1

" Goyo plugin makes text more readable when writing prose:
	map <F10> :Goyo<CR>
	inoremap <F10> <esc>:Goyo<CR>a

" Enable autocompletion:
	set wildmode=longest,list,full
	set wildmenu

" Automatically deletes all tralling whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Force .md filetype
	au BufReadPost *.md set filetype=markdown

" Use urlview to choose and open a url:
	:noremap <leader>u :w<Home>silent <End> !urlview<CR>

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" C-T for new tab
	nnoremap <C-t> :tabnew<cr>

" Navigating with guides
	inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
	map <leader><Tab> <Esc>/<++><Enter>"_c4l
	inoremap ;gui <++>

" For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
	inoremap jw <Esc>
	inoremap wj <Esc>

"Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

"Replace all is aliased to S. Visual mode shortcut doesn't work yet for some
"reason...
	nnoremap S :%s//g<Left><Left>
	vnoremap S noop
	vnoremap S :s//g<Left><Left>

