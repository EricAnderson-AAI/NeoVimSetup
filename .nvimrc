" Maintainer:   Eric Anderson <http://twitter.com/evlsnoopy>
" Version:      0.2

scriptencoding utf-8

" Set up vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    au!
    au! VimEnter * PlugInstall
  augroup END
endif

" ===========
" Plugin List
" ===========

call plug#begin('~/.vim/plugged')

"Plug 'beardedprojamz/base16-vim'

" Iterm2 base16 themes
Plug 'chriskempson/base16-iterm2'

" Tim Pope Time
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
" Airline statusline
Plug 'bling/vim-airline'
" Airline Themes
Plug 'vim-airline/vim-airline-themes'
" NeoVim Syntax Checking
Plug 'benekastah/neomake'
" Teach a man to Fish
Plug 'dag/vim-fish', { 'for': 'fish' }
" Better Python Indenting
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" Less support
Plug 'groenewege/vim-less', { 'for': 'less' }
" Unite.vim for uniting all user interfaces
Plug 'Shougo/vimproc.vim', { 'do': function('fxns#MakeVimProc') }
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'     " Most recently used
Plug 'Shougo/unite-outline'  " Function/Class Outline
Plug 'tsukkee/unite-tag'     " Search ctags
" Dark-powered Auto completion
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
" Notice Git File changes
Plug 'airblade/vim-gitgutter'
" Autopairing
Plug 'jiangmiao/auto-pairs'
" Match HTML Tags
Plug 'Valloric/MatchTagAlways'
" Auto close HTML Tags
Plug 'alvan/vim-closetag'
" Emacs-style Bash Mappings in Command mode
Plug 'bruno-/vim-husk'
" Salt highlighting
Plug 'saltstack/salt-vim', { 'for': 'sls' }
" Puppet highlighting
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
" A directory tree explorer
Plug 'scrooloose/nerdtree'
" Show a diff via vim sign column
Plug 'mhinz/vim-signify'
" Vim motions on crack
Plug 'easymotion/vim-easymotion'
" Adds font icons to web developer file types
Plug 'ryanoasis/vim-devicons'
" Fuzzy finder
Plug 'kien/ctrlp.vim'
" Select and switch between buffers
Plug 'jeetsukumaran/vim-buffergator'
" Display tags in a side window
Plug 'majutsushi/tagbar'
" Lightning fast left-right movement
Plug 'unblevable/quick-scope'
" Hyperfocus writing
Plug 'junegunn/limelight.vim'
" Elixir for vim
Plug 'elixir-lang/vim-elixir'

"
" Themes
"
Plug 'flazz/vim-colorschemes'
Plug 'nickburlett/vim-colors-stylus'


let g:stylus_neutral_code_bg = 0 " 0 = gray (default), 1 = normal"
let g:stylus_higher_contrast_ui = 1 " 0 = low (default), 1 = high"




" =====================================
" Airline Settings
" =====================================

call plug#end()

" =============
" Basic Options
" =============

set wildmode=longest,list,full
set hidden
set nostartofline
set mouse=a
set nowrap
set ignorecase
set infercase
set smartcase
set autochdir
set tags=./tags;
set undolevels=1000
" Persistent undo
if !isdirectory($HOME.'/.vim/undo')
    call mkdir($HOME.'/.vim/undo', 'p')
endif
set undofile
set undodir=~/.vim/undo
" Keep temp files stored in one place
if !isdirectory($HOME.'/.vim/tmp')
    call mkdir($HOME.'/.vim/tmp', 'p')
endif
set directory=~/.vim/tmp
" Automatically insert comment leader on return,
" and let gq format comments
set formatoptions=rq

" Relative or absolute number lines
function! NumberToggle()
  if(&nu == 1)
    echo 'Relative number mode'
    set nu!
    set rnu
  else
    echo 'Absolute number mode'
    set nornu
    set nu
  endif
endfunction

nnoremap <C-n> :call NumberToggle()<CR>
nmap <F8> :TagbarToggle<CR>

" Automatically use absolute line numbers when we're in insert mode
" And relative numbers when we're in normal mode
" autocmd InsertEnter * :set nornu | :set nu
" autocmd InsertLeave * :set rnu | :set nu!

" =====================================
" Mappings, Commands, and Auto Commands
" =====================================

" ==========
" UI Options
" ==========

set hlsearch

" The default theme that is used by Airline is dark or light,
" depending on whether the background is set to dark or light
set background=dark

set number

" set cursorline
" Set cursorline colors
" hi CursorLine ctermbg=lightblue guibg=lightblue
" hi CursorLine ctermbg=Yellow guibg=Yellow

" hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
" hi CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

" Access colors present in 256 colorspace
" let base16colorspace=256

" Powerline font & symbol integration
let g:airline_powerline_fonts = 1

" =====================================
" Code color Settings
" =====================================
colorscheme stylus

" =====================================
" Airline Settings
" =====================================

" Enable Airline Theme
let g:airline_theme='base16'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" =====================================
" Mappings, Commands, and Auto Commands
" =====================================

let mapleader=','
set tabstop=4
set shiftwidth=4
" Map 'jk' to Esc key
inoremap jk <esc>
" Toggle Nerdtree with F2
nnoremap <F2> :NERDTreeToggle<CR>
" Edit .vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
" Simple Keybindings
nnoremap <Leader>c :close<CR>
nnoremap <Leader>w :write<CR>
nnoremap <Leader>q :quit!<CR>
nnoremap <Leader>d :bdelete!<CR>
nnoremap <Leader>. :only<CR>
nnoremap <C-j> i<CR><Esc>
" Write as sudo
" This is a test
command! W w !sudo tee % > /dev/null
" Shortcut for posting to slack channels
command! -range Slack <line1>,<line2> call fxns#Slack()
vnoremap <Leader>sl <Esc>:'<,'>:Slack<CR>
" System clipboard mappings
vnoremap <Leader>y "*y
vnoremap <Leader>x "*x
vnoremap <Leader>pp "*p
vnoremap <Leader>pP "*P
nnoremap <Leader>pp "*p
nnoremap <Leader>pP "*P
" Search visually selected text
vnoremap // y/<C-R>"<CR>"
" 'Parameters' Operator mapping
" Usage: dp - Delete between ()
onoremap p i(

augroup dotvimrc
  au!
  " Trim Whitespace before write
  au! BufWritePre * %s/\s\+$//e
  " Check syntastic on save
  au! BufWritePost * Neomake
  " Source Vimrc on save
  au! BufWritePost $MYVIMRC source $MYVIMRC
"        \| source ~/.vim/plugged/vim-neatstatus/after/plugin/neatstatus.vim
  " Reopen at last location
  au! BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != 'gitcommit'
        \| exe "normal! g'\"" | endif
augroup END

" =====================================
" Vim Buffer Settings
" =====================================

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" =====================================
" Buffergator Settings
" =====================================

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

" ===================
" Habit Breakers
" ===================

" Disabling the arrow keys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" =====================================
" Resizing window shortcuts
" =====================================

noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" ===================
" Neatstatus Settings
" ===================

"let g:NeatStatusLine_color_normal   = 'guifg=#ff0000 guibg=#5ab738 gui=NONE ctermfg=15 ctermbg=2  cterm=NONE'
"let g:NeatStatusLine_color_insert   = 'guifg=#f1efee guibg=#f22c40 gui=NONE ctermfg=15 ctermbg=1  cterm=NONE'
"let g:NeatStatusLine_color_replace  = 'guifg=#f1efee guibg=#407ee7 gui=NONE ctermfg=15 ctermbg=4  cterm=NONE'
"let g:NeatStatusLine_color_visual   = 'guifg=#f1efee guibg=#6666ea gui=NONE ctermfg=15 ctermbg=13 cterm=NONE'
"let g:NeatStatusLine_color_position = 'guifg=#f1efee guibg=#1b1918 gui=NONE ctermfg=15 ctermbg=0  cterm=NONE'
"let g:NeatStatusLine_color_modified = 'guifg=#f1efee guibg=#c33ff3 gui=NONE ctermfg=15 ctermbg=17 cterm=NONE'
"let g:NeatStatusLine_color_line     = 'guifg=#6666ea guibg=#1b1918 gui=NONE ctermfg=5  ctermbg=0  cterm=NONE'
"let g:NeatStatusLine_color_filetype = 'guifg=#f1efee guibg=#00ad9c gui=NONE ctermfg=15 ctermbg=6  cterm=NONE'

" ===========================
" Neomake Settings & Mappings
" ===========================

nnoremap <Leader>el :lopen<CR>

" =================
" Vim-plug Mappings
" =================

nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>
nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>ps :PlugStatus<CR>

" =========================
" Unite Settings & Mappings
" =========================

let g:unite_source_history_yank_enable = 1
let g:unite_data_directory = expand('~/.vim/cache/unite')
let g:neomru#file_mru_path = expand('~/.vim/cache/neomru/file')
let g:neomru#directory_mru_path = expand('~/.vim/cache/neomru/directory')
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden'
let g:unite_source_grep_recursive_opt = ''
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'winheight': 10
\ })
nnoremap <Leader>t :Unite -buffer-name=files   -start-insert file_rec/async:!<CR>
nnoremap <Leader>r :Unite -buffer-name=tags    -start-insert tag<CR>
nnoremap <Leader>/ :Unite -buffer-name=grep    -start-insert -no-quit grep<CR>
nnoremap <Leader>? :UniteWithCursorWord -buffer-name=grep    -no-quit grep<CR>
nnoremap <Leader>f :Unite -buffer-name=files   -start-insert file<CR>
nnoremap <Leader>F :Unite -buffer-name=files   -start-insert file/new<CR>
nnoremap <Leader>u :Unite -buffer-name=mru     -start-insert file_mru<CR>
nnoremap <Leader>o :Unite -buffer-name=outline -start-insert outline<CR>
nnoremap <Leader>L :Unite -buffer-name=buffer  -start-insert buffer<CR>
nnoremap <Leader>l :Unite -buffer-name=buffer  -quick-match  buffer<CR>
nnoremap <Leader>y :Unite -buffer-name=yank    history/yank<CR>

" =================
" Neomake Settings
" =================

let g:neomake_error_sign = {'text': '❗️', 'texthl': 'GitGutterAdd'}
let g:neomake_warning_sign = {'text': '❓', 'texthl': 'GitGutterAdd'}

" =================
" Deoplete Settings
" =================

let g:deoplete#enable_at_startup = 1

" ===============================
" Neosnippets Settings & Mappings
" ===============================

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" ===================
" Commentary Mappings
" ===================

nmap <Leader>, <Plug>CommentaryLine
vmap <Leader>, <Plug>Commentary

" =================
" Fugitive Mappings
" =================

nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>go :Gbrowse<CR>
nnoremap <Leader>gO :Gbrowse!<CR>
vnoremap <Leader>go :Gbrowse<CR>
vnoremap <Leader>gO :Gbrowse!<CR>
nnoremap <Leader>gs :Gstatus<CR>

" =================
" Easymotion Mappings
" =================

map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" =================
" Ctrlp Mappings
" =================

let g:ctrlp_working_path_mode = 'ra'

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


" =================
" Limelight Mappings
" =================
"
nmap <silent> gl :Limelight!!<CR>
xmap gl <Plug>(Limelight)
let g:limelight_conceal_guifg = '#171717'
let g:limelight_conceal_ctermfg = 238
set scrolloff=999

" vim:set ft=vim et sw=2:
