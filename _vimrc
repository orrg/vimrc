" ---------------------------------------------------------------------------
" _vimrc
" ---------------------------------------------------------------------------

set nocompatible " disable vi compatibility for sake of usability
filetype plugin indent on

" Settings for the bundle manager: gmarik/vundle
set rtp+=$VIM/vimfiles/bundle/vundle
call vundle#rc('$VIM/vimfiles/bundle')

" ---------------------------------------------------------------------------
" editor setings
" ---------------------------------------------------------------------------

set sw=2                 " number of spaces for autoindent
set ts=2                 " number of spaces used for a tab
set softtabstop=2        " number of spaces a tab counts during editing
set smarttab             " use spaces instead of tabs at beginning of a line
set expandtab            " replace tab by space during insert
set autoindent           " Copy indent from last line when starting new line.
set backspace=indent,eol,start
set linebreak            " break wider lines at suitable characters
set breakat="\ !@*-+;:,./?"
set wrapmargin=0         " no wrap at the end of the line
set nostartofline        " Don't reposition cursor when moving around
set nowrap               " Do not wrap lines.
set encoding=utf-8       " Set the file encoding

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

set foldmethod=syntax    " Markers are used to specify folds.
set foldminlines=0       " Allow folding single lines
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

map <F2> :NERDTreeToggle<CR>
map <F4> :UndotreeToggle<CR>
map <F5> :CtrlP<CR>
map <F6> :CtrlPBuffer<CR>
map <F7> :CtrlPMRUFiles<CR>
map <F8> :CtrlPBookmarkDir<CR>
map <F9> :TagbarToggle<CR>

map <C-c> :bdelete<CR>
map <C-t> :tabnew<CR>
map <C-Tab> :tabnext<CR>
map <C-Left> :tabprevious<CR>
map <C-Right> :tabnext<CR>
map <M-Right> <C-W>w
map <M-Left> <C-W>W

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
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'ervandew/supertab'
Bundle 'mihaifm/vimpanel'
Bundle 'spolu/dwm.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'mbbill/undotree'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
" file type bundles
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'plasticboy/vim-markdown'
Bundle 'aklt/plantuml-syntax'
Bundle 'digitaltoad/vim-jade'
Bundle 'derekwyatt/vim-scala'
Bundle 'groenewege/vim-less'
" color scheme bundles
Bundle 'nanotech/jellybeans.vim'
Bundle 'tomasr/molokai'
Bundle 'zeis/vim-kolor'
Bundle 'genadyp/atelier_colors'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'vim-scripts/wombat256.vim'

colorscheme molokai
syntax on " enable syntax hilighing

" ---------------------------------------------------------------------------
" plugin specific settings
" ---------------------------------------------------------------------------

" Tagbar settings
let g:tagbar_autoclose = 1

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

" Abbreviations for the Vimpanel plugin
cabbrev vp Vimpanel
cabbrev vl VimpanelLoad
cabbrev vc VimpanelCreate
cabbrev ve VimpanelEdit
cabbrev vr VimpanelRefresh

" ---------------------------------------------------------------------------
" filetype specific settings
" ---------------------------------------------------------------------------

" scala files
au BufRead,BufNewFile *.scala set shiftwidth=2
au BufRead,BufNewFile *.scala set textwidth=78
au BufRead,BufNewFile *.scala set ft=scala

" java files
au BufRead,BufNewFile *.java set shiftwidth=4
au BufRead,BufNewFile *.java set textwidth=78

" text files
au BufRead,BufNewFile *.txt set textwidth=78

" xml files
au BufRead,BufNewFile *.xml set shiftwidth=2
au BufRead,BufNewFile *.xml set textwidth=100

" markdown files
au BufRead,BufNewFile *.md set shiftwidth=2
au BufRead,BufNewFile *.md set textwidth=78
au BufRead,BufNewFile *.md set ft=markdown

" jade files
au BufRead,BufNewFile *.jade set shiftwidth=2
au BufRead,BufNewFile *.jade set textwidth=78
au BufRead,BufNewFile *.jade set ft=jade

" vimwiki files
au BufRead,BufNewFile *.wiki set shiftwidth=2
au BufRead,BufNewFile *.wiki set textwidth=78
au BufRead,BufNewFile *.wiki set ft=vimwiki

" plantuml files
au BufRead,BufNewFile *.plant set shiftwidth=2
au BufRead,BufNewFile *.plant set textwidth=78
au BufRead,BufNewFile *.plant set ft=plantuml

" ---------------------------------------------------------------------------
" EOF
" ---------------------------------------------------------------------------
