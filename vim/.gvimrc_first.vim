" vim:set ts=8 sts=2 sw=2 tw=0:

let g:gvimrc_first_finish = 1

"---------------------------------------------------------------------------
" フォント設定:
"
if has('win32')
  set guifont=MS_Gothic:h9:cSHIFTJIS
  " 行間隔の設定
  set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  set ambiwidth=auto
endif

"---------------------------------------------------------------------------
" ウインドウに関する設定:
"
" ウインドウの幅
set columns=130
" ウインドウの高さ
set lines=70
" コマンドラインの高さ(GUI使用時)
set cmdheight=2

"---------------------------------------------------------------------------
" マウスに関する設定:
"
" どのモードでもマウスを使えるようにする
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide

