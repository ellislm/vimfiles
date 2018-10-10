"if empty(glob('~/.vim/autoload/plug.vim'))
  "silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
"endif

call plug#begin('~/.vim/plugged')
"
" Git Tools
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'christoomey/vim-conflicted'

" Navigation, tools, misc.
"
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmhedberg/SimpylFold'
  Plug 'brooth/far.vim' " Search and Replace
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'majutsushi/tagbar'
  Plug 'scrooloose/nerdtree'
  Plug 'easymotion/vim-easymotion'
  Plug 'hetmankp/vim-signature'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'tpope/vim-repeat'
" Text Completion
"
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  Plug 'zchee/deoplete-clang'
  Plug 'Shougo/neoinclude.vim'
  " Plug 'ludovicchabant/vim-gutentags'" Autogenerate ctags
  "Plug 'ludovicchabant/vim-gutentags', {'tag':'v1.0.0'} " Autogenerate ctags

" Snippets
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'

" Themes and Aesthetics
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'morhetz/gruvbox'
  Plug 'bling/vim-bufferline'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Yggdroot/indentLine' " vertical lines for indent
  Plug 'freeo/vim-kalisi'

" Syntax Highlighting for all Languages
  Plug 'sheerun/vim-polyglot'

" Specifice Filetype tools
  "Plug 'taketwo/vim-ros'
  Plug 'lervag/vimtex'
  Plug 'lazywei/vim-matlab'
  Plug 'mindriot101/vim-yapf'
  Plug 'sbdchd/neoformat'
  Plug 'w0rp/ale'
  Plug 'vim-scripts/a.vim'

  " Vim Latex
  "Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
  Plug 'lervag/vimtex'
  "Plug 'donRaphaco/neotex'
  Plug 'mhinz/neovim-remote' " Needed for Vimtex

" Org Mode
  Plug 'jceb/vim-orgmode'
  Plug 'vim-scripts/utl.vim'
  Plug 'mattn/calendar-vim'
  Plug 'vim-scripts/SyntaxRange'
  Plug 'tpope/vim-speeddating'

" Vim Wiki
  Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'plasticboy/vim-markdown'

" For REPL Support for Python and others
  Plug 'BurningEther/iron.nvim', {'do': ':UpdateRemotePlugins'}

call plug#end()

let g:tmux_navigator_no_mappings = 1
set termguicolors
set nocompatible
set timeout timeoutlen=3000 ttimeoutlen=100
set autochdir "set current working dir with open file
set mouse=a
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
set runtimepath+=~/.vim/snippets/
let g:UltiSnipsExpandTrigger="<leader>u"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips",$HOME.'/.vim/custom_snippets']
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/custom_snippets'

"
" DEOPLETE AND CODE COMPLETION SETTINGS
" NEOMAKE
let g:deoplete#enable_at_startup = 1
" Use tab to cycle through list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:deoplete#enable_smart_case = 1

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

if has("unix")
  if system('uname')=~'Darwin'
    "let g:chromatica#libclang_path='/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib'
    let g:deoplete#sources#clang#libclang_path='/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib'
    let g:deoplete#sources#clang#clang_header='/usr/local/Cellar/llvm/5.0.0/lib/clang'
  else
    "let g:chromatica#libclang_path='/usr/lib/llvm-3.8/lib/libclang.so'
    let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-3.8/lib/libclang.so.1'
    let g:deoplete#sources#clang#clang_header='/usr/lib/llvm-3.8/lib/clang'
  endif
endif

" DEOPLETE



"  C++ Syntax Highlighting
"
"let g:cpp_no_function_highlight = 1
let g:cpp_member_variable_highlight = 1
"let g:cpp_experimental_template_highlight=1
"let g:cpp_experimental_template_highlight = 1
"let g:cpp_concepts_highlight = 1

" OPEN VIMRC IN HORIZONTAL SPLIT
" mapping that opens .vimrc in a split for quick editing
nnoremap <leader>ev :tabedit $HOME/.vim/vimrc<CR>
" mapping that sources the vimrc in the current file
"nnoremap <leader>sv :source $HOME/.vim/vimrc<CR>
"
" Clang format - auto formatting


"let g:clang_format#command = 'clang-format'
"let g:clang_format#style_options = {
            "\ "BreakBeforeBraces" : "Attach",
            "\ "UseTab" : "Never",
            "\ "IndentWidth" : 4,
            "\ "ColumnLimit" : 100,
            "\ "AccessModifierOffset" : -4,
            "\ "AllowShortIfStatementsOnASingleLine" : "false",
            "\ "AllowShortFunctionsOnASingleLine" : "false",
            "\}

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

"netrw = NERDTREE OH SHIT
"let g:NERDTreeQuitOnOpen = 1
" nerdtree open default if vim opened without file
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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

" Fix background color on gui vim
"let g:solarized_termcolors=256
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

autocmd BufRead,BufNewFile m,mat setlocal comments+=:%
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

"matlab Tools Code
filetype plugin indent on
source $VIMRUNTIME/macros/matchit.vim
autocmd BufEnter *.m    compiler mlint

"Zenmode
nnoremap <silent> <leader>g :Goyo<cr>
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
let g:goyo_width = 81
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

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
nnoremap <silent> ; :Commands<cr>
nnoremap <silent> <leader>b :Buffers <cr>
nnoremap <silent> <leader>t :Tags<cr>
nnoremap <silent> <leader>a :Ag<cr>
nnoremap <silent> <leader>h :History<cr>
nnoremap <silent> <leader>f :Files<CR>
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

nnoremap <leader>y :Neoformat<cr>
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
"set colorcolumn=120

nnoremap <C-P> :bnext<Cr>
nnoremap <C-S-P> :bnext<Cr>
map <C-b> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

" TAGBAR
nmap <C-n> :TagbarToggle<CR>

" Search and replace word under cursor with Far \s, then replace the words with
" \r
nnoremap <leader>s :Far <c-r><c-w> <c-r><c-w>
nnoremap <leader>r :Fardo<Cr>:q<Cr>

" TAB KEYBINDINGS
nnoremap tn :tabNext<Cr>
nnoremap tp :tabprevious<Cr>
nnoremap tc :tabnew<Cr>
nnoremap tx :tabclose<Cr>

nnoremap bn :bn<Cr>
nnoremap bp :bp<Cr>
let g:neosnippet#enable_completed_snippet=1

"Latex Tex Wrapping

" toggle wrapping with \w
"noremap <silent> <Leader>w :call ToggleWrap()<CR>
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

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb


"hi Cursor guifg=green guibg=green
"hi Cursor2 guifg=red guibg=red
"set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
"au VimLeave * set guicursor=a:block-blinkon0

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l


" ALE
let g:ale_linters = {'cpp': ['clang','cppcheck','clangtidy','cpplint']}
let g:ale_lint_on_enter = 1
let g:ale_cpp_cppcheck_options = '--enable=all'
let g:ale_cpp_cpplint_options = '--linelength=120'
" Write this in your vimrc file
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" EASY MOTION:
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Leader>e <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Always show gutter with vim-signature
let g:SignatureGutterAlwaysOn = 1

" Fix bug with limelight background
let g:limelight_conceal_ctermfg = 245  " Solarized Base1
let g:limelight_conceal_guifg = '#8a8a8a'  " Solarized Base1

" Use catkin build for vim-ros
"let g:ros_build_system = 'catkin-tools'

" DISABLE RANGER KEYBINDINGS
let g:ranger_map_keys = 0


"nnoremap [[ ?{w99[{
"nnoremap ][ /}b99]}
"nnoremap ]] j0[[%/{
"nnoremap [] k$][%?}
autocmd BufRead,BufNewFile *.tpp setfiletype cpp

"" Org Mode
""
"let g:org_heading_shade_leading_stars = 0
"let g:org_indent = 1

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

nnoremap <Leader>we :call vimwiki#base#follow_link('vsplit', 0, 1)<CR>

"au TermClose * nested call OnTermClose()
set ttyfast

" RANGE=R=
"let g:ranger_map_keys = 0
"map <C-n> :Ranger<CR>
"let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

" Open Help in Vertical Split
cabbrev h vert h

" LaTEX BIZNIZZ
let g:vimtex_compiler_progname = 'nvr'
let g:polyglot_disabled = ['latex']
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
let g:vimtex_complete_close_braces=0
let g:completor_tex_omni_trigger = g:vimtex#re#deoplete
let g:vimtex_fold_enabled=1
"
""set up default pdf viewer
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.tex let g:indentLine_enabled=0
let g:vimtex_view_method = 'skim'

"" A.Vim variables
let g:alternateSearchPath = 'sfr:../../src,sfr:../source,sfr:../src,sfr:../include,sfr:../inc'
let g:alternateExtensions_h = "cc,cpp,c,cxx,CC"


"" Vim Gutentags
let g:gutentags_project_root=['.tag_root']
let g:gutentags_exclude_project_root=['/usr/local','~/driving']
""  Neovim
"let g:neoformat_c_clang_format = {
          "\ 'exe': 'clang-format',
          "\ 'args': ['--style=Google'],
          "\ }
let g:neoformat_cpp_clang_format = {
          \ 'exe': 'clang-format-4.0',
          \ 'args': ['--style=file'],
          \ }
"let g:neoformat_enabled_c = ['clang_format']
"let g:neoformat_enabled_cpp = ['clang_format']
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
