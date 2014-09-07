execute pathogen#infect()

autocmd! bufwritepost ~/.vimrc source %

set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme desert        " set colorscheme
set number                " show line numbers
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set backspace=indent,eol,start
set cmdheight=2

filetype on
filetype plugin indent on

" Setting Colorscheme of Vim
"set background=dark

set pastetoggle=<F2>

" Keybindings
map <F8> :bnext<CR>
map <F7> :bprev<CR>
map <F9> :tabprevious<CR>
map <F10> :tabnext<CR>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"COLORSCHEMES
"colorscheme solarized
colorscheme jellybeans

" NERDTree Configuration
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

let python_highlight_all = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

" pep8
let g:pep8_map='<leader>8'

" codecompletition for python
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
