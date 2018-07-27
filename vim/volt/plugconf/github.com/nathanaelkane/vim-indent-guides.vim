function! s:on_load_pre()
  " Plugin configuration like the code written in vimrc.
  let g:indent_guides_enable_on_vim_startup = 1
  " let g:indent_guides_color_change_percent = 5
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_exclude_filetypes = ['help', 'showtime']
  augroup vimrc-indent-guides
    autocmd!
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 guifg=#303030 ctermbg=235 ctermfg=236
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#1C1C1C guifg=#303030 ctermbg=234 ctermfg=236
  augroup END
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