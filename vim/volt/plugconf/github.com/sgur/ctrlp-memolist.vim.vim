function! s:on_load_pre()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *before* a plugin is loaded.
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
  \  'github.com/ctrlpvim/ctrlp.vim',
  \  'github.com/glidenote/memolist.vim'
  \]
endfunction