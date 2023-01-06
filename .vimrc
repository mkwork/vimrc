set nocompatible
set ttimeoutlen=50

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" set the bundle root, and vundle directory
let root = '~/.vim/bundle'
let src = 'https://github.com/Shougo/neobundle.vim.git'

" clone neobundle if it's missing
if !isdirectory(expand(root, 1).'/neobundle.vim')
    exec '!git clone '.src.' '.shellescape(expand(root.'/neobundle.vim', 1))
endif

if has('vim_starting') || has(win32)
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:

NeoBundleFetch 'Shougo/neobundle.vim'

" Too cool for centos6 out of box
if version >= 703

    function! SetupNeocomleteForCpp()
        "NeoCompleteEnable
        let &mp='./make.sh'
        nnoremap <leader>bb :exe 'AsyncRun' &mp<CR>
        let b:ale_linters = ['clangtidy']
        setlocal omnifunc=lsp#complete

        if !exists('g:deoplete#omni_patterns')
            let g:deoplete#omni_patterns = {}
        endif

        let g:deoplete#omni_patterns.cpp = ['[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::', '#']
        set syntax=cpp.doxygen
    endfunction

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "cmake completion
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'richq/vim-cmake-completion'

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "snippets
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle 'honza/vim-snippets'
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
    " Enable snipMate compatibility feature.
    let g:neosnippet#enable_snipmate_compatibility = 1

    " Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "vimproc
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'Shougo/vimproc.vim'

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "vim-rsi readline binding
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'tpope/vim-rsi'

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "dispatch.vim
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'tpope/vim-dispatch'
    :let g:dispatch_no_tmux_make=1

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "asyncrun.vim
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:asyncrun_bell=1
    NeoBundle 'skywind3000/asyncrun.vim'
    autocmd User AsyncRunStop cw

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " vim-winswap
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'wesQ3/vim-windowswap'

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " vim-fzf
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'junegunn/fzf'
    NeoBundle 'junegunn/fzf.vim'

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " one colorscheme
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'rakr/vim-one'

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " echodoc
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'Shougo/echodoc.vim'

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " transparent editing gpg files
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'jamessan/vim-gnupg'

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Vista tagbar
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:vista_executive_for = {
                \ 'cpp': 'vim_lsp',
                \ 'c': 'vim_lsp',
                \ 'python': 'vim_lsp',
                \ }
    NeoBundle 'liuchengxu/vista.vim'

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " vim-lsp
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:lsp_signs_enabled = 0         " enable signs
    let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
    NeoBundle 'prabirshrestha/asyncomplete.vim'
    NeoBundle 'prabirshrestha/async.vim'
    NeoBundle 'prabirshrestha/vim-lsp'
    NeoBundle 'prabirshrestha/asyncomplete-lsp.vim'
    NeoBundle 'prabirshrestha/asyncomplete-buffer.vim'
    NeoBundle 'prabirshrestha/asyncomplete-file.vim'

    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))


    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " clang-format integration
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'rhysd/vim-clang-format'

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " buffer manipulation
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'qpkorr/vim-bufkill'

    NeoBundle 'dhruvasagar/vim-zoom'


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Unite (files search)
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'Shougo/unite.vim'

    function! s:unite_my_settings()
        nnoremap <silent><buffer><expr> s unite#do_action('split')
        nnoremap <silent><buffer><expr> v unite#do_action('vsplit')

        inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
        inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    endfunction

endif

" My Bundles here:

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Local vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'embear/vim-localvimrc'
let g:localvimrc_persistent = 2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'scrooloose/nerdtree'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pep8 suppoer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'nvie/vim-flake8'
let python_highlight_all=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NeoBundle 'w0rp/ale'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NeoBundle 'scrooloose/syntastic'
"let g:syntastic_auto_loc_list = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"HowMuch calculations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'sk1418/HowMuch'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Session management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'

" Persist the options of the session plug-in using the session plug-in...
let g:session_persist_globals = ['&sessionoptions']
call add(g:session_persist_globals, '&makeprg')
call add(g:session_persist_globals, '&makeef')
call add(g:session_persist_globals, 'g:session_autoload')
call add(g:session_persist_globals, 'g:session_autosave')
call add(g:session_persist_globals, 'g:session_default_to_last')
call add(g:session_persist_globals, 'g:session_persist_globals')

let g:session_autosave = 'no'
let g:session_autoload = 'no'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'jansenm/vim-cmake'
NeoBundle 'thinca/vim-ref'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-rails'
NeoBundle 'DoxygenToolkit.vim'
NeoBundle 'xml.vim'

NeoBundle 'jtratner/vim-flavored-markdown'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
let g:airline#extensions#keymap#enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

" required by vim-markdown
NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vdebug debug intrface for python, php, ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NeoBundle 'joonty/vdebug'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nice start screen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'mhinz/vim-startify'
let g:startify_change_to_dir = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Info documentation readed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'alx741/vinfo'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-bookmarks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'MattesGroeger/vim-bookmarks'
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ack.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'mileszs/ack.vim'
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"goyo.vim - for focusing (distraction free editing)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'junegunn/goyo.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast search
NeoBundle 'vim-scripts/L9'

"csv editing
NeoBundle 'chrisbra/csv.vim'

"additional syntax highlighting
NeoBundle 'sheerun/vim-polyglot'

" Ansi esc
NeoBundle 'vim-scripts/AnsiEsc.vim'

" colorscheme pack
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'sainnhe/edge'

"colorscheme converter
NeoBundle 'vim-scripts/guicolorscheme.vim'
NeoBundle 'godlygeek/csapprox'

"plantuml
NeoBundle 'aklt/plantuml-syntax'

" codi.vim - NasC replacement (calculator)
NeoBundle 'metakirby5/codi.vim'

" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

autocmd FileType c,cpp call SetupNeocomleteForCpp()
autocmd FileType unite call s:unite_my_settings()


" BufOnly.vim  -  Delete all the buffers except the current/named buffer.
"
" Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Bonly / :BOnly / :Bufonly / :BufOnly [buffer]
"
" Without any arguments the current buffer is kept.  With an argument the
" buffer name/number supplied is kept.

command! -nargs=? -complete=buffer -bang Bonly
            \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
            \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
            \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
            \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
    if a:buffer == ''
        " No buffer provided, use the current buffer.
        let buffer = bufnr('%')
    elseif (a:buffer + 0) > 0
        " A buffer number was provided.
        let buffer = bufnr(a:buffer + 0)
    else
        " A buffer name was provided.
        let buffer = bufnr(a:buffer)
    endif

    if buffer == -1
        echohl ErrorMsg
        echomsg "No matching buffer for" a:buffer
        echohl None
        return
    endif

    let last_buffer = bufnr('$')

    let delete_count = 0
    let n = 1
    while n <= last_buffer
        if n != buffer && buflisted(n)
            if a:bang == '' && getbufvar(n, '&modified')
                echohl ErrorMsg
                echomsg 'No write since last change for buffer'
                            \ n '(add ! to override)'
                echohl None
            else
                silent exe 'bdel' . a:bang . ' ' . n
                if ! buflisted(n)
                    let delete_count = delete_count+1
                endif
            endif
        endif
        let n = n+1
    endwhile

    if delete_count == 1
        echomsg delete_count "buffer deleted"
    elseif delete_count > 1
        echomsg delete_count "buffers deleted"
    endif

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Apperance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
"set term=screen-256color
"set t_Co=256
set noswapfile
"colorscheme darcula

let my_colorscheme = 'one'
"let my_colorscheme = 'Tommorow'
"let my_colorscheme = 'desertEx'
"let my_colorscheme = 'gruvbox'

if version >= 800
    set t_Co=256
    set t_ut=

    " Makes the background transparent. Leave these out if you're not using a transparent
    " terminal.
    highlight Normal ctermbg=NONE guibg=NONE
    "highlight NonText ctermbg=NONE guibg=NONE
    set termguicolors
    execute 'colorscheme '.my_colorscheme

elseif version >= 700 && &term != 'cygwin' && !has('gui_running')
  " In the color terminal, try to use CSApprox.vim plugin or
  " guicolorscheme.vim plugin if possible in order to have consistent
  " colors on different terminals.
  "
  " Uncomment one of the following lines to force 256 or 88 colors if
  " your terminal supports it. Or comment both of them if your terminal
  " supports neither 256 nor 88 colors. Unfortunately, querying the
  " number of supported colors does not work on all terminals.
  set t_Co=256
  "set t_Co=88
  if &t_Co == 256 || &t_Co == 88
    " Check whether to use CSApprox.vim plugin or guicolorscheme.vim plugin.
    if has('gui') &&
      \ (filereadable(expand("$HOME/.vim/plugin/CSApprox.vim")) ||
      \ filereadable(expand("$HOME/.vim/bundle/CSApprox/plugin/CSApprox.vim")) ||
      \ filereadable(expand("$HOME/.vim/bundle/csapprox/plugin/CSApprox.vim")) ||
      \  filereadable(expand("$HOME/vimfiles/plugin/CSApprox.vim")))
      let s:use_CSApprox = 1
    elseif filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim")) ||
      \    filereadable(expand("$HOME/vimfiles/plugin/guicolorscheme.vim"))
      let s:use_guicolorscheme = 1
    endif
  endif
elseif exists('s:use_CSApprox')
  " Can use the CSApprox.vim plugin.
  let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
  execute 'colorscheme '.my_colorscheme
elseif exists('s:use_guicolorscheme')
  " Can use the guicolorscheme plugin. It needs to be loaded before
  " running GuiColorScheme (hence the :runtime! command).
  runtime! plugin/guicolorscheme.vim
  GuiColorScheme my_colorscheme
else
  execute 'colorscheme '.my_colorscheme
endif


"Column
if version >= 703
    set colorcolumn=79
endif

" Show row numbers always
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

" More frequent saving in insert mode
inoremap <CR> <c-g>u<CR>


" Source range
function! SourceRange() range
    let tmpsofile = tempname()
    call writefile(getline(a:firstline, a:lastline), l:tmpsofile)
    execute "source " . l:tmpsofile
    call delete(l:tmpsofile)
endfunction
command! -range Source <line1>,<line2>call SourceRange()

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

" Enchanced for Russian encoding detection
set fileencodings^=utf8,windows-1251

" Man builtin plugin
runtime! ftplugin/man.vim

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
" Tab closing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! TabCloseRight(bang)
    let cur=tabpagenr()
    while cur < tabpagenr('$')
        exe 'tabclose' . a:bang . ' ' . (cur + 1)
    endwhile
endfunction

function! TabCloseLeft(bang)
    while tabpagenr() > 1
        exe 'tabclose' . a:bang . ' 1'
    endwhile
endfunction

command! -bang Tabcloseright call TabCloseRight('<bang>')
command! -bang Tabcloseleft call TabCloseLeft('<bang>')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" My custom hl search colors
hi Search cterm=NONE ctermfg=white ctermbg=darkmagenta

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright
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

set ai "Auto indent
set si "Smart indent
set wrap!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
    set cc=0
    set wrap
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_width = 44

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'deus'
:set laststatus=2


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


if executable('pylsp')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'whitelist': ['python'],
        \ })
elseif executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('ccls')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
elseif executable('clangd')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd']},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                \ })
elseif executable('cquery')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'cquery',
                \ 'cmd': {server_info->['cquery', '--language-server', '--log-file', '/home/maxim/.cquery/log']},
                \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
                \ 'initialization_options': { 'cacheDirectory': '/home/maxim/.cquery/cache/' },
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'rls',
                \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
                \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
                \ 'whitelist': ['rust'],
                \ })
endif

"autocmd FileType cpp setlocal omnifunc=lsp#complete
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


augroup FileType *
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=j
augroup END

" keybindings

" Space leader [experimental]
let mapleader = "\<Space>"

nnoremap <Leader>ld :LspDefinition<CR>
nnoremap <leader>lr :LspReferences<CR>

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>h <Plug>AirlineSelectPrevTab<CR>
nmap <leader>l <Plug>AirlineSelectNextTab<CR>
nmap <leader>kk <Plug>AirlineSelectPrevTab<CR>
nmap <leader>jj <Plug>AirlineSelectNextTab<CR>
nmap <leader>D :BD<CR>

" repeat last ex
nnoremap <leader>. :<Up><CR>

" development
nnoremap <silent> <leader>kn :NERDTreeFind<CR>
nnoremap <F6> :exe 'AsyncRun' &mp<CR>
vnoremap <C-i> :ClangFormat<CR>
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qp :cprev<CR>
nnoremap <leader>yf :let @" = expand("%:p")<CR>
nnoremap <leader>yfn :let @" = expand("%:t")<CR>

" fzf
nnoremap <silent> <leader>kf  :Files<CR>
nnoremap <silent> <leader>kr  :Files %:h<CR>
nnoremap <silent> <leader>kl  :Lines<CR>
nnoremap <silent> <leader>kb  :BLines<CR>
nnoremap <silent> <leader>ka  :Ag<CR>
nnoremap <silent> <leader>kh  :History:<CR>

" windows
nnoremap <leader>w <C-w>

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
