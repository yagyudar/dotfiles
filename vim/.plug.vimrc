" vim:set ts=8 sts=2 sw=2 tw=0:

if has('vim_starting')
  set runtimepath+=~/.vim/plug/vim-plug
endif

call plug#begin('~/.vim/plug/plugged')

" main
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kana/vim-submode'
Plug 'kannokanno/previm', { 'for': 'markdown' }
Plug 'tyru/open-browser.vim', { 'for': 'markdown' }
Plug 'haya14busa/vim-asterisk'
Plug 'h1mesuke/vim-alignta'

" sub
Plug 'ap/vim-css-color'
Plug 'deris/parajump'
Plug 'glidenote/memolist.vim'
Plug 'itchyny/vim-cursorword'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'pocke/accelerated-smooth-scroll'
Plug 'sgur/ctrlp-memolist.vim'
Plug 't9md/vim-quickhl'
Plug 'thinca/vim-showtime'
Plug 'thinca/vim-zenspace'
Plug 'terryma/vim-expand-region'

" Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-jabraces'
Plug 'kana/vim-textobj-line'

" trial
Plug 'cocopon/vaffle.vim'
Plug 'machakann/vim-sandwich'
Plug 'w0rp/ale'

Plug 'LeafCage/yankround.vim'
Plug 'leafgarland/typescript-vim'
Plug 'digitaltoad/vim-pug'

Plug 'Shougo/context_filetype.vim'
Plug 'osyo-manga/vim-precious'
" Plug 'posva/vim-vue', { 'for': 'vue' }
" Plug 'Quramy/tsuquyomi'
" Plug 'Quramy/tsuquyomi-vue', { 'for': 'vue' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'haya14busa/vim-edgemotion'

" Plug 'thinca/vim-quickrun'
" Plug 'thinca/vim-qfreplace'
" Plug 'saihoooooooo/vim-textobj-space'
" Plug 'thinca/vim-textobj-between'

" syntax
Plug 'rcmdnk/vim-markdown'
Plug 'timcharper/textile.vim'
Plug 'aklt/plantuml-syntax'
Plug 'wavded/vim-stylus'
" Plug 'HybridText'

" colorscheme
Plug 'cocopon/iceberg.vim'

call plug#end()

if has('win32unix') || has('mac')
  set t_Co=256
  set t_ut=
  set notitle
endif
colorscheme iceberg

