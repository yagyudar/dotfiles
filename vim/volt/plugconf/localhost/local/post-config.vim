function! s:on_load_pre()
  """"""""""""""""""""""""""""""
  " submode
  """"""""""""""""""""""""""""""
  " タブ移動
  call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
  call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
  call submode#map('changetab', 'n', '', 't', 'gt')
  call submode#map('changetab', 'n', '', '<tab>', 'gt')
  call submode#map('changetab', 'n', '', 'T', 'gT')
  call submode#map('changetab', 'n', '', '<S-tab>', 'gT')
  " バッファ移動
  call submode#enter_with('changebuf', 'n', '', 'gb', ':<C-u>bn<CR>')
  call submode#enter_with('changebuf', 'n', '', 'gB', ':<C-u>bp<CR>')
  call submode#map('changebuf', 'n', '', 'b', ':<C-u>bn<CR>')
  call submode#map('changebuf', 'n', '', 'B', ':<C-u>bp<CR>')
  " ウィンドウサイズ変更
  call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
  call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
  call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
  call submode#map('winsize', 'n', '', '>', '<C-w>>')
  call submode#map('winsize', 'n', '', '<', '<C-w><')
  call submode#map('winsize', 'n', '', '+', '<C-w>-')
  call submode#map('winsize', 'n', '', '-', '<C-w>+')
  call submode#enter_with('zoom', 'n', 'r', '[zoom]')
  call submode#map('zoom', 'n', 'r', '+', '<Plug>(my_zoom_in)')
  call submode#map('zoom', 'n', 'r', '-', '<Plug>(my_zoom_out)')
  """"""""""""""""""""""""""""""

  """"""""""""""""""""""""""""""
  " superleader
  """"""""""""""""""""""""""""""
  " superleader
  map <Space> [superleader]
  map [superleader] [ctrlp]
  map [superleader]<Space> [ctrlp]b
  nmap [superleader]c [ctrlp]x
  " nmap [superleader]m [fzf]m
  nmap [superleader]m [ctrlp]m
  nmap [superleader]n [memolist]
  nmap [superleader]s [terminal]s
  nmap [superleader]t [terminal]t
  nmap [superleader]: q:
  nmap [superleader]w <C-w>
  nmap [superleader]* [quickhl]*
  xmap [superleader]* [quickhl]*
  nmap [superleader]# [quickhl]#
  xmap [superleader]# [quickhl]#
  """"""""""""""""""""""""""""""
endfunction

function! s:on_load_post()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *after* a plugin is loaded.
endfunction

function! s:loaded_on()
  return 'start'
endfunction

function! s:depends()
  return [
  \  'github.com/tyru/open-browser.vim',
  \  'github.com/ctrlpvim/ctrlp.vim',
  \  'github.com/sgur/ctrlp-memolist.vim',
  \  'github.com/glidenote/memolist.vim',
  \  'github.com/t9md/vim-quickhl'
  \]
endfunction