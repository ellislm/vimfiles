if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
 Plug 'scrooloose/nerdcommenter'
 Plug 'morhetz/gruvbox'
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-surround'
 Plug 'taketwo/vim-ros'
 Plug 'ntpeters/vim-better-whitespace'
 Plug 'junegunn/goyo.vim'
 Plug 'junegunn/limelight.vim'
 Plug 'christoomey/vim-tmux-navigator'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'vim-latex/vim-latex'
 Plug 'bling/vim-bufferline'
 Plug 'lazywei/vim-matlab'
 Plug 'tmhedberg/SimpylFold'
 Plug 'mindriot101/vim-yapf'
 Plug 'Yggdroot/indentLine' " vertical lines for indent
 Plug 'brooth/far.vim' " Search and Replace
 Plug 'donRaphaco/neotex'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 "Plug 'iCyMind/NeoSolarized'
 Plug 'freeo/vim-kalisi'
 Plug 'majutsushi/tagbar'
 Plug 'scrooloose/nerdtree'
 Plug 'roxma/nvim-completion-manager' " Vim Completion
 Plug 'ludovicchabant/vim-gutentags' " Autogenerate ctags
 Plug 'neomake/neomake' " Asyncrhonous Linting / Make
 Plug 'SirVer/ultisnips'
 "Plug 'vim-ctrlspace/vim-ctrlspace'
 "Plug 'roxma/ncm-clang'
 " For REPL Support for Python and others
 Plug 'BurningEther/iron.nvim', {'do': ':UpdateRemotePlugins'}
call plug#end()
let g:tmux_navigator_no_mappings = 1
set termguicolors

set autochdir "set current working dir with open file
set mouse=a
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader>u"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"nvim completion manager start with only one letter
" nvim complete use Tab
let g:cm_refresh_default_min_word_len=1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Ctrl-space setup to use AG
if executable("ag")
    let g:ctrlspaceglobcommand = 'ag -l --nocolor -g ""'
endif
" ctrlspace rebind for neovim
let g:ctrlspacedefaultmappingkey = "<c-space> "

""
"" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:rustfmt_autosave = 1
set nocompatible
set timeout timeoutlen=3000 ttimeoutlen=100
"airline Settings
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='kalisi'
let g:airline#extensions#tabline#enabled = 1

let g:bufferline_echo = 0
 let g:airline_powerline_fonts = 1

 if !exists('g:airline_symbols')
     let g:airline_symbols = {}
     endif

" Strip whitespace on save
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
"
"netrw = NERDTREE OH SHIT
let g:NERDTreeQuitOnOpen = 1
" nerdtree open default if vim opened without file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:netrw_liststyle=3         " tree (change to 0 for thin)
let g:netrw_banner=0            " no banner
"let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically

set t_Co=256
set cinoptions=g0
set cino+=(0,W4,t0
set complete=.,w,b,u,t,i

" Fix background color on gui vim
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE
set background=light

"" Function to reverse background
function! ReverseBackground()
  if &bg=="light"
    se bg=dark
  else
    se bg=light
  endif
endfunction
command! RevBG call ReverseBackground()
nnoremap <silent> <leader>r :RevBG<cr>

"let g:solarized_termcolors=256
"colorscheme NeoSolarized
colorscheme kalisi
"set bg=light
"colorscheme brogrammer
"colorscheme gruvbox

set guifont=Hack
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=l  "remove left-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set foldmethod=syntax
set foldlevel=1000

"Keep These
set expandtab
set autoindent
"set smartindent
set nosmartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2

set nu
set ruler

set nowrap
set hlsearch
set backupdir=~/.vim/backup

" Set the filetypes correctly
autocmd BufRead,BufNewFile *.launch setfiletype roslaunch
autocmd BufRead,BufNewFile *.urdf setfiletype xml
autocmd BufRead,BufNewFile *.xacro setfiletype xml
autocmd BufRead,BufNewFile *.cpf setfiletype xml
autocmd BufRead,BufNewFile *.test setfiletype xml
autocmd BufRead,BufNewFile *.sdf setfiletype xml
autocmd BufRead,BufNewFile *.world setfiletype xml
autocmd BufRead,BufNewFile *.moin setfiletype moin
autocmd BufRead,BufNewFile *.ops setfiletype cpp
autocmd BufRead,BufNewFile *.msg setfiletype ruby
autocmd BufRead,BufNewFile *.srv setfiletype ruby
autocmd BufRead,BufNewFile *.rosinstall setfiletype yaml

autocmd BufRead,BufNewFile m,mat setlocal comments+=:%
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

"matlab Tools Code
filetype indent on
source $VIMRUNTIME/macros/matchit.vim
autocmd BufEnter *.m    compiler mlint


runtime macros/matchit.vim
"""""""""""""""""""""""""""""""""
" line wrapping and movements
"""""""""""""""""""""""""""""""""

" toggle wrapping with \w
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    call UnwrapIt()
  else
    echo "Wrap ON"
    call WrapIt()
  endif
endfunction

function! WrapIt()
  set wrap linebreak
  set virtualedit=
  set breakat=\ ^I!@*-+;:,./?       " when wrapping, break at these characters (requires linbreak, see above)
  set showbreak=                    " character to show that a line is wrapped
  setlocal display+=lastline
  noremap  <buffer> <silent> k gk
  noremap  <buffer> <silent> j gj
  noremap  <buffer> <silent> <Up>   gk
  noremap  <buffer> <silent> <Down> gj
  noremap  <buffer> <silent> <Home> g<Home>
  noremap  <buffer> <silent> <End>  g<End>
  inoremap <buffer> <silent> <Up>   <C-o>gk
  inoremap <buffer> <silent> <Down> <C-o>gj
  inoremap <buffer> <silent> <Home> <C-o>g<Home>
  inoremap <buffer> <silent> <End>  <C-o>g<End>
endfunction

function! UnwrapIt()
  set nowrap
  set virtualedit=all
  silent! nunmap <buffer> j
  silent! nunmap <buffer> k
  silent! nunmap <buffer> <Up>
  silent! nunmap <buffer> <Down>
  silent! nunmap <buffer> <Home>
  silent! nunmap <buffer> <End>
  silent! iunmap <buffer> <Up>
  silent! iunmap <buffer> <Down>
  silent! iunmap <buffer> <Home>
  silent! iunmap <buffer> <End>
endfunction

if &wrap
  call WrapIt()
endif

autocmd BufRead,BufNewFile *.tex call WrapIt()
",let g:vimtex_fold_enabled = 1,let g:vimtex_complete_close_braces = 1,

"Not sure but I think this is important
"command! -range SwapArgs <line1>,<line2>s/(\([^,]\+\),\s*\([^,)]\+\)/(\2, \1/ | let @/ = ""

let g:loaded_ros = 1

let g:replay_record = 1
let g:replay_speed = 300

function! FU()
  r~/.vim/fu.txt
endfunction

nmap  :call FU()<CR>

"Zenmode
nnoremap <silent> <leader>z :Goyo<cr>
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
let g:goyo_width = 81
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

""Overrides Ctrl-J of vim-latex
"augroup vimrc
    "au!
    "au VimEnter * unmap <C-j>
    "au VimEnter * noremap <C-j> <C-w>j
    "au VimEnter * vmap <C-g> <Plug>IMAP_JumpForward
    "au VimEnter * nmap <C-g> <Plug>IMAP_JumpForward
    "au VimEnter * imap <C-g> <Plug>IMAP_JumpForward
"augroup END

"Vim-latex compile mode
"
" Compiler and viewer settings
"let g:tex_flavor='latex'
"let g:Tex_CompileRule_pdf = 'latexmk -pdf $*'
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_MultipleCompileFormats='pdf'
"let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
"let g:Tex_MultipleCompileFormats='pdf,bibtex,pdf'
"let g:Tex_DefaultTargetFormat='pdf'

""Only apple shit:
"let g:Tex_TreatMacViewerAsUNIX = 1
"let g:Tex_ViewRule_pdf = 'open -a Preview'
"let g:Tex_ViewRule_dvi = 'open -a xdvi'

"split navigations
nnoremap <silent> <p> "+y
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 4/3)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 3/4)<CR>
nnoremap <silent> <C-,> <c-w> < <c-w> < <c-w> <
nnoremap <silent> <C-.> <c-w> > <c-w> > <c-w> >

" FZF Key-bindings
nnoremap <silent> <leader>; :Commands<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>t :Tags<cr>
nnoremap <silent> <leader>a :Ag<cr>
"map <silent> ; :Commands<cr>

set splitbelow
set splitright

"Enable folding with spacebar
inoremap <C-s> <esc>:w!<CR>
nnoremap <C-s> :w!<CR>
nnoremap <space> za
nnoremap <Leader><Tab> :call VexToggle(getcwd())<CR>
map <C-p> "+p
map <C-c> "+y

inoremap <C-space> <esc>
nnoremap <C-T> :Files<CR>

nnoremap <leader>y :Yapf<cr>
tnoremap <Esc> <C-\><C-n>
tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<cr>
"
""ctrl-space
set hidden

set history=100
set clipboard+=unnamedplus

" Colored line for 120 characters in column
set colorcolumn=120
" Close buffer but keep window
command Bd bp | sp | bn | bd

nnoremap <C-P> :bnext<Cr>
nnoremap <C-S-P> :bnext<Cr>
map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>


" Neomake
call neomake#configure#automake('w') " run on save
" Full config: when writing or reading a buffer, and on changes in insert and
"call neomake#configure#automake('nrwi', 500)

" TAGBAR
nmap <C-b> :TagbarToggle<CR>

" Search and replace word under cursor using F4
nnoremap <leader>s :Far <c-r><c-w> <c-r><c-w>

nnoremap tn :tabNext<Cr>
nnoremap tp :tabprevious<Cr>
nnoremap tc :tabnew<Cr>
