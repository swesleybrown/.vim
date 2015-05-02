:au FocusLost * silent! wa 	" Save on focus lost
set ttyfast 			" speed up vim scrolling
set lazyredraw 			" speed up vim rendoring code
set nocp 			" This changes the values of a LOT of options, enabling features which are not Vi compatible
set history=100			" keep 100 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch			" do incremental searching

set backspace=2         	" backspace in insert mode works like normal editor
syntax on              	 	" syntax highlighting
filetype indent on      	" activates indenting for files
set autoindent          	" auto indenting
set background=dark		" dark version of solarized
colorscheme solarized   	" colorscheme solarized 
set nobackup            	" get rid of anoying ~file
set guifont=Monaco:h12  	" set font to monaco 12
set smartcase			" search not case sensitive unless using a cap in the search
set encoding=utf-8

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=""
endif

" For all text files set 'textwidth' to 78 characters. 
autocmd FileType text setlocal textwidth=78

" Highlight line number of where cursor currently is
hi CursorLineNr guifg=#050505
 
" Numbers
set number
set numberwidth=5

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/vim-easy-align'

function! Installjshint(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g jshint
  endif
endfunction
Plug 'scrooloose/syntastic', { 'do': function('Installjshint') }

call plug#end()

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
