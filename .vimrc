"" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'Yggdroot/indentLine'
Plug 'gko/vim-coloresque'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-sleuth'

Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'ycm-core/YouCompleteMe'

Plug 'pearofducks/ansible-vim'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'tpope/vim-haml'

call plug#end()

let mapleader = ','

set hidden
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showcmd
set textwidth=120
set colorcolumn=120

" UI
set number relativenumber
set hlsearch
:set list lcs=tab:\¦\ 
set termguicolors
set background=dark
set term=xterm-256color
colorscheme dracula " alternative: gruvbox

" no one is really happy until you have this shortcuts
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

" Clipboard
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif

" Basic mappings
noremap <leader>s :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
noremap <leader>x :bd<CR>

" swap files
set directory^=~/.vim-swaps//
set backupdir^=~/.vim-backups//

" Autocmd rules
" The PC is fast enough, do syntax highlight syncing from start
augroup vimr-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
                \ exe "normal! g`\"" | endif
augroup END

set autowrite

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

" fzf
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :RgCword<CR>
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! RgFzfCword(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RgCword call RgFzfCword(expand("<cword>"), <bang>0)

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" NERDTree
nnoremap <silent> <leader>tt :NERDTreeToggle<CR>
nnoremap <silent> <leader>tf :NERDTreeFind<CR>

" Tagbar
nnoremap <silent> <leader>tg :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" neosnippet
let g:neosnippet#enable_snipmate_compatibility=1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#enable_completed_snippet=1

" vim-polyglot
let g:polyglot_disabled = ['yaml']

" ale
let g:ale_sign_error='✗'
let g:ale_sign_warning='⚠'
let g:ale_fix_on_save=1
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%]/[%severity%] %s'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['black', 'isort'],
\}

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_stop_completion = ['<C-y>', '<Enter>']

" rust
let g:rustfmt_autosave=1
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

" vim-go
let g:go_fmt_command="goimports"
let g:go_list_type="quickfix"
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_extra_types=1
let g:go_highlight_build_constraints=1
let g:go_highlight_generate_tags=1
let g:go_metalinter_autosave=1
autocmd FileType go nmap ga  :GoAlternate!<CR>
autocmd FileType go nmap gb  :GoBuild<CR>
autocmd FileType go nmap gr  :GoRun %<CR>
autocmd FileType go nmap gt  :GoTest<CR>
autocmd FileType go nmap gc  :GoCoverageToggle<CR>

" javascript
let g:javascript_enable_domhtmlcss=1
let g:jsx_ext_required=0
let g:javascript_plugin_flow=1

" HTML
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2


" YAML
autocmd Filetype yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
