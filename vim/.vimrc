syntax enable
filetype indent on
set noerrorbells
" set tabstop=2
set tabstop=4
set expandtab
set shiftwidth=4
" set cindent shiftwidth=2
set nocompatible
set number
set ruler
set bg=dark
set hlsearch
set backspace=indent,start,eol
set history=200
filetype plugin on
set cursorline

" Stops from getting spaces being sent with "colors"
hi NonText cterm=NONE ctermfg=NONE

" Indentation for public: protected: etc.
set cino=g0

" Increase term scroll speed?
hi NonText cterm=NONE ctermfg=NONE

autocmd FileType h,c,cc,cpp,java set formatoptions=cworb cindent tw=0 sidescroll=10 listchars=extends:$ textwidth=80 cinoptions=(0,W4

" Highlight anything greater than 80 chars.
:autocmd WinEnter *.cc match ErrorMsg '\%>80v.\+'
:autocmd WinEnter *.icc match ErrorMsg '\%>80v.\+'
:autocmd WinEnter *.h match ErrorMsg '\%>80v.\+'
:autocmd WinEnter *.tex match ErrorMsg '\%>80v.\+'

map <C-M> :match<CR>

" Highlight trailing whitespace
" autocmd BufRead *.cc syn match Error /\s\+$/
" autocmd BufRead *.icc syn match Error /\s\+$/
" autocmd BufRead *.h syn match Error /\s\+$/

" set wm=2
autocmd BufRead *.tex set textwidth=79
" autocmd FileType c,cc,cpp,java run <C-w>=
" autocmd FileType c,cpp nmap <tab> =0<CR>

" Ack-grep integration
set grepprg=ack-grep\ -a

" Playing around with wildmenu
set wildmenu
"set wildmode=list:longest,full
set wildmode=list:longest,list:full
set wildchar=*
set completeopt+=longest

" Searching config
nmap <silent> <C-N> :silent noh<CR>
set ignorecase
set smartcase
set incsearch

" Make the backup dir somewhere else...thank god
set backupdir=./.backup,/tmp,.
set directory=./.backup,/tmp,.

" TODO: Only activate if .tex filetype
" Latex Suite plugin stuff
" let g:tex_flavor='latex'
" Compile latex automagically
" autocmd Filetype latex  inoremap <buffer> <F5> <C-o>:update<Bar>execute '!pdflatex '.shellescape(@%, 1)<CR>
nmap <F5> :!pdflatex %:p:h/%:t<CR>

" C-tags (e-tags really) mappings
" set tags=./tags,../tags,../../tags,../../../tags,../../../../tags,/sx/pribor/blipchin/tags,/usr/src/tags,/usr/include/tags
"set tags=TAGS,./TAGS,../TAGS,../../TAGS,../../../TAGS,../../../../TAGS,../../../../../TAGS
" map t	:FufTag<CR>
map t	:tag 
"map pt :tnext<CR>
"map nt :tprevious<CR>

"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Alt-right/left to navigate forward/backward in the tags stack
" map <M-h> <C-T>
" map <M-l> <C-]>

" Omni complete options
" These are used by the OmniComplete plugin.
set nocp
let OmniCpp_NamespaceSearch=1
let OmniCpp_DefaultNamespaces = ["std", "SpaceX"]
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" FuzzyFinder settins
map <C-o> :FufFile <C-R>=expand("%:p:h") . '/'<CR><CR>

" Drop down settings
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Down>     pumvisible() ? "\<M-j>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<M-k>" : "\<Up>"
:inoremap <M-j> <Down>
:inoremap <M-k> <Up>

" Toggle at word boundary
set lbr

" Folding
set foldmethod=syntax
" set foldenable

" Zenburn color configurations
let g:zenburn_high_Contrast=1
let g:zenburn_alternate_Visual = 1
set t_Co=256
colorscheme zenburn3
":hi search ctermbg=123 ctermfg=238
":hi incsearch ctermbg=216 ctermfg=242
:hi normal ctermbg=234
" colorscheme lucius

" Scroll down and up with C-k C-j
noremap <C-k> <C-y>
noremap <C-j> <C-e>

" Setup auto-completing curly brackets
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" Setup auto-completing parentheses
inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

" Setup auto-completing quotes
inoremap "      ""<Left>
inoremap "<CR>  "<CR>"<Esc>O
inoremap ""     "

map <F6> :setlocal spell! spelllang=en_us<CR>

" Navigation maps
" Go to beginning and end of line
map <C-l> $
map <C-h> ^
map G	Gzz
map '' ''zz

" Saving/getting out of insert mode stuff
map <Space> :wall<CR>
imap jj <Esc>
" :map ` q
" :map q :wq<CR>

" Random maps to make some things faster/easier
" especially with all the autocompleting parens/brackets
map p p==
map %dd d%d%
imap kk <Esc><Right>a
imap hh <Esc><Right>a
imap hhh <Esc><Right><Right>a
imap hhhh <Esc><Right><Right><Right>a


" Setup auto-completing for C-style comments                                                                                                                       
inoremap /** /**<CR><Left>/<Esc>O<Backspace><Space>
inoremap /*<Space> /*  */<Left><Left><Left>
inoremap /*<CR><CR> /*<CR><Backspace><CR>/<Esc><Up>A<Space>

" lhs comments
map ,, :s/^/\/\//<CR>:nohlsearch<CR>
" wrapping comments
map .. :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>

" Edit/write another file in the same directory as the current file
" uses expression to extract path from current file's path
" (thanks Douglas Potts)
if has("unix")
    map ,e :e <C-R>=expand("%:p:h") . '/'<CR>
    map ,s :split <C-R>=expand("%:p:h") . '/'<CR>
    map ,v :vsplit <C-R>=expand("%:p:h") . '/'<CR>
    map ,w :write <C-R>=expand("%:p:h") . '/'<CR>
else
    map ,e :e <C-R>=expand("%:p:h") . '\'<CR>
    map ,s :split <C-R>=expand("%:p:h") . '\'<CR>
    map ,v :vsplit <C-R>=expand("%:p:h") . '\'<CR>
    map ,w :write <C-R>=expand("%:p:h") . '\'<CR>
endif

" Currently only support searching current folder
set path=.

function! Mosh_Flip_Ext()
    " Switch editing between .c* and .h* files (and more).
    " Since .h file can be in a different dir, call find.
    if match(expand("%"),'\.c') > 0
	let s:flipname = substitute(expand("%"),'\.c\(.*\)','.h\1',"")
	exe ":find " s:flipname
    elseif match(expand("%"),"\\.h") > 0
	let s:flipname = substitute(expand("%"),'\.h\(.*\)','.c\1',"")
	exe ":e " s:flipname
    endif
endfun


" map .h :call Mosh_Flip_Ext()<CR>
" map ,h :call Mosh_Split_Ext()<CR>

" Swap automatically between header file and implementation file.
" Can open in the same buffer, or in a horizontal split.
map .h :e %:p:s,.cc$,.X123X,:s,.h$,.cc,:s,.X123X$,.h,<CR>
map ,h :sp %:p:s,.cc$,.X123X,:s,.h$,.cc,:s,.X123X$,.h,<CR>
"map .h :e %:p:s/_uto\?\.cc$/.h/:s/\.cc$/.h/<CR>
"map ,h :vsp %:p:s/_uto\?\.cc$/.h/:s/\.cc$/.h/<CR>
"map .c :e %:p:s/_uto\?\.cc$/.cc/:s/\.h$/.cc/<CR>
"map ,c :vsp %:p:s/_uto\?\.cc$/.cc/:s/\.h$/.cc/<CR>
"map .o :e %:p:s/\(_uto\?\)\?\.\(h\\\|cc\)$/_uto.cc/<CR>
"map ,o :vsp %:p:s/\(_uto\?\)\?\.\(h\\\|cc\)$/_uto.cc/<CR>

" Taglist options
" let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 64
let Tlist_Use_Right_Window = 1

" SpaceX specific SacAbortIfNot
map <C-c> ^iSacAbortIfNot((<Esc>A<Backspace>, false);<Esc>

" SpaceX/Scratch specific compilation hotkey
" map <C-A> :Scratch<CR>:set nonu<CR>:e<CR>:r ! build_linux.sh<CR><CR>
" map <C-I> :Sscratch<CR>:set nonu<CR>:e<CR>:r ! build_linux_vim.sh %<CR><CR>
" map <C-I> :call Compile_Bin()<CR>

function! Compile_Bin()
    let s:filename = expand("%")
    exe ":Sscratch"
    exe ":set nonu"
    exe ":e"
    exe ":r ! build_linux_vim.sh " s:filename
endfun

" Doxygen stuff
let g:load_doxygen_syntax=1
let g:doxygen_enhanced_colour=1
let g:doxygen_end_punctuation='[@]'

"vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

""
" Boinks up a blame window for the currently loaded file.
" @return void
""
"function SvnBlame_blameCurrentFile()
"    let fileName = expand('%')
"    if match(fileName, "_svnBlame$") == -1
"	let blameBufferName = fileName."_svnBlame"
"	let blameBuffer = bufnr(blameBufferName)
"	if blameBuffer == -1
"	    call SvnBlame_openBlameBuffer(fileName, blameBufferName)
"	else
"	    wincmd w
"	    call SvnBlame_execPreserveNum('bwipeout '.blameBuffer)
"	endif
"    else
"	" We're in a blame buffer, so close it.
"	call SvnBlame_execPreserveNum('bwipeout '.fileName)
"    endif
"endfunction
"
"""
"" Execs the given command, preserving numbering
"" @param string commandString
"" @return void
"function SvnBlame_execPreserveNum(commandString)
"    if &number == 1
"	let numbered = 1
"    else
"	let numbered = 0
"    endif
"    exe a:commandString
"    if numbered == 1
"	set nu
"    endif
"endfunction
"
"""
"" Opens up a blame buffer called blameBufferName for the given fileName
"" @param string fileName The filename to blame
"" @param string blameBufferName The name to use for the blame buffer
"" @return void
"function SvnBlame_openBlameBuffer(fileName, blameBufferName)
"    set scrollbind
"    set nowrap
"    call SvnBlame_execPreserveNum("15vnew ".a:blameBufferName)
"    " Current window is now the blame buffer
"    setlocal buftype=nofile
"    setlocal nobuflisted
"    setlocal bufhidden=hide
"    setlocal noswapfile
"    setlocal autoread
"    set scrollbind
"    set nowrap
"    "Set filetype so that any special syntax files can be included.
"    setf blame
"    "execute `read !svn blame ` .a:fileName.` | tr -s " " “\t” | cut -f2-3`
"    execute ‘read !svn blame ’.a:fileName.’ | tr -s " " “\t” | cut -f2-3’
"    "execute ‘silent read !svn blame ’.a:fileName.’ | sed -n -e “s/\s\\([0-9]\\)\s\\(\S\\).*/\2 (\1)/p”’
"    "Delete first line, which is empty.
"    1d
"    "Make the buffer non-modifiable.
"    setlocal nomodifiable
"    "Switching out, in then out of the blame buffer seems to force an auto-resize.
"    wincmd w
"    wincmd w
"    wincmd w
"    set nonu
"endfunction
"
"map gl :call SvnBlame_blameCurrentFile()<CR>

" Enable cpp syntax for .icc files.
au BufNewFile,BufRead *.icc set filetype=cpp
au BufNewFile,BufRead *.go set filetype=go
