"*****************************************************************************
"" NeoBundle core
"*****************************************************************************

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'bling/vim-airline'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle "majutsushi/tagbar"
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'Shougo/vimproc.vim', {'build':{'unix' : 'make -f make_unix.mak'}}
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'pbrisbin/vim-syntax-shakespeare'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'w0rp/ale'

"" Vim-Session
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'

"" Snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

"" Color
NeoBundle 'flazz/vim-colorschemes'

"" Vim-Bootstrap Updater
NeoBundle 'sherzberg/vim-bootstrap-updater'

"" C
NeoBundle 'vim-scripts/c.vim'

"" Javascript Bundle
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'

"" HTML Bundle
NeoBundle 'vim-scripts/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'tpope/vim-haml'

"" Python Bundle
NeoBundle "davidhalter/jedi-vim"
" NeoBundle "google/yapf", {'rtp': 'plugins/vim'}

"" Haskell
NeoBundle "eagletmt/neco-ghc"
NeoBundle "dag/vim2hs"

"" Elixir Lang Bundle
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'carlosgaldino/elixir-snippets'

"" Rust Lang Bundle
NeoBundle 'rust-lang/rust.vim'

"" Go Lang Bundle
NeoBundle "fatih/vim-go"

"" Erlang Bundle
NeoBundle "jimenezrick/vimerl"
NeoBundle 'edkolev/erlang-motions.vim'
NeoBundle 'vim-erlang/vim-erlang-runtime'
NeoBundle 'vim-erlang/vim-erlang-compiler'
NeoBundle 'vim-erlang/vim-erlang-omnicomplete'
NeoBundle 'vim-erlang/vim-erlang-tags'

"" Ruby Bundle
NeoBundle "tpope/vim-rails"
NeoBundle "tpope/vim-rake"
NeoBundle "tpope/vim-projectionist"
NeoBundle "thoughtbot/vim-rspec"

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

" Sets how many lines of history VIM has to remember
set history=7000

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" file type indent and plugins
filetype plugin indent on

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set binary
set ttyfast

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/zsh

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "yes"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number relativenumber
set background=dark

hi CursorLine   ctermbg=grey
hi LineNr       ctermfg=white	ctermbg=blue

colorscheme colorsbox-stbright

set mousemodel=popup
set t_Co=256
set nocursorline
set guioptions=egmrti
set gfn=Monospace\ 10

if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
else
  if $TERM == 'xterm'
    set term=xterm-256color
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

set gcr=a:blinkon0
set scrolloff=5
set laststatus=2
set wildmenu
set magic
set lazyredraw
set showmatch
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w! !sudo tee %
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq !sudo tee %
cnoreabbrev Wa wa
cnoreabbrev wQ wQ
cnoreabbrev WQ wq !sudo tee %
cnoreabbrev W w !sudo tee %
cnoreabbrev Q q
cnoreabbrev Qall qall

" NERD commentor
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_python = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


"" NERDTree configuration
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore = ['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread
set autowrite

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" session management
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'

" snippets
let g:UltiSnipsExpandTrigger = "<C-space>"
let g:UltiSnipsJumpForwardTrigger = "<C-space>"
let g:UltiSnipsJumpBackwardTrigger = "<C-s-space>"
let g:UltiSnipsEditSplit = "vertical"

" ALE
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_fixers = {
	\'python': ['yapf'],
	\'Javascript': ['eslint']
	\}

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
noremap <leader>x :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Tagbar
nmap <silent> <F4> :TagbarOpenAutoClose<CR>
let g:tagbar_autofocus = 1

" HTML
 autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Javascript
let g:javascript_enable_domhtmlcss = 1
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
" set conceallevel = 1
" let g:javascript_conceal_function             = "ƒ"
" let g:javascript_conceal_null                 = "ø"
" let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_arrow_function       = "⇒"

let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" vim-go
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_metalinter_autosave = 1
autocmd FileType go nmap gt  :GoAlternate!<CR>
autocmd FileType go nmap <leader>b  :GoBuild<CR>
autocmd FileType go nmap <leader>r  :GoRun %<CR>
autocmd FileType go nmap <leader>t  :GoTest<CR>
autocmd FileType go nmap gc  :GoCoverageToggle<CR>

" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

function PyFormat()
	let pos = getcurpos()
	% call yapf#YAPF()
	call setpos('.', pos)
endfunction

" autocmd BufWritePre *.py call PyFormat()

" jedi-vim
let g:jedi#completions_enabled = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"

let g:haskell_conceal_wide = 1
let g:haskell_multiline_strings = 1
let g:necoghc_enable_detailed_browse = 1
autocmd Filetype haskell setlocal omnifunc=necoghc#omnifunc

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }


"" Erlang configs
let erlang_folding = 1
let erlang_show_errors = 1

autocmd BufRead,BufNewFile *.erl,*.es.*.hrl,*.yaws,*.xrl set expandtab
au BufNewFile,BufRead *.erl,*.es,*.hrl,*.yaws,*.xrl setf erlang

"" Ruby Configs
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
