" vim:set ts=8 sts=2 sw=2 tw=0:

if has('vim_starting')
  set runtimepath+=~/.vim/plug/vim-plug
endif

call plug#begin('~/.vim/plug/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'kana/vim-submode'
Plug 'previm/previm', { 'for': 'markdown' }
Plug 'tyru/open-browser.vim', { 'for': 'markdown' }
Plug 'haya14busa/vim-asterisk'
Plug 'itchyny/vim-cursorword'
Plug 'nathanaelkane/vim-indent-guides'
Plug 't9md/vim-quickhl'
Plug 'thinca/vim-zenspace'
Plug 'kana/vim-textobj-user'
Plug 'cocopon/vaffle.vim'
Plug 'machakann/vim-sandwich'
Plug 'w0rp/ale'
Plug 'LeafCage/yankround.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/context_filetype.vim'
Plug 'osyo-manga/vim-precious'
Plug 'cohama/vim-insert-linenr'
Plug 'junegunn/vim-easy-align'
Plug 'lilydjwg/colorizer'
Plug 'unblevable/quick-scope'

" syntax
Plug 'rcmdnk/vim-markdown'

" colorscheme
Plug 'cocopon/iceberg.vim'

call plug#end()

if has('win32unix') || has('mac')
  set t_Co=256
  set t_ut=
  set notitle
endif
colorscheme iceberg

