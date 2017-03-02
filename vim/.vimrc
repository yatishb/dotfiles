set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader=","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_max_files=0
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" My plugins
Plugin 'zopim/vim-jxml'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'

Plugin 'wesQ3/vim-windowswap'

" plugin from https://github.com/edkolev/tmuxline.vim
Plugin 'edkolev/tmuxline.vim'
" plugin from https://github.com/vim-airline/vim-airline#tmuxline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax enable
colorscheme monokai
set rnu
set nu
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cursorline

augroup vimrc
	autocmd!
augroup END
autocmd vimrc FileType javascript setlocal noexpandtab
autocmd vimrc FileType python setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd vimrc BufNewFile,BufRead *.jxml set filetype=javascript noexpandtab

:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
set statusline=%f

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_jxml_checkers = ['jxmlhint']

let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

" Ctrl-P
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules|bin$',
  \ 'file': '\v\.(exe|so|dll|swo|swp)$'
  \ }

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set wildmenu
set wildmode=list:full

"Remove trailing spaces before saving
autocmd vimrc BufWritePre * :%s/\s\+$//e

"Search within selected lines
function! RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
          \ '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>

" make backspace work
set backspace=2

set encoding=utf-8
set laststatus=2

" let g:tmuxline_powerline_separators = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#format = 1
let g:airline_theme = 'ravenpower'
let g:Powerline_symbols = 'fancy'

set guifont=Liberation\ Mono\ for\ Powerline\ 10

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

let g:tmuxline_preset = {
      \'a'    : '#S:#W',
      \'b disabled'    : '',
      \'c disabled'    : '',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', ''],
      \'x disabled'    : '',
      \'y'    : ['%a', '%Y-%m-%d'],
      \'z'    : '#(whoami)'}
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

"Tmuxline - :TmuxlineSnapshot! ~/.tmuxline.tmux.conf
