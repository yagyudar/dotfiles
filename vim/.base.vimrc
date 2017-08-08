" vim:set ts=8 sts=2 sw=2 tw=0:

" gvimで'ja'となっていてPlugUpdate等のときにperlのwarningが出ていたので、
" 試しにこのように変えてみる。
let $LANG='ja_JP.UTF-8'

let mapleader='\'

" 20140404 crontab -e で編集できない現象への対応
set backupskip=/tmp/*,/private/tmp/*

" cygwin上でEscの反応を早くしたい 上手くいくかな？
set timeout timeoutlen=1000 ttimeoutlen=30

" trial: refs: http://qiita.com/yohawing/items/d04408a15f2f13176961
set wildignore+=*.exe,*.dll,*.so,*.bin,*.class,*.jar,*.zip,*.jpg,*.jpeg,*.gif,*.png

set shellslash
set shellpipe=2>\&1\|nkf\ -us>%s

"コマンドラインをEmacs風に編集する
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
":cnoremap <C-F> <Right>
":cnoremap <C-B> <Left>

" ctags使ってみる
set tags+=tags;
set tags+=$HOME/.tags/tags

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
set fileencoding=utf-8
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

set breakindent
" set breakindentopt=shift:1
set showbreak=\|\ 
" TODO: 暫定的にBufEnterでやる
aug BREAK_INDENT
  au!
  au BufEnter * hi NonText ctermfg=60 guifg=#5F5F87
aug END


" 勝手に末行を変更しない
" refs: https://github.com/vim-jp/issues/issues/152
silent! set nofixendofline

" .gvimrcにも書いてある。
set cursorline
hi clear CursorLine

let g:markdown_fenced_languages = [
\  'css',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'java=java',
\  'actionscript=actionscript',
\  'xml',
\]

""AutoChangeDirectory
aug CD
  au!
  " vimfilerを除外する
  " au BufEnter * if expand("%:p:h:t") != "vimfiler" | execute ":lcd " . expand("%:p:h") | endif
  au BufEnter * if expand("%:p:h:t") != "vimfiler" && expand("%:p") !~ '://' | execute ":lcd " . expand("%:p:h") | endif
aug END

" unix固有の設定
if has("win64") " 64bit_windows固有の設定
elseif has("win32unix") " Cygwin固有の設定
  "let &t_ti .= "\e[1 q"  " 端末を termcap モードにする
  let &t_SI .= "\e[5 q"  " 挿入モード開始(バー型のカーソル)
  let &t_EI .= "\e[1 q"  " 挿入モード終了(ブロック型カーソル)
  "let &t_te .= "\e[0 q"  " termcap モードから抜ける
elseif has("win32") " 32bit_windows固有の設定
  let g:unite_source_find_command="C:/cygwin/bin/find.exe"
endif

"----------------------------------------
" map
"----------------------------------------

" 折りたたみを使ってみる
nnoremap zz zR
nnoremap Z zM
vnoremap z zf
" l で折りたたみを開く
nnoremap <expr>l  foldclosed('.') != -1 ? 'zo' : 'l'

nmap ,w <C-w>

" test
nnoremap gl $
nnoremap gL $
nnoremap gh ^
nnoremap gH 0

nnoremap <C-h> 0
nnoremap <C-l> $
inoremap <C-j> <Esc>
nnoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
cnoremap <C-j> <Esc>
nnoremap <silent><SID>(gt) gt
nnoremap <silent><SID>(gT) gT
nnoremap <silent><C-j><C-j> :<C-u>call <SID>my_double_esc_function()<CR>
nnoremap <silent>gb :<C-u>bn<CR>
nnoremap <silent>gB :<C-u>bp<CR>
nnoremap Y y$
nnoremap <silent> ,r :<C-u>set relativenumber!<CR>
nnoremap <silent> <SPACE>r :<C-u>set relativenumber!<CR>

inoremap () ()<C-g>U<LEFT>
inoremap ()) ()
" inoremap ()( ()<C-g>U<LEFT>
inoremap {} {}<C-g>U<LEFT>
inoremap {}} {}
" inoremap {}{ {}<C-g>U<LEFT>
inoremap [] []<C-g>U<LEFT>
inoremap []] []
" inoremap [][ []<C-g>U<LEFT>
inoremap <>> <><C-g>U<LEFT>
inoremap <>> <>
" inoremap <>< <><C-g>U<LEFT>
" inoremap "" ""<C-g>U<LEFT>
" inoremap '' ''<C-g>U<LEFT>

nmap <tab> <C-w>w
nnoremap + ,
"nnoremap - ^
nnoremap - 0
nnoremap Y y$

" 関連付けされたプログラムで開く(Windowsのみ)
if has("win32")
  :command! Open :!start cmd /c %<CR>
endif

" 20140723
nnoremap <silent><Esc><Esc> :<C-u>call <SID>my_double_esc_function()<CR>
function! s:my_double_esc_function()
  QuickhlManualReset
  let @/ = '' "Nohlsearch
  set norelativenumber
endfunction

set cmdwinheight=6
augroup MyVimrc
  autocmd!
  autocmd FileType ref-webdict nnoremap <buffer> q <C-w>c
  autocmd FileType help nnoremap <buffer> q <C-w>c
  autocmd FileType qf nnoremap <buffer> q <C-w>c
  autocmd FileType qf nnoremap <buffer> p <CR>zz<C-w>p
  autocmd FileType w3m nnoremap <buffer><silent> q :W3mClose<CR>
  autocmd CmdwinEnter * nnoremap <buffer> qq <C-w>c
  autocmd CmdwinEnter * startinsert
  autocmd CmdwinEnter * set cmdheight=1
  autocmd CmdwinLeave * set cmdheight=2

  " md as markdown, instead of modula2
  autocmd BufNewFile,BufRead *.{md,mkd} set filetype=markdown
  " vue as vue
  autocmd BufNewFile,BufRead *.vue set filetype=html.vue

  if has('vim_starting')
    set runtimepath+=~/.vim/local/myplugin
  endif
augroup END

augroup MyAutoCmd
  autocmd!
augroup END


"netrw ---------------------------------
" let g:netrw_liststyle=3
augroup MyNETRW
  autocmd!
  autocmd FileType netrw nnoremap <buffer> q :<C-u>bd<CR>
  autocmd FileType netrw nmap <buffer> h -
  autocmd FileType netrw nmap <buffer> l <CR>
augroup END

"quickfix ------------------------------
map ,c [quickfix]
nnoremap [quickfix]c :<C-u>copen<CR>
nnoremap [quickfix]o :<C-u>copen<CR>
nnoremap [quickfix]n :<C-u>cn<CR>
nnoremap [quickfix]p :<C-u>cp<CR>
autocmd QuickfixCmdPost grep,grepadd if len(getqflist()) != 0 | copen | endif

"Action Script --------------------
au BufNewFile,BufRead *.as set ft=actionscript

" insertmode時、statuslineの色を変更 ----------
if !exists('g:hi_insert_statusline')
  let g:hi_insert_statusline = 'highlight StatusLine guifg=white guibg=darkcyan gui=none ctermfg=white ctermbg=darkcyan cterm=none'
endif
if !exists('g:hi_insert_linenr')
  let g:hi_insert_linenr = 'highlight LineNr ctermfg=67 guifg=#747bA1'
endif

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
let s:lnnrhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent! let s:lnnrhlcmd = 'highlight ' . s:GetHighlight('LineNr')
    silent exec g:hi_insert_statusline
    silent exec g:hi_insert_linenr
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
    highlight clear LineNr
    silent exec s:lnnrhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction


" zoom --------------------------------------------------
nnoremap <silent> <Plug>(my_zoom_in)  :<C-u>call <SID>Zoom( 1)<CR>
nnoremap <silent> <Plug>(my_zoom_out) :<C-u>call <SID>Zoom(-1)<CR>

noremap [zoom] <Nop>
map ,z [zoom]

function! s:Zoom(value)
  let l:fsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsize += a:value
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . l:fsize, '')
  let &guifont = l:guifont
endfunction

