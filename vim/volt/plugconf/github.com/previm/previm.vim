function! s:on_load_pre()
  " let g:previm_enable_realtime = 0
  let g:previm_show_header = 0
  augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.uiki set filetype=markdown
    " autocmd BufNewFile,BufRead *.uiki set filetype=uiki.markdown
  augroup END
endfunction

function! s:on_load_post()
endfunction

function! s:loaded_on()
  " return 'filetype=markdown'
  return 'start'
endfunction

function! s:depends()
  return ['github.com/tyru/open-browser.vim']
endfunction