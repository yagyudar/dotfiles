" vim:set ts=8 sts=2 sw=2 tw=0:

"---------------------------------------------------------------------------
" ファイルタイプの検出
"
augroup MyFiletype
  autocmd!
  " md as markdown, instead of modula2
  autocmd BufNewFile,BufRead *.{md,mkd} set filetype=markdown
  " vue as vue
  autocmd BufNewFile,BufRead *.vue set filetype=vue
  " autocmd BufNewFile,BufRead *.vue set filetype=html.vue
augroup END

"---------------------------------------------------------------------------
" set
"
" 検索の挙動に関する設定:
set ignorecase
set smartcase

" 編集に関する設定:
set tabstop=4
set noexpandtab
set autoindent
set backspace=indent,eol,start
set wrapscan
set showmatch
set wildmenu
set formatoptions+=mM

" GUI固有ではない画面表示の設定:
set number
set ruler
set list
"set listchars=tab:>-,extends:<,trail:-,eol:<
"set listchars=tab:^\ ,eol:_
set listchars=tab:>\ ,trail:-
set wrap
set laststatus=2
set cmdheight=2
set showcmd
set title

" その他:
set shellslash
set shellpipe=2>\&1\|nkf\ -us>%s
set helplang=ja,en
set showtabline=2
set guioptions-=T "ツールバー非表示
set guioptions-=m "メニューバー非表示
set smartindent
set shiftwidth=4
set noscrollbind
set directory=$HOME/.vim/swap
set backupdir=$HOME/.vim/backup
set undodir=$HOME/.vim/undo
set fileencodings=utf-8,cp932
set fileencoding=utf-8
set fileencodings=utf-8,cp932
set fileformats=unix,dos
set fileformat=unix
" set statusline=%t\ %m\ %=[%Y\ %{&ff}\ %{&fileencoding}]\ %l/%L\ %p%%
set statusline=[%{mode()}]\ %t\ %m\ %=[%Y\ %{&ff}\ %{&fileencoding}]\ %l/%L\ %p%%
set splitbelow
set splitright
set nrformats="alpha,hex"
set diffopt=vertical
set history=100
set virtualedit+=block "test:矩形ヴィジュアルモードで仮想編集ON
set grepprg=jvgrep
set ttyfast
set ambiwidth=double
set synmaxcol=200
set breakindent
" set breakindentopt=shift:1
set showbreak=\|\ 
set cmdwinheight=6
set cursorline
silent! set nofixendofline

" お試し中:
" 20140404 crontab -e で編集できない現象への対応
set backupskip=/tmp/*,/private/tmp/*
" cygwin上でEscの反応を早くしたい 上手くいくかな？
set timeout timeoutlen=1000 ttimeoutlen=30
" trial: refs: http://qiita.com/yohawing/items/d04408a15f2f13176961
set wildignore+=*.exe,*.dll,*.so,*.bin,*.class,*.jar,*.zip,*.jpg,*.jpeg,*.gif,*.png
" ctags使ってみる
set tags+=tags;
set tags+=$HOME/.tags/tags

"---------------------------------------------------------------------------
" map
"
nmap ,w <C-w>
nmap <tab> <C-w>w
"nnoremap - ^
nnoremap - 0
nnoremap Y y$
nnoremap + ,
nnoremap gl $
nnoremap gL $
nnoremap gh ^
nnoremap gH 0
nnoremap Y y$

"コマンドラインをEmacs風に編集する
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
":cnoremap <C-F> <Right>
":cnoremap <C-B> <Left>

" 折りたたみを使ってみる
nnoremap zz zR
nnoremap Z zM
vnoremap z zf
" l で折りたたみを開く
nnoremap <expr>l  foldclosed('.') != -1 ? 'zo' : 'l'

" nnoremap <silent><SID>(gt) gt
" nnoremap <silent><SID>(gT) gT
" nnoremap <silent>gb :<C-u>bn<CR>
" nnoremap <silent>gB :<C-u>bp<CR>
" nnoremap <silent> ,r :<C-u>set relativenumber!<CR>
" nnoremap <silent> <SPACE>r :<C-u>set relativenumber!<CR>

"---------------------------------------------------------------------------
" ファイルタイプごとの設定
"
augroup MyVimrc
  autocmd!
  autocmd FileType help nnoremap <buffer> q <C-w>c
  autocmd FileType qf nnoremap <buffer> q <C-w>c
  autocmd FileType qf nnoremap <buffer> p <CR>zz<C-w>p
  autocmd FileType netrw nnoremap <buffer> q :<C-u>bd<CR>
  autocmd FileType netrw nmap <buffer> h -
  autocmd FileType netrw nmap <buffer> l <CR>
  autocmd CmdwinEnter * nnoremap <buffer> qq <C-w>c
  autocmd CmdwinEnter * startinsert
  autocmd CmdwinEnter * set cmdheight=1
  autocmd CmdwinLeave * set cmdheight=2
augroup END

" markdown
let g:markdown_fenced_languages = [
\  'css',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'java=java',
\  'xml',
\]

"---------------------------------------------------------------------------
" vim機能のショートカット

" quickfix
map ,c [quickfix]
nnoremap [quickfix]c :<C-u>copen<CR>
nnoremap [quickfix]o :<C-u>copen<CR>
nnoremap [quickfix]n :<C-u>cn<CR>
nnoremap [quickfix]p :<C-u>cp<CR>
autocmd QuickfixCmdPost grep,grepadd if len(getqflist()) != 0 | copen | endif

" terminal
noremap [terminal] <Nop>
map ,t [terminal]
nnoremap <silent> [terminal]c : <C-u>terminal ++curwin ++close<CR>
nnoremap <silent> [terminal]t : <C-u>terminal ++curwin ++close<CR>
nnoremap <silent> [terminal]b : <C-u>terminal ++curwin ++close bash<CR>
nnoremap <silent> [terminal]s : <C-u>terminal ++curwin ++close bash<CR>
tnoremap <C-w><Esc> <C-w>N
tnoremap <Esc><Esc> <C-w>N

"---------------------------------------------------------------------------
" 見栄えの調整
"
aug BREAK_INDENT
  au!
  au BufEnter * hi NonText ctermfg=60 guifg=#5F5F87
aug END

"---------------------------------------------------------------------------
" プラグイン的な動作
" エスケープ二つでいろいろクリアする
"
nnoremap <silent><Esc><Esc> :<C-u>call <SID>my_double_esc_function()<CR>
function! s:my_double_esc_function()
  QuickhlManualReset
  let @/ = '' "Nohlsearch
  set norelativenumber
endfunction

"---------------------------------------------------------------------------
" プラグイン的な動作
" AutoChangeDirectory
"
aug CD
  au!
  au BufEnter * if  expand("%:p") !~ '\(://\|^!\)' | execute ":lcd " . expand("%:p:h") | endif
aug END

"---------------------------------------------------------------------------
" プラグインを有効にする (決まり文句)
"
filetype plugin indent on 
