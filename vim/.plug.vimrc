" vim:set ts=8 sts=2 sw=2 tw=0:

" unix固有の設定

let s:is_win32 = has('win32')
let s:is_win64 = has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_win32 && !s:is_win64 && !s:is_cygwin
      \ && (has('mac') || has('macunix') || has('gui_macvim') ||
      \   (!isdirectory('/proc') && executable('sw_vers')))

if s:is_win64
elseif s:is_cygwin
  let g:vimproc#dll_path=$HOME . '/.vim/plug/plugged/vimproc.vim/lib/vimproc_cygwin.dll'
elseif s:is_win32
  let g:vimproc#dll_path=$HOME . '/.vim/plug/plugged/vimproc.vim/lib/vimproc_win32.dll'
endif

let g:build_vimproc_command=''
if s:is_win32
  let g:build_vimproc_command='tools\\update-dll-mingw 32'
elseif s:is_win64
  let g:build_vimproc_command='tools\\update-dll-mingw 64'
elseif s:is_cygwin
  let g:build_vimproc_command='make -f make_cygwin.mak'
elseif s:is_mac
  let g:build_vimproc_command='make -f make_mac.mak'
else
  let g:build_vimproc_command='make -f make_unix.mak'
endif

if has('vim_starting')
  set runtimepath+=~/.vim/plug/vim-plug
endif

call plug#begin('~/.vim/plug/plugged')

Plug 'Shougo/vimproc.vim', { 'do': g:build_vimproc_command }

" main
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kana/vim-submode'
Plug 'kannokanno/previm', { 'for': 'markdown' }
Plug 'tyru/open-browser.vim', { 'for': 'markdown' }
Plug 'haya14busa/vim-asterisk'
Plug 'haya14busa/incsearch.vim'
Plug 'h1mesuke/vim-alignta'

" sub
Plug 'ap/vim-css-color'
Plug 'deris/parajump'
Plug 'glidenote/memolist.vim'
Plug 'itchyny/vim-cursorword'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pocke/accelerated-smooth-scroll'
Plug 'sgur/ctrlp-memolist.vim'
Plug 't9md/vim-quickhl'
Plug 'thinca/vim-showtime'
Plug 'thinca/vim-zenspace'

" Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-jabraces'
Plug 'kana/vim-textobj-line'

" trial
" Plug 'cohama/lexima.vim'
Plug 'cocopon/vaffle.vim'
Plug 'machakann/vim-sandwich'
Plug 'osyo-manga/vim-hopping'
Plug 'w0rp/ale'
Plug 'LeafCage/yankround.vim'

" Plug 'justinmk/vim-dirvish'
" Plug 'thinca/vim-quickrun'
" Plug 'mattn/vim-terminal'
" Plug 'osyo-manga/vim-over'
" Plug 'thinca/vim-qfreplace'
" Plug 'saihoooooooo/vim-textobj-space'
" Plug 'thinca/vim-textobj-between'

" syntax
Plug 'rcmdnk/vim-markdown'
Plug 'timcharper/textile.vim'
" Plug 'othree/yajs.vim'
Plug 'aklt/plantuml-syntax'
Plug 'wavded/vim-stylus'
" Plug 'posva/vim-vue'
" Plug 'othree/html5.vim'
" Plug 'HybridText'
" Plug 'JavaScript-syntax'

" colorscheme
Plug 'cocopon/iceberg.vim'

call plug#end()

if has('win32unix') || has('mac')
  set t_Co=256
  set t_ut=
  set notitle
endif
colorscheme iceberg

