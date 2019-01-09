"if empty(glob('~/.vim/autoload/plug.vim'))
  "silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
"endif

call plug#begin('~/.vim/plugged')
"
" Git Tools
  Plug 'tpope/vim-fugitive'
  " Plug 'airblade/vim-gitgutter'
  " Plug 'christoomey/vim-conflicted'

" Navigation, tools, misc.
"
  Plug 'tpope/vim-surround'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmhedberg/SimpylFold'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'majutsushi/tagbar'
  Plug 'scrooloose/nerdtree'
  Plug 'easymotion/vim-easymotion'
  Plug 'hetmankp/vim-signature' " Show 'marks' in number column
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-commentary'

" Text Completion
  Plug 'Valloric/YouCompleteMe'

" Snippets
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'

" Themes and Aesthetics
  Plug 'bling/vim-bufferline' " Shows open buffers on airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Yggdroot/indentLine' " vertical lines for indent
  Plug 'freeo/vim-kalisi' " Vim Theme

" Syntax Highlighting for all Languages
  Plug 'sheerun/vim-polyglot'

" Specifice Filetype tools
  Plug 'lervag/vimtex'
  Plug 'lazywei/vim-matlab'
  Plug 'mindriot101/vim-yapf'
  Plug 'sbdchd/neoformat'
  Plug 'vim-scripts/a.vim'
  Plug 'rust-lang/rust.vim'

" Vim Latex
  Plug 'lervag/vimtex'
  Plug 'mhinz/neovim-remote' " Needed for Vimtex

" Vim Wiki
  Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
  Plug 'vimwiki/utils'
  Plug 'mattn/calendar-vim'
  Plug 'vim-scripts/utl.vim'
  Plug 'vim-scripts/SyntaxRange'
call plug#end()

let g:tmux_navigator_no_mappings = 1
set termguicolors
set nocompatible
set timeout timeoutlen=3000 ttimeoutlen=100
set autochdir "set current working dir with open file
set mouse=a

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
set runtimepath+=~/.vim/snippets/
let g:UltiSnipsExpandTrigger="<C-g>"
let g:UltiSnipsJumpForwardTrigger="<C-g>"
let g:UltiSnipsJumpBackwardTrigger="<C-a>"

" YouCompleteMe Settings
let g:ycm_extra_conf_globlist = ['~/*']
nnoremap <leader>g :YcmCompleter GoTo<CR>
set pumheight=6

" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"  C++ Syntax Highlighting
"
let g:cpp_member_variable_highlight = 1

" OPEN VIMRC
nnoremap <leader>v :tabedit $HOME/.vim/vimrc<CR>

"
"Airline Settings
"
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='kalisi'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
" Get rid of encoding
let g:airline_section_y=''
let g:bufferline_echo = 0
let g:airline_powerline_fonts = 1

 if !exists('g:airline_symbols')
     let g:airline_symbols = {}
 endif

" Strip whitespace on save
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Netrw prettiness
let g:netrw_liststyle=3         " tree (change to 0 for thin)
let g:netrw_banner=0            " no banner
"let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically

set t_Co=256
set cinoptions=g0
set cino+=(0,W4,t0
set complete=.,w,b,u,t,i

"" Function to reverse background
function! ReverseBackground()
  if &bg=="light"
    se bg=dark
  else
    se bg=light
  endif
endfunction
command! RevBG call ReverseBackground()

" COLORSCHEMES
"colorscheme NeoSolarized
colorscheme kalisi
"set bg=light
"colorscheme brogrammer
"colorscheme gruvbox

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
set background=dark

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

" Avoid those cached tmp files
set backupdir=~/.vim/backup

" Set the filetypes correctly
autocmd BufRead,BufNewFile *.launch setfiletype roslaunch
"autocmd BufRead,BufNewFile *.rosinstall setfiletype yaml
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

autocmd BufRead,BufNewFile *.cpp set colorcolumn=120
autocmd BufRead,BufNewFile *.cc set colorcolumn=120
autocmd BufRead,BufNewFile *.cpp set colorcolumn=120
autocmd BufRead,BufNewFile *.h set colorcolumn=120
autocmd BufRead,BufNewFile *.py set colorcolumn=120
autocmd BufRead,BufNewFile *.tpp set filetype=cpp

" Set correct commenting in cpp files
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

autocmd BufRead,BufNewFile m,mat setlocal comments+=:%
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

"matlab Tools Code
filetype plugin indent on
source $VIMRUNTIME/macros/matchit.vim
autocmd BufEnter *.m    compiler mlint

set splitbelow
set splitright
set diffopt+=vertical


" FZF Key-bindings
nnoremap <silent> ; :Commands<cr>
nnoremap <silent> <leader>b :Buffers <cr>
nnoremap <silent> <leader>t :Tags<cr>
nnoremap <silent> <leader>h :History<cr>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>a :A<cr>

"Enable folding with spacebar
inoremap <C-s> <esc>:w!<CR>
nnoremap <C-s> :w!<CR>
nnoremap <space> za
nnoremap <Leader><Tab> :call VexToggle(getcwd())<CR>
map <C-p> "+p
map <C-c> "+y

" Misc Mappings
inoremap <C-space> <esc>
nnoremap <silent> <p> "+y


"" TMuxinator navigation settings
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>

" NVim terminal bindings
tnoremap <Esc> <C-\><C-n>
tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<cr>


""ctrl-space
" set hidden
" set history=100
" set clipboard+=unnamedplus

" Colored line for 120 characters in column
set colorcolumn=120


" Nerdtree/Tab Toggle
map <C-b> :NERDTreeToggle<CR>
nmap <C-n> :TagbarToggle<CR>
nnoremap <leader>y :Neoformat<cr>

" TAB KEYBINDINGS
nnoremap tn :tabNext<Cr>
nnoremap tp :tabprevious<Cr>
nnoremap tc :tabnew<Cr>
nnoremap tx :tabclose<Cr>

" Buffer next and previous
nnoremap bn :bn<Cr>
nnoremap bp :bp<Cr>

" Line Wrapping Function
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

" Turn Off Swap Files (.swap)
set noswapfile
set nobackup
set nowb

" provide hjkl movements in Insert mode via the <Ctrl> modifier key
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Write this in your vimrc file
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" EASY MOTION:
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
nmap <Leader>e <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" VIMWIKI
"
let g:vimwiki_folding = 'expr'
let g:vimwiki_hl_headers =1
let g:vimwiki_list = [{'path': '~/vimwiki/',
                     \ 'syntax': 'markdown', 'ext': '.md'}]
let g:pandoc#syntax#conceal#urls=1
let g:pandoc#syntax#codeblocks#embeds#langs = ["python", "bash=sh","cpp"]
let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
let g:vim_markdown_math = 1

autocmd BufRead,BufNewFile *.md let g:indentLine_enabled=0
autocmd BufRead,BufNewFile *.md set wrap
" Open a Vim Wiki link in a split
nnoremap <Leader>we :call vimwiki#base#follow_link('vsplit', 0, 1)<CR>


"au TermClose * nested call OnTermClose()
" set ttyfast " Fix bug?

" RANGER=
let g:ranger_map_keys = 0
nnoremap <leader>r :Ranger<Cr>
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

" Open Help in Vertical Split
cabbrev h vert h

"" A.Vim variables
let g:alternateSearchPath = 'sfr:../../src,sfr:../source,sfr:../src,sfr:../include,sfr:../inc'
let g:alternateExtensions_h = "cc,cpp,c,cxx,CC"

" YouCompleteMe
cabbrev Gdef YcmCompleter GoToDefinition

""  Neovim
"let g:neoformat_c_clang_format = {
          "\ 'exe': 'clang-format',
          "\ 'args': ['--style=Google'],
          "\ }
let g:neoformat_cpp_clang_format = {
          \ 'exe': 'clang-format',
          \ 'args': ['--style=file'],
          \ }

" RUST
let g:rustfmt_autosave = 1

" Neoformat
" format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
