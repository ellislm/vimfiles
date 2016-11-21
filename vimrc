if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
 Plug 'scrooloose/nerdcommenter'
 Plug 'Valloric/YouCompleteMe'
 Plug 'rdnetto/YCM-Generator', {'branch':'stable'}
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
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'altercation/vim-colors-solarized'
 Plug 'vim-latex/vim-latex'
 Plug 'majutsushi/tagbar'
 Plug 'bling/vim-bufferline'
 Plug 'jeaye/color_coded'
 Plug 'lazywei/vim-matlab'
call plug#end()

set nocompatible
set timeout timeoutlen=3000 ttimeoutlen=100
"airline Settings
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

let g:bufferline_echo = 0
 let g:airline_powerline_fonts = 1

 if !exists('g:airline_symbols')
     let g:airline_symbols = {}
     endif


"netrw = NERDTREE OH SHIT
let g:netrw_liststyle=3         " tree (change to 0 for thin)
let g:netrw_banner=0            " no banner
"let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically

"fun! VexToggle(dir)
  "if exists("t:vex_buf_nr")
    "call VexClose()
  "else
    "call VexOpen(a:dir)
  "endif
"endf

"fun! VexOpen(dir)
  "let g:netrw_browse_split=4    " open files in previous window
  "let vex_width = 25

  "execute "Vexplore " . a:dir
  "let t:vex_buf_nr = bufnr("%")
  "wincmd H

  "call VexSize(vex_width)
"endf

"fun! VexSize(vex_width)
  "execute "vertical resize" . a:vex_width
  "set winfixwidth
  "call NormalizeWidths()
"endf

"fun! NormalizeWidths()
  "let eadir_pref = &eadirection
  "set eadirection=hor
  "set equalalways! equalalways!
  "let &eadirection = eadir_pref
"endf
"fun! VexClose()
  "let cur_win_nr = winnr()
  "let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

  "1wincmd w
  "close
  "unlet t:vex_buf_nr

  "execute (target_nr - 1) . "wincmd w"
  "call NormalizeWidths()
"endf
"nnoremap <Leader><Tab> :call VexToggle(getcwd())<CR>
"augroup NetrwGroup
  "autocmd! BufEnter * call NormalizeWidths()
"augroup END
"
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END

"behave mswin
set t_Co=256
set cinoptions=g0
set cino+=(0,W4,t0
"set cinoptions=:0,l1,t0,g0,(0

set complete=.,w,b,u,t,i

set background=dark

" Function to reverse background
function! ReverseBackground()
  if &bg=="light"
    se bg=dark
  else
    se bg=light
  endif
endfunction
command! RevBG call ReverseBackground()
nnoremap <silent> <leader>r :RevBG<cr>

let g:solarized_termcolors=256
colorscheme solarized
"colorscheme gruvbox

set guifont=Hack
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=l  "remove left-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set foldmethod=syntax
set foldlevel=1000

"Delete white space on save

"Keep These
set expandtab
set smartindent
set autoindent
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
" ctags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
autocmd FileType cpp map <F4> :TlistToggle<cr>
autocmd FileType cpp map <buffer> <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
autocmd FileType cpp nmap <leader>t :TagbarToggle<CR>
se tags+=~/.ctags/tags


autocmd BufRead,BufNewFile *.tex call WrapIt()
",let g:vimtex_fold_enabled = 1,let g:vimtex_complete_close_braces = 1,

"nnoremap ` :GundoToggle<CR>

"Not sure but I think this is important
command! -range SwapArgs <line1>,<line2>s/(\([^,]\+\),\s*\([^,)]\+\)/(\2, \1/ | let @/ = ""


let g:loaded_ros = 1

map <F2> :Bufferlist<CR>

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

"Overrides Ctrl-J of vim-latex
augroup vimrc
    au!
    au VimEnter * unmap <C-j>
    au VimEnter * noremap <C-j> <C-w>j
    au VimEnter * vmap <C-g> <Plug>IMAP_JumpForward
    au VimEnter * nmap <C-g> <Plug>IMAP_JumpForward
    au VimEnter * imap <C-g> <Plug>IMAP_JumpForward
augroup END

"Vim-latex compile mode

let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats='pdf,bibtex,pdf'
let g:Tex_DefaultTargetFormat='pdf'

"Only apple shit:
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ViewRule_pdf = 'open -a Preview'
let g:Tex_ViewRule_dvi = 'open -a xdvi'

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 4/3)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 3/4)<CR>
nnoremap <silent> <C-,> <c-w> < <c-w> < <c-w> <
nnoremap <silent> <C-.> <c-w> > <c-w> > <c-w> >

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


""ctrl-space
set hidden

set history=100
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_auto_trigger = 1
let g:ctrlspace_use_mouse_and_arrows_in_term=0
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
\ }
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
set clipboard=unnamed
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
