"===[ Basic Configuration ]=== 
" Turn on relative line numbers
set number relativenumber
" Enable filetype detection, plugins, and auto-indent
filetype plugin indent on
" Turn on syntax highlighting
syntax on
" Set tab configurations
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab
" Set tab completion functionality
set wildmode=longest,list,full
" Set mouse highlighting to copy to the 'a' register
set mouse=a
" Set search configurations
set ignorecase
set smartcase
set incsearch
set hlsearch
highlight       Search    ctermfg=White  ctermbg=Black  cterm=bold
highlight    IncSearch    ctermfg=White  ctermbg=Red    cterm=bold
" Configure vim to place backup files in a dedicated folder within the user's
" home directory. Creates the backup directory if it doesn't exist.
set backup
if !isdirectory($HOME."/.vim/backupdir")
    silent! execute "!mkdir -p ~/.vim/backupdir"
endif
set backupdir=~/.vim/backupdir
set noswapfile
" Set the window title to be the file name if applicable
set title
" Split configurations:
set fillchars+=vert:\│
set splitbelow splitright
" Set the colorscheme
colorscheme slate
" Set the colorscheme to be dark-background friendly
set background=dark
" Mute annoying bell sound in vim
set vb t_vb=



"===[ Keybinding Configuration ]===
" Set noh (clear search highlight) to F1
nnoremap <nowait><silent> <F1> :noh<CR>
" Set pastetoggle to F2
set pastetoggle=<F2>
" Set the split navigation bindings to be more natural
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Move lines up and down in Visual mode
vnoremap <silent> <s-J> :m '>+1<CR>gv
vnoremap <silent> <s-K> :m '<-2<CR>gv
" Indent selected lines in Visual mode
vnoremap > >gv 
vnoremap < <gv 



"===[ Plugin Configuration ]===
" Install vimplug if it doesn't exist
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Install plugins
call plug#begin()
Plug 'ap/vim-css-color'
Plug 'unblevable/quick-scope'
Plug 'itchyny/lightline.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Lightline configs:
" Make room for lightline
set laststatus=2
" Remove redundant mode under lightline
set noshowmode
