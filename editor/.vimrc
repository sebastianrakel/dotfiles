set nocompatible " get rid of Vi compatibility mode. SET FIRST!

set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
NeoBundle 'Shougo/neocomplete'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ajh17/Spacegray.vim'
NeoBundle 'lsdr/monokai'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'chriskempson/base16-vim'

call neobundle#end()

NeoBundleCheck

autocmd! bufwritepost ~/.vimrc source %

" default settings
set clipboard=unnamed
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

" GUI Settings
set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L "remove left-hand scroll bar
set guifont=yancfont\ 12px

let base16colorspace=256

filetype on
filetype plugin indent on


map ,f :set foldmethod=indent<cr>zM<cr>
map ,F :set foldmethod=manual<cr>zR<cr>

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
" colorscheme spacegray
" colorscheme monokai
syntax enable " enable syntax highlighting (previously syntax on).

" NERDTree Configuration
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

" NERDCommenter Stuff
nmap <F4> :AuthorInfoDetect<cr>
let g:vimrc_author='Sebastian Rakel'
let g:vimrc_email='sebastian@devunit.eu'
let g:vimrc_homepage='https://sebastianrakel.de'

" Airline Stuff
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1

" Syntastics Stuff
let g:syntastic_python_python_exec = '/usr/bin/python3'

" NeoComplete Stuff
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Set FileType
au BufRead,BufNewFile *.pp   setfiletype puppet

" autocomplete stuff
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
        \   if &omnifunc == "" |
        \       setlocal omnifunc=syntaxcomplete#Complete |
        \   endif
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endif

" Puppetfiles
autocmd FileType puppet
    \   setlocal tabstop=2 softtabstop=2 shiftwidth=2
