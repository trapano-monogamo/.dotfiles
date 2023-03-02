" enter current millenium
set nocompatible

syntax enable
filetype plugin on

set splitright
set splitbelow
set nowrap
set tabstop=4
set number

set background=dark
colorscheme default

" set termguicolors
" set cursorline
highlight! CursorLine ctermbg=none
highlight! Visual ctermbg=0a0a0a



" ..:: finding files, tags and patterns ::..

" search for patterns into current and subdirectories
" ':find' will find a filename containing the string specified and edit it
" (e.g. ':find bin' will find all files/dirs named bin insied path and edit the selected one)
set path+=**

set wildmenu
set wildoptions+=pum

set is
set nohls


" ctags creates a 'tags' file which programs (included vim) searches for
" in order to recognize tags (mainly words) through all files in the specified path.
" -R is recurseive and . is the root of the search
" keybindings:
" 	C-]		= goto definition
"	g C-]	= list all references
"	C-t		= (after previous tag search) jump back to previous tag found
command! MakeTags !ctags -R .
set tags+=./vim/tags

" useful commands:
"	gf	= goto file at cursor (e.g. put the cursor on this file ~/programs/rust/graphics_programming/demo/src/main.rs)



" ..:: autocompletion ::..

" useful commands:
" 	C-n		= builtin autocomplete (searches for languages specific dependencies)
" 		C-n 	= cycles down through options
" 		C-p 	= cycles up through options
" 	C-x C-n		= " but searches only in this file
"	C-x C-f		= buildint file name autocomplete
"	C-x C-]		= buildint tags autocomplete



" ..:: file browsing ::..

let g:netrw_banner=0
let g:netrw_browse_split=4 	" open in prior window
let g:netrw_altv=1		" open splits to the right
let g:netrw_liststyle=3		" tree list style



call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()



" ..:: snippets ::..

" nnoremap will execute the command bound to ',rustmain'. (',' is just a prefix, like the leader key '\', so vim won't execute 'r' then 'u' and so on)
" ':' will enter command mode (everything after the will be pasted in the line)
" <CR> is 'return' but inside : mode (command mode) so executes the command. Everything after this will be the key command
" -1 moves cursor back
" 'read' yanks the content of the specified file at the cursor location
" nnoremap <leader>rustmain :-1read $HOME/.vim/snippets/.rustmain<CR>o

let mapleader = " "

nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>

nnoremap <leader>e :Lex 12<CR>
nnoremap <leader>f :Files<CR>

nnoremap <C-Right> :vertical resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Up> :resize -2<CR>

inoremap ,. <ESC>

" TODO: write functions language-wise to check if line is already commented,
" and in that case uncomment them.
autocmd FileType rust nnoremap \c I// <ESC>
autocmd FileType python nnoremap \c I# <ESC>



" ..:: building ::..

" useful commands:
"	:make		= runs make with the given parameters
"	:cp :cn :cc#	= cycles through the lines of the output, or jump to # (number)



" ..:: prettyfy vim ::..

function! GitBranch()
	let branch_name = system('git branch 2>/dev/null | grep *')
	return "" . branch_name
endfunction

set laststatus=2 " status line enabled all the time

" emtpy it and then configure it
set statusline=
set statusline=%f\ %m\ %h%=%p%{'%'}\ [%l:%c]
" set statusline=b:%n\ %f%R%Y%=%m[row\ %l/%L,\ column\ %v\ (%c)]
" set statusline+=\ %{GitBranch()}
