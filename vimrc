
" 
" For some cases 
"

set number              
set splitbelow          
set mouse=a      


set tabstop=2       
set shiftwidth=2    
set expandtab       
set softtabstop=2   


let g:netrw_liststyle = 3
let g:netrw_banner = 0   
let g:netrw_winsize = 25 
let mapleader = " "

" Default terminal plugin
nnoremap <leader>t :belowright terminal ++rows=10 bash<CR>
" Default file manager
nnoremap <leader>n :Lexplore<CR>

" Buffer navigations
nnoremap < :bprev<CR>
nnoremap > :bnext<CR>

" Install Vimplug
let data_dir = expand('~/.vim')
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install Pluggins
call plug#begin('~/.vim/plugged')
  " LSP
  Plug 'prabirshrestha/vim-lsp' 
  Plug 'mattn/vim-lsp-settings' 
  " Fuzzyfinder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Autocomplectoin
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  " Colorize
  Plug 'sheerun/vim-polyglot'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  " Plug 'vim-airline/vim-airline'
  Plug 'ap/vim-buftabline'
call plug#end()


" Buffers lines

set showtabline=2
let g:buftabline_numbers = 1 
let g:buftabline_indicators = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Auto Complection 
" autocmd! CompleteDone * if pumpvisible() == 0 | pclose | endif

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" LSP Enable 
" if executable('gopls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'gopls',
"         \ 'cmd': {server_info->['gopls']},
"         \ 'whitelist': ['go'],
"         \ })
"     autocmd BufWritePre *.go LspDocumentFormatSync 
" endif

" Bind key for LSP 
nnoremap gd :LspDefinition<cr>
nnoremap <leader>rn :LspRename<cr>
nnoremap K :LspHover<cr>
xnoremap <leader>ca :LspCodeAction<CR>

" FZF
nnoremap <leader><leader> <:Files<CR>
" nnoremap <leader> :Rg<CR>

" Enable Theme
syntax on
set termguicolors
colorscheme catppuccin_mocha
