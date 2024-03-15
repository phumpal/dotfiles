set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'fholgado/minibufexpl.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-rhubarb'
Plugin 'mileszs/ack.vim'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-endwise'
Plugin 'airblade/vim-gitgutter'
Plugin 'ajh17/VimCompletesMe'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ngmy/vim-rubocop'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-pug'
Plugin 'groenewege/vim-less'
Plugin 'leafgarland/typescript-vim'
Plugin 'pearofducks/ansible-vim'
Plugin 'andrewstuart/vim-kubernetes'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" set autoread                    " reload files when changed on disk

"" Some sane defaults
set t_Co=256
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set nocursorline                " disable cursor line as it is very CPU-heavy, unfortunately
set number                      " show line numbers

set background=dark
colorscheme molokai

"" Whitespace
set nowrap                      " don't wrap lines
set scrolloff=3                 " show context above/below cursorline
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
" List chars
set list
set listchars=""                " Reset the listchars
set listchars=tab:\ \           " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.          " show trailing spaces as dots
set listchars+=extends:>        " The character to show in the last column when wrap is
                                " off and the line continues beyond the right of the screen
set listchars+=precedes:<       " The character to show in the first column when wrap is

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set exrc                        " enable per-directory .vimrc files
set secure                      " disable unsafe commands in local .vimrc files

set colorcolumn=80
hi ColorColumn ctermbg=234 guibg=#3E3D32


" move within 'displayed lines rather than 'physical' lines (for wordwrap)
noremap k gk
noremap j gj

" code folding
set foldmethod=indent
set foldlevelstart=20
nnoremap <Space> z

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

autocmd BufWritePre * %s/\s\+$//e
