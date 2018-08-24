"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.config/nvim/bundle')
  call dein#begin('$HOME/.config/nvim/bundle')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/echodoc.vim')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('rust-lang/rust.vim')
  call dein#add('sebastianmarkow/deoplete-rust')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-commentary')
  call dein#add('wincent/pinnacle')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  " Color schemes
  call dein#add('chriskempson/base16-vim')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.config/nvim/bundle/repos/github.com/Shougo/dein.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" deoplete settings
let g:deoplete#enable_at_startup = 1

" deoplete-jedi settings
let g:deoplete#sources#jedi#show_docstring = 1
set completeopt-=preview
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
endfunction

" syntastic settings ---------------------------------------------------------
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

" Color scheme settings ------------------------------------------------------

" Status line settings

function Boldfile()
    let l:section_c = expand('%:p:h')
    let l:section_c .= '/%#airline_c_bold#'
    let l:section_c .= expand('%:t')
    let l:section_c .= '%#airline_c#'
    return l:section_c
endfunction

" autocmd VimEnter * call Boldfile()

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_section_b = ''
let g:airline_section_c = '%t'
let g:airline_section_z = 'ℓ %l/%L 𝚌 %c'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_skip_empty_sections = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


set termguicolors
let g:enable_bold_font = 1
let g:enable_italic_font = 1
set background=dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
let g:airline_theme = "base16"

" fzf settings
let g:fzf_layout = {'down': '100%'}

" Other settings -------------------------------------------------------------

" Set the size of the tab character in units of spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" Keep a minimum of some number of lines at the bottom of the screen so that
" you aren't always looking at the bottom of the screen.
set scrolloff=10

" Set incremental search and highlighting, which basically allows you
" to see the matches in a search as you type
set incsearch
set hlsearch

" Show the line and column number at the bottom of the screen
set ruler

" Show line numbers in the gutter
set nu

" Make searches case sensitive only if the search string contains uppercase
" characters
set ignorecase smartcase

" Highlight the current line
set cursorline

" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Show incomplete commands
set showcmd

" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

" If a file is changed outside of vim, automatically reload it without asking
set autoread

" Key mappings ---------------------------------------------------------------

" Get rid of highlighting when I hit the Enter key
nnoremap <CR> :nohlsearch<cr>
nnoremap <leader>t :FZF<cr>

" Make it easier to switch between splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

