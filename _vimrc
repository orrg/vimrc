" ---------------------------------------------------------------------------
" _vimrc
" ---------------------------------------------------------------------------

set nocompatible " disable vi compatibility for sake of usability
set encoding=utf-8

" Settings for the bundle manager: gmarik/vundle
set rtp+=$VIM/vimfiles/bundle/vundle
call vundle#rc('$VIM/vimfiles/bundle')

" ---------------------------------------------------------------------------
" editor setings
" ---------------------------------------------------------------------------

set sw=2                 " number of spaces for autoindent
set ts=2                 " number of spaces used for a tab
set tw=78                " the textwidth
set softtabstop=2        " number of spaces a tab counts during editing
set smarttab             " use spaces instead of tabs at beginning of a line
set expandtab            " replace tab by space during insert
set autoindent smartindent " 
set backspace=indent,eol,start
set linebreak            " break wider lines at suitable characters
set breakat="\ !@*-+;:,./?"
set wrapmargin=0         " no wrap at the end of the line
set nostartofline        " Don't reposition cursor when moving around
set nowrap               " Do not wrap lines.

set title                " Show the filename in the window titlebar.
set mouse=a              " Enable moouse in all in all modes.
set history=1000         " keep 1000 lines of command line history
set hidden               " Undo history and marks for buffers brought to front
set shortmess=atI        " Disable intro message
set esckeys              " Allow cursor keys in insert mode.
set nu                   " Enable line numbers.

set hlsearch             " hilights matching search patterns
set incsearch            " find matches while typing the search
set wrapscan             " roll-over while searching
set ignorecase           " search is not case-sensitive
set smartcase            " unless there is a upper-case in the search
set showmatch
set matchtime=3          " duration for showing matches
set magic                " Enable extended regexes.

set helpheight=25        " height of the help window, 9999 = fullscreen
set ch=1                 " Make command line two lines high
set mousehide            " Hide the mouse when typing text
set showmode             " shows edit mode
set ruler                " shows ruler
set cursorline           " Highlight current line
set showtabline=2        " Always show the tab bar
set rulerformat=%-14.(%l,%c%V%)\ %P 
set laststatus=2         " always show the statusbar
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%]
set noerrorbells         " no bell on errors
set visualbell           " no beep just flash
set ttyfast              " indicates a fast terminal connection
set ls=2                 " show filename
set scrolloff=3          " Start scrolling 3 lines before horizontal border
set sidescrolloff=3      " Start scrolling 3 columns before vertical border
set winminheight=0       "Allow splits to be reduced to a single line.
set wildchar=<TAB>       " Character for CLI expansion (TAB-completion).
set wildmenu             " Shows possible completions above cmd line
set wildmode=list:longest " Complete only until point of ambiguity.

set completeopt+=preview

set diffopt=filler       " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite      " Ignore whitespace changes (focus on code changes)

set foldmethod=manual    " Markers are used to specify folds.
set foldminlines=1       " Allow folding single lines
set foldnestmax=3        " Set max fold nesting level

set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words

set tags=tags;/

" ---------------------------------------------------------------------------
" keyboard settings
" ---------------------------------------------------------------------------

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :CtrlPSmartTabs<CR>
nnoremap <F4> :UndotreeToggle<CR>
nnoremap <F5> :CtrlP<CR>
nnoremap <F6> :CtrlPBuffer<CR>
nnoremap <F7> :CtrlPMRUFiles<CR>
nnoremap <F8> :CtrlPBookmarkDir<CR>
nnoremap <F9> :TagbarToggle<CR>

nnoremap <C-t> :tabnew<CR>
nnoremap <C-Tab> :tabnext<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <M-Right> <C-W>w
nnoremap <M-Left> <C-W>W
nnoremap <C-n> :bnext<CR>

" ---------------------------------------------------------------------------
" platform specific settings
" ---------------------------------------------------------------------------

if has ("win32")
  set backupdir=$USERPROFILE/.vim/backup
  set directory=$USERPROFILE/.vim/swap
  set undodir=$USERPROFILE/.vim/undo
endif

if has ("unix")
  set backupdir=~/.vim/backup
  set directory=~/.vim/swap
  set undodir=~/.vim/undo
endif

if !has ("gui")
  syntax off
endif

" Set the title bar to something meaningful
if has('title') && (has('gui_running') || &title)
  set titlestring=
  set titlestring+=%f\ " file name
  " append file attributes
  set titlestring+=%h%m%r%w
  " append program name
  set titlestring+=\ -\ %{v:progname}
  " append working directory
  set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif

" ---------------------------------------------------------------------------
" Provide vundle with the required plugins
" ---------------------------------------------------------------------------

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/emmet-vim'
Bundle 'mattn/webapi-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'mbbill/undotree'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'DavidEGx/ctrlp-smarttabs'
Bundle 'scrooloose/nerdtree'
Bundle 'Keithbsmiley/investigate.vim'
Bundle 'pydave/AsyncCommand'
Bundle 'ap/vim-buftabline'
" file type bundles
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'plasticboy/vim-markdown'
Bundle 'aklt/plantuml-syntax'
Bundle 'digitaltoad/vim-jade'
Bundle 'derekwyatt/vim-scala'
Bundle 'groenewege/vim-less'
Bundle 'skammer/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-jdaddy'
Bundle 'chrisbra/csv.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leafgarland/typescript-vim'
Bundle 'jason0x43/vim-js-indent'
Bundle 'jimenezrick/vimerl'
" color scheme bundles
Bundle 'noahfrederick/vim-noctu'
Bundle 'noahfrederick/vim-hemisu'
Bundle 'vim-scripts/apprentice.vim'
Bundle 'vim-scripts/darknight256.vim'
Bundle 'vim-scripts/mrkn256.vim'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'goatslacker/mango.vim'
Bundle 'gosukiwi/vim-atom-dark'
Bundle 'croaker/mustang-vim'

set t_Co=256
if has ("gui_running")
  set background=dark
  colorscheme atom-dark
else
  set background=dark
  colorscheme apprentice
endif
syntax on " enable syntax hilighting
filetype plugin indent on

" ---------------------------------------------------------------------------
" plugin specific settings
" ---------------------------------------------------------------------------

" Tagbar settings
let g:tagbar_autoclose = 1
let g:tagbar_usearrows = 1

" NERDTree settings
let g:NERDTreeQuitOnOpen = 1

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts =
      \ ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence =
      \ ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery =
      \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabCrMapping = 1
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

" Ctrl-P settings
if has('win32')
  let g:ctrlp_cache_dir = "$USERPROFILE/.vim/ctrlp_cache/"
else
  let g:ctrlp_cache_dir = "$HOME/.vim/ctrlp_cache/"
endif

" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand("$USERPROFILE/.vim/snippets/orrg-snippets.json")), "\n"))

" ---------------------------------------------------------------------------
" filetype specific settings
" ---------------------------------------------------------------------------
augroup filetypedetect
  au! BufRead, BufNewFile *.csv,*.dat setfiletype csv
  au! BufRead, BufNewFile *.scala,*.sbt setfiletype scala
  au! BufRead, BufNewFile *.java,*.groovy setfiletype java
  au! BufRead, BufNewFile *.md setfiletype markdown
  au! BufRead, BufNewFile *.jade setfiletype jade
  au! BufRead, BufNewFile *.plant setfiletype plantuml
  au! BufRead, BufNewFile *.text,*.txt setfiletype text
augroup END

" ---------------------------------------------------------------------------
" EOF
" ---------------------------------------------------------------------------
