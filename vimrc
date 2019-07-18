" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set shiftwidth=4
set tabstop=4
" Make backspace behave in a sane manner.
set backspace=indent,eol,start
set encoding=utf-8

" Indenting
set autoindent
set smartindent

" Searching
set showmatch
set incsearch
set hlsearch

" Execute .vimrc inside work dirs
set exrc
set secure

" Save on make
set autowrite


" Highlight 80 comlumn
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray


" Relative line numbers
set relativenumber


set undofile
set undodir=~/.vim/undodir



" Enable ftpugin
filetype plugin on
" Enable language specific indenting 
filetype plugin indent on

" Switch syntax highlighting on
syntax on
" Set leader
let mapleader = ","
" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers
set number
" Highlight cursorline
set cursorline
set mouse=a
set scrolloff=5

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Remap jkl; to down-up-left-right
"noremap l h
"noremap ; l
"noremap h ;

" Fast saving
map <Leader>w :w<CR>
imap <Leader>w <ESC>:w<CR>
vmap <Leader>w <ESC><ESC>:w<CR>

set background=dark
colorscheme solarized

execute pathogen#infect()


" For conceal markers
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

autocmd BufNewFile,BufRead /home/kubuxu/notes/* set syntax=markdown
autocmd FileType c,cpp,java,php,sh autocmd BufWritePre <buffer> :%s/\s\+$//e

" Show airline
set laststatus=2

" Populate powerline cache
let g:airline_powerline_fonts = 1
set showcmd
set conceallevel=0

nmap <leader>T :TagbarToggle<CR>
nnoremap <silent> <leader>o o<Esc>
nnoremap <silent> <leader>O O<Esc>

" Completion
let g:neopairs#enable = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:UltiSnipsExpandTrigger="<C-y>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"

"let g:ulti_expand_or_jump_res = 0 "default value, just set once
"function! Ulti_ExpandOrJump_and_getRes()
	"call UltiSnips#ExpandSnippetOrJump()
	"return g:ulti_expand_or_jump_res
"endfunction

"set completeopt+=noselect
inoremap <expr> <C-k> pumvisible() ? "\<C-y>" : "\<C-k>"

"call deoplete#custom#option({
"			\ 'auto_refresh_delay': 10,
"			\ 'camel_case': v:true,
"			\ 'skip_multibyte': v:true,
"			\ 'prev_completion_mode': 'filter',
"			\ 'min_pattern_length': 1,
"			\ 'max_list': 10000,
"			\ 'skip_chars': ['(', ')', '<', '>'],
"			\ })
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])
" don't use V. Because then neopairs doesn't work
"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
call deoplete#custom#var('omni', 'input_patterns', {
			\        'go': '[^. *\t]\.\w*',
			\})


au InsertLeave * if pumvisible() == 0 | pclose | endif

" Go
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>l <Plug>(go-metalinter)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)

let g:go_snippet_engine = "ultisnips"
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1

let g:go_auto_type_info = 0

let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_command = "golangci-lint"
let g:go_info_mode = "gopls"
let g:go_def_mode = "gopls"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" Use selection clipboard
" It is annoying
" set clipboard=unnamed


if &diff
  highlight! link DiffText Search
endif

" disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap jj <esc>
nnoremap JJJJ <nop>
map <silent> <leader><cr> :noh<cr>

" vim-ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
map <leader>a :Ack<space>


" set tags+=~/.vim/tags/cpp
" set tags+=~/.vim/tags/boost
" map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" When swiching buffer to named file, first use open buffer
" then try some tab and if it doesn't work open a new tab.
set switchbuf=useopen,usetab,newtab
" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,/20,%,n~/.viminfo.go

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Define what to save with :mksession
" blank - empty windows
" buffers - all buffers not only ones in a window
" curdir - the current directory
" folds - including manually created ones
" help - the help window
" options - all options and mapping
" winsize - window sizes
" tabpages - all tab pages
set sessionoptions=blank,buffers,curdir,folds,help,options,winsize,tabpages

source ~/.regexlist.vim

