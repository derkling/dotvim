
" Intenting
set noexpandtab                         " use tabse, not spaces
set tabstop=8                           " tabstops of 8
set shiftwidth=8                        " indents of 8
set textwidth=78                        " screen in 80 columns wide, wrap at 78
set autoindent                          " turn on auto indenting
set smarttab                            " make <tab> and <backspace> smarter
set backspace=eol,start,indent          " allow backspacing over indent, eol, & start

nmap <C-J> vip=                         " forces (re)indentation of a block of code

" Highlighting
syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t
syn keyword cOperator likely unlikely
"syn match ErrorLeadSpace /^ \+/         " highlight any leading spaces
"syn match ErrorTailSpace / \+$/         " highlight any trailing spaces
"syn match Error80        /\%>80v.\+/    " highlight anything past 80 in red

set formatoptions=tcqlron
set cinoptions=:0,l1,t0,g0

"
" Code Folding
"
"set foldmethod=syntax

"
" Tags
"
" configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/boost
" build tags of your own project with Ctrl-F12
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"
" CScope
"
source ~/.vim/cscope_maps.vim


"
" Toggle TagList window with F8
"
noremap <silent> <F8> :TlistToggle<CR>
noremap! <silent> <F8> <ESC>:TlistToggle<CR>


"
" CLang AutoCompletion
"
" necessary for using libclang
let g:clang_library_path='/usr/lib'
" auto-closes preview window after you select what to auto-complete with
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"
" Smart in-line manpages with 'K' in command mode
"
fun! ReadMan()
  " Assign current word under cursor to a script variable:
  let s:man_word = expand('<cword>')
  " Open a new window:
  :wincmd n
  " Read in the manpage for man_word (col -b is for formatting):
  :exe ":r!man " . s:man_word . " | col -b"
  " Goto first line...
  :goto
  " and delete it:
  :delete
  " finally set file type to 'man':
  :set filetype=man
  " lines set to 20
  :resize 20
endfun
" Map the K key to the ReadMan function:
noremap K :call ReadMan()<CR>


" GUI coloring
highlight Pmenu ctermbg=green gui=bold
highlight Pmenu ctermfg=black gui=bold


" Compilation: save and make, clean-up
map gm <esc>:wa<cr><esc>:make<cr><cr><cr><cr><esc>:cw<cr>
map gc <esc>:make clean<cr>


" QuickFix window: open (on errors), next error, previous error
map fw <esc>:cw<cr>
map fn <esc>:cn<cr>
map fp <esc>:cp<cr>

