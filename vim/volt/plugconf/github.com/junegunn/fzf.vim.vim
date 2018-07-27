function! s:on_load_pre()
  nnoremap [fzf] <Nop>
  nmap ,f [fzf]
  nnoremap <silent> [fzf]f :call fzf#vim#files('', 0)<CR>
  nnoremap <silent> [fzf]g :call fzf#vim#gitfiles('', 0)<CR>
  nnoremap <silent> [fzf]b :call fzf#vim#buffers('', 0)<CR>
  nnoremap <silent> [fzf]a :call fzf#vim#ag('', 0)<CR>
  nnoremap <silent> [fzf]h :call fzf#vim#history(0)<CR>
  nnoremap <silent> [fzf]m :call fzf#vim#history(0)<CR>
  nnoremap <silent> [fzf]: :call fzf#vim#command_history(0)<CR>
  nnoremap <silent> [fzf]/ :call fzf#vim#search_history(0)<CR>
  nnoremap <silent> [fzf]' :call fzf#vim#marks(0)<CR>
endfunction

function! s:on_load_post()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *after* a plugin is loaded.
endfunction

function! s:loaded_on()
  " This function determines when a plugin is loaded.
  "
  " Possible values are:
  " * 'start' (a plugin will be loaded at VimEnter event)
  " * 'filetype=<filetypes>' (a plugin will be loaded at FileType event)
  " * 'excmd=<excmds>' (a plugin will be loaded at CmdUndefined event)
  " <filetypes> and <excmds> can be multiple values separated by comma.
  "
  " This function must contain 'return "<str>"' code.
  " (the argument of :return must be string literal)

  return 'start'
endfunction

function! s:depends()
  " Dependencies of this plugin.
  " The specified dependencies are loaded after this plugin is loaded.
  "
  " This function must contain 'return [<repos>, ...]' code.
  " (the argument of :return must be list literal, and the elements are string)
  " e.g. return ['github.com/tyru/open-browser.vim']

  return []
endfunction