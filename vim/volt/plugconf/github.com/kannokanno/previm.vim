function! s:on_load_pre()
  let g:previm_enable_realtime = 0
  let g:previm_show_header = 0
  " let g:previm_custom_css_path = '~/Desktop/mine.css'
  augroup PrevimSettings
    autocmd!
    autocmd FileType uiki set filetype=markdown | set filetype=uiki.markdown
  augroup END
endfunction

function! s:on_load_post()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *after* a plugin is loaded.
endfunction

function! s:loaded_on()
  return 'filetype=markdown'
endfunction

function! s:depends()
  return ['github.com/tyru/open-browser.vim']
endfunction