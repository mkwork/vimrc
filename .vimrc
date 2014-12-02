"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Apperance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hi PmenuSel   ctermfg=White	   ctermbg=DarkBlue  guifg=White  guibg=DarkBlue
" Explicitly tell Vim that the terminal supports 256 colors
set t_Co=256 

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
syntax enable on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Features 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set viminfo for fast restore on work
set viminfo='100,<50,s10,h
" Sets how many lines of history VIM has to remember
set history=700

" Set paste mode
set paste

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

" Enchanced for Russian encoding detection
set fileencodings^=windows-1251

" Search for selected text, forwards or backwards.
" Search for selected text.
" http://vim.wikia.com/wiki/VimTip171
let s:save_cpo = &cpo | set cpo&vim
if !exists('g:VeryLiteral')
    let g:VeryLiteral = 0
endif
function! s:VSetSearch(cmd)
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    normal! gvy
    if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
        let @/ = @@
    else
        let pat = escape(@@, a:cmd.'\')
        if g:VeryLiteral
            let pat = substitute(pat, '\n', '\\n', 'g')
        else
            let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
            let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
            let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
        endif
        let @/ = '\V'.pat
    endif
    normal! gV
    call setreg('"', old_reg, old_regtype)
endfunction
vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<CR>?<C-R>/<CR>
vmap <kMultiply> *
nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
            \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>
if !hasmapto("<Plug>VLToggle")
    nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpo = s:save_cpo | unlet s:save_cpo


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
"YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F2> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
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
"Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_bookmarks = ['~/.vimrc',]
let g:startify_skiplist = ['vimrc',]
let g:startify_session_persistence = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NeoBundle 
"git clone git@github.com:Shougo/neobundle.vim.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" be iMproved
set nocompatible               

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" set the bundle root, and vundle directory
let root = '~/.vim/bundle'
let src = 'http://github.com/Shougo/neobundle.vim.git'

" clone neobundle if it's missing
if !isdirectory(expand(root, 1).'/neobundle.vim')
    exec '!git clone '.src.' '.shellescape(expand(root.'/neobundle.vim', 1))
endif
if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:

NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'jansenm/vim-cmake'
NeoBundle 'thinca/vim-ref'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'wesleyche/SrcExpl'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'ruby.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'DoxygenToolkit.vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'xml.vim'
NeoBundle 'MatchTag'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'tkztmk/vim-vala'
NeoBundle 'wdicarlo/vim-notebook'
NeoBundle 'CodeReviewer.vim'
NeoBundle 'Valloric/YouCompleteMe.git'

" Nice start screen
NeoBundle 'mhinz/vim-startify'

" Allow autoclose paired characters like [,] or (,),
" " and add smart cursor positioning inside it,
NeoBundle 'Raimondi/delimitMate'

"Snippets plugins
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle "honza/vim-snippets"

"Fast search
NeoBundle 'vim-scripts/FuzzyFinder'
NeoBundle 'vim-scripts/L9'
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


