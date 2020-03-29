set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CPP
Plugin 'derekwyatt/vim-fswitch'
" Haskell
Plugin 'neovimhaskell/haskell-vim'
Plugin 'bitc/vim-hdevtools'
" Git
Plugin 'tpope/vim-fugitive'
" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'timonv/vim-cargo'
"racer Plugin 'racer-rust/vim-racer'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Markdown
Plugin 'lvht/tagbar-markdown'
" General
" Plugin 'vim-syntastic/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'BarretRen/vim-colorscheme'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'mantiz/vim-plugin-dirsettings'
Plugin 'scrooloose/nerdtree'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'dense-analysis/ale' "Linting with Language Server Protocol

call vundle#end()            " required
call dirsettings#Install()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

nmap ; :
let mapleader = ","
set tabstop=4
set shiftwidth=4
set expandtab
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>g :TagbarToggle<CR>:TagbarTogglePause<CR>
set textwidth=80
set colorcolumn=+1
set background=light
set t_Co=256
colorscheme PaperColor

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Windows
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" Haskell:
au FileType haskell nnoremap <buffer> <Leader>t :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsInfo<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsClear<CR>

" Searching
noremap <Leader>a :Ack! <cword><cr>

" Rust
" Remove trailing whitespace when saving a file
autocmd BufWritePre *.rs :%s/\s\+$//e
au FileType rust nnoremap <Leader>m :make build<CR>
"racer let g:racer_cmd = "/home/glon/.cargo/bin/racer"
"racer au FileType rust nmap <leader>d <Plug>(rust-def)
"racer au FileType rust nmap <leader>e <Plug>(rust-doc)

" COC
nmap <silent> gd <Plug>(coc-definition)
inoremap <silent><expr> <c-space> coc#refresh()
set updatetime=300
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" FSwitch
map <leader>f :FSSplitLeft<CR>

" AsyncRun
let g:asyncrun_open = 0

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

autocmd BufNewFile,BufRead *.md,*.pmd set syntax=markdown
