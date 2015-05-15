" execute pathogen#infect()
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundles
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'bling/vim-airline'
Bundle 'ervandew/supertab'
Bundle 'fs111/pydoc.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'ajh17/Spacegray.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'python-rope/ropevim'
autocmd! bufwritepost ~/.vimrc source %

" default settings
set nocompatible " get rid of Vi compatibility mode. SET FIRST!
set t_Co=256 " enable 256-color mode.
set number " show line numbers
set laststatus=2 " last window always has a statusline
set nohlsearch " Don't continue to highlight searched phrases.
set incsearch " But do highlight as you type your search.
set ignorecase " Make searches case-insensitive.
set ruler " Always show info along bottom.
set tabstop=4 " tab spacing
set softtabstop=4 " unify
set shiftwidth=4 " indent/outdent by 4 columns
set shiftround " always indent/outdent to the nearest tabstop
set expandtab " use spaces instead of tabs
set smarttab " use tabs at the start of a line, spaces elsewhere
set nowrap " don't wrap text
set backspace=indent,eol,start
set cmdheight=2
set foldmethod=indent
set foldlevel=99

filetype on
filetype plugin indent on

syntax enable " enable syntax highlighting (previously syntax on).

" GUI Settings
set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L "remove left-hand scroll bar

set guifont=yancfont\ 12px

" Keybindings
set pastetoggle=<F2>

map <F8> :bnext<CR>
map <F7> :bprev<CR>
map <F9> :tabprevious<CR>
map <F10> :tabnext<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" thanks to soapsurfer and bastelfreak for this little line :)
cmap w!! w !sudo tee > /dev/null %

" COLORSCHEMES
colorscheme spacegray

" NERDTree Configuration
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
let python_highlight_all = 1

" pep8
let g:pep8_map='<leader>8'

" codecompletition for python
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Airline Stuff
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1

" Syntastics Stuff
let g:syntastic_python_python_exec = '/usr/bin/python3'

" NERDCommenter Stuff
nmap <F4> :AuthorInfoDetect<cr>
let g:vimrc_author='Sebastian Rakel'
let g:vimrc_email='sebastian@devunit.eu'
let g:vimrc_homepage='https://sebastianrakel.de'

" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Python Virtuelenvs
py << EOF
import os.path
import sys
import vim
if 'venv' in os.environ:
    project_base_dir = os.environ['venv']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
