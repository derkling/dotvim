set nocompatible               " be iMproved
filetype off                   " required!

" Setup Vundle scripts manager
set runtimepath+=~/.vim/bundle/vundle/

" Plugins " {{{
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Snippets
Bundle "http://github.com/gmarik/snipmate.vim.git"

" Git integration
Bundle "git.zip"
Bundle "fugitive.vim"

" Utility
Bundle "jistr/vim-nerdtree-tabs"
Bundle "msanders/snipmate.vim"
Bundle "repeat.vim"
Bundle "surround.vim"
Bundle "SuperTab"
Bundle "file-line"
Bundle "Align"
Bundle "Lokaltog/vim-easymotion"
Bundle "vim-scripts/taglist.vim"

" FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'
let g:fuf_modesDisable = [] " {{{
nnoremap <silent> <LocalLeader>h :FufHelp<CR>
nnoremap <silent> <LocalLeader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>@  :FufFile<CR>
nnoremap <silent> <LocalLeader>3  :FufBuffer<CR>
nnoremap <silent> <LocalLeader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>$  :FufDir<CR>
nnoremap <silent> <LocalLeader>5  :FufChangeList<CR>
nnoremap <silent> <LocalLeader>6  :FufMruFile<CR>
nnoremap <silent> <LocalLeader>7  :FufLine<CR>
nnoremap <silent> <LocalLeader>8  :FufBookmark<CR> 
nnoremap <silent> <LocalLeader>*  :FuzzyFinderAddBookmark<CR><CR>
nnoremap <silent> <LocalLeader>9  :FufTaggedFile<CR> 
" " }}}

" tComment
Bundle "tComment"
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Command-T
Bundle "git://git.wincent.com/command-t.git"
let g:CommandTMatchWindowAtTop=1 " show window at top

" Navigation
Bundle "http://github.com/gmarik/vim-visual-star-search.git"

" CScope
Bundle "git://github.com/vim-scripts/cscope.vim.git"

" LaTeX
Bundle "http://github.com/vim-latex/vim-latex.github.com.git"

" " }}}

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


"
" Here follow the common configuration
"


" Have Vim load indentation rules according to the detected filetype.
" Per default Debian Vim only load filetype specific plugins.
if has("autocmd")
	filetype on
	filetype indent on
	filetype plugin on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set nocompatible	" vim defaults, not vi!
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set ttymouse=xterm2     " Enable mouse usage on screen terminal emulator
set mouse=a		" Enable mouse usage (all modes) in terminals
set nobackup		" Disable creation of backup (*.ext~) files

"
" Have Vim jump to the last position when reopening a file
"
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

"
" incremental search that highlights results
"
set incsearch
set hlsearch
" Ctrl-L clears the highlight from the last search
noremap <C-l> :nohlsearch<CR><C-l>
noremap! <C-l> <ESC>:nohlsearch<CR><C-l>

"
" Smart backspace
"
set backspace=start,indent,eol

"
"----- Toggle auto-indenting for code paste
"
" sets a mapping so that pressing F2 in normal mode will invert the 'paste' option
nnoremap <F2> :set invpaste paste?<CR>
" press F2 when in insert mode, to toggle 'paste' on and off
set pastetoggle=<F2>
" enables displaying whether 'paste' is turned on in insert mode
set showmode

"
"----- Toggle text wrapping
"
map <F3> :set nowrap!<CR>

"
"----- Toggle line numbering
"
map <F4> :set nonumber!<CR>

"
"----- Line numbering
"
:set number		" display line numbers along the left side of a window
:set numberwidth=5	" change the width of the 'gutter' column used for numbering
:set cpoptions+=n	" use the number column for the text of wrapped lines
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" toggles between showing and hiding line numbers by pressing Ctrl-N twice in normal mode
:nmap <C-N><C-N> :set invnumber<CR>

"
"----- Highlight spaces
"
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
:highlight ExtraWhitespace ctermbg=red guibg=red
" Show trailing whitespace:
:match ExtraWhitespace /\s\+$/
" Show trailing whitespace, except when typing at the end of a line
":match ExtraWhitespace /\s\+\%#\@<!$/
:match ExtraWhitespace /\s\+$\| \+\ze\t/
" Show tabs that are not at the start of a line:
:match ExtraWhitespace /[^\t]\zs\t\+/
" Show spaces used for indenting (so you use only tabs for indenting).
":match ExtraWhitespace /^\t*\zs \+/
:autocmd InsertLeave * redraw!

"----- Windows Management (using WinManager plugin)
"map <F7> :WMToggle<cr>
"let g:winManagerWindowLayout='FileExplorer,TagsExplorer|BufExplorer'

"
"-----NERDTree
"
noremap <silent> <F12> :NERDTreeToggle<CR>
noremap! <silent> <F12> <ESC>:NERDTreeToggle<CR>
" tells NERDTree to use ASCII chars
let g:NERDTreeDirArrows=0

"
" Better TAB completion for files (like the shell)
"
if has("wildmenu")
    set wildmenu
    set wildmode=longest,list
    " Ignore stuff (for TAB autocompletion)
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif

"
" TAB and Shift-TAB in normal mode cycle buffers
"
:nmap <Tab> :bn<CR>
:nmap <S-Tab> :bp<CR>

"
"----- Color and GUI Configuration
"
" Syntax Highlighting
syntax on
" highlight current line
" set cursorline
" always show the status line
set laststatus=2
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

"
"when the vim window is resized resize the vsplit panes as well
"
au VimResized * exe "normal! \<c-w>="


"
" Here follow the language specific configuration
"


"
"----  C/C++ Mode (using c.vim plugin)
"
autocmd BufRead *.c,*.h,*.cc,*.hh,*.cpp,*.hpp,*.S source ~/.vim/my_c.vim
autocmd BufNewFile,BufRead *.dox set filetype=cpp.doxygen
"
"----- LaTeX Mode
"
autocmd BufEnter *.tex,*.bib source ~/.vim/my_latex.vim

"
"----- Python Mode (using py.vim plugin)
"
autocmd BufRead *.py source ~/.vim/my_py.vim

