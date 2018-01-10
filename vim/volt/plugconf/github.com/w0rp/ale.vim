function! s:config()
  " Plugin configuration like the code written in vimrc.
  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'typescript': ['eslint'],
  \   'css': ['stylelint'],
  \}
  let g:ale_sign_error = 'E'
  let g:ale_sign_warning = 'W'
  let g:ale_maximum_file_size = 500000
  " let g:ale_sign_column_always = 1
  set signcolumn=yes
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