"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Apperance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme default
set background=dark

"Column
if version >= 703
    set colorcolumn=79
endif

" Show raw numbers always
set number

" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" Don't redraw while executing macros (good performance config)
set lazyredraw

" How many tenths of a second to blink when matching brackets
set mat=2

" Show matching brackets when text indicator is over them
set showmatch

" Enable syntax highlighting
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Features 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set viminfo for fast restore on work
set viminfo='100,<50,s10,h
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
set autowrite

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Some defaults paths for search files
set path+=include/,,
set path+=src/,,

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 100 characters
set lbr
set tw=100

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"Files search 
"Keybindings for Fuzzyfinder
nnoremap <silent> <c-k> :FufFile **/<CR>

"ignore patterns for Fuzzyfinder
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|pyc|jpg|png|gif|svg)$|(^|[/\\])(\.(hg|git|bzr)|tmp)($|[/\\])'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Code review
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:CodeReviewer_reviewer='Maxim Kot<work.maydjin@gmail.com>'
let g:CodeReviewer_reviewFile='./review.rev'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:Powerline_symbols = 'fancy'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Haxe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"You'll need to define some patterns for ctags in order for it to work with Haxe. Put these lines in
"your .ctags file in your home directory:
"--langdef=haxe
"--langmap=haxe:.hx
"--regex-haxe=/^[ \t]*((@:?[a-zA-Z]+) )*((macro|private|public|static|inline) )*function[ \t]+([A-Za-z0-9_]+)/\5/f,function,functions/
"--regex-haxe=/^[ \t]*((@:?[a-zA-Z]+) )*((private|public|static|inline) )+var[ \t]+([A-Za-z0-9_]+)/\5/v,variable,variables/
"--regex-haxe=/^[ \t]*package[ \t]*([A-Za-z0-9_\.]+)/\1/p,package/
"--regex-haxe=/^[ \t]*((@:?[a-zA-Z]+) )*(extern[ \t]+)?class[ \t]+([A-Za-z0-9_]+)[ \t]*[^\{]*/\4/c,class,classes/
"--regex-haxe=/^[ \t]*((@:?[a-zA-Z]+) )*(extern[ \t]+)?interface[ \t]+([A-Za-z0-9_]+)/\4/i,interface/
"--regex-haxe=/^[ \t]*typedef[ \t]+([A-Za-z0-9_]+)/\1/t,typedef/
"--regex-haxe=/^[ \t]*enum[ \t]+([A-Za-z0-9_]+)/\1/e,enum/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_width = 44

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle 
"git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
syntax enable on " turn on syntax highlighting

" set the bundle root, and vundle directory
let root = '~/.vim/bundle'
let src = 'http://github.com/gmarik/vundle.git'
" clone vundle if it's missing
if !isdirectory(expand(root, 1).'/vundle')
    exec '!git clone '.src.' '.shellescape(expand(root.'/vundle', 1))
endif

" immediately make vundle accessible in the rtp
exec 'set rtp+='.root.'/vundle'

" initialise vundle's boot script
call vundle#rc(root)
filetype off " turn off filetype settings, which is required for vundle
"let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'jansenm/vim-cmake'
Bundle 'thinca/vim-ref'
Bundle 'majutsushi/tagbar'
Bundle 'wesleyche/SrcExpl'
Bundle 'jdonaldson/vaxe'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ruby.vim'
Bundle 'tpope/vim-rails'
Bundle 'DoxygenToolkit.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'xml.vim'
Bundle 'MatchTag'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'vimwiki/vimwiki'
Bundle 'tkztmk/vim-vala'
Bundle 'wdicarlo/vim-notebook'
Bundle 'CodeReviewer.vim'
Bundle 'Valloric/YouCompleteMe.git'

" Allow autoclose paired characters like [,] or (,),
" " and add smart cursor positioning inside it,
Bundle 'Raimondi/delimitMate'

"Snippets plugins
Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle "honza/vim-snippets"

"Fast search
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'vim-scripts/L9'

filetype plugin indent on " re-enable plugin settings
hi PmenuSel   ctermfg=White	   ctermbg=DarkBlue  guifg=White  guibg=DarkBlue
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
