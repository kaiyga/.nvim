
" 
" For some cases 
"

" 
" Leader = Space button
"
" Explorer: ctrl+n 
" Terminal: ctrl+t 
" Buffers: Shift+< Shift+> 
" FZF: <leader><leader>
" Info: Shift+K 
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
nnoremap <C-n> :Lexplore<CR>

" Buffer navigations
nnoremap < :bprev<CR>
nnoremap > :bnext<CR>
nnoremap C :bd<CR>



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
  " Plug 'preservim/nerdtree'
  Plug 'lambdalisue/fern.vim'
call plug#end()

" let g:NERDTreeWinSize = 30
" nnoremap <C-n> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR> 


nnoremap <C-n> :Fern . -drawer -toggle<CR>

let g:fern#disable_default_mappings = 1

function! s:init_fern() abort
  silent! nunmap <buffer> a
  nmap <buffer> A <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> r <Plug>(fern-action-rename)
  nmap <buffer> y <Plug>(fern-action-copy)
  nmap <buffer> p <Plug>(fern-action-paste)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> <CR> <Plug>(fern-action-open-or-expand)
endfunction
augroup fern-custom
  autocmd!
  autocmd FileType fern call s:init_fern()
augroup END


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
