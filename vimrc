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
noremap l h
noremap ; l
noremap h ;

" Fast saving
map <Leader>w :w<CR>
imap <Leader>w <ESC>:w<CR>
vmap <Leader>w <ESC><ESC>:w<CR>

set background=dark
colorscheme solarized

execute pathogen#infect()

let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
set completeopt=longest,menuone

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
inoremap <expr><C-l>     neocomplete#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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


" Go

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'

au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)

let g:go_snippet_engine = "neosnippet"
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1

let g:go_auto_type_info = 0

let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" Use selection clipboard
" It is annoying
" set clipboard=unnamed



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


" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,/20,%,n~/.viminfo.go

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

