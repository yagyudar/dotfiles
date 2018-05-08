function! s:on_load_pre()
  let g:vim_markdown_folding_disabled=1
endfunction

function! s:on_load_post()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *after* a plugin is loaded.
endfunction

function! s:loaded_on()
  return 'filetype=markdown'
endfunction

function! s:depends()
  return []
endfunction