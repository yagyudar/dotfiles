function! s:on_load_pre()
  " Plugin configuration like the code written in vimrc.
  nnoremap [ctrlp] <Nop>
  nmap ,p [ctrlp]
  " uiki
  nnoremap <expr>[ctrlp]i ':<C-u>CtrlP '. g:memolist_path . '<CR>'
  nnoremap [ctrlp]p :<C-u>CtrlP<CR>
  nnoremap [ctrlp]b :<C-u>CtrlPBuffer<CR>
  nnoremap [ctrlp]d :<C-u>CtrlPDir<CR>
  " nnoremap [ctrlp]l :<C-u>CtrlPLine %<CR>
  nnoremap [ctrlp]l :<C-u>CtrlPLine<CR>
  nnoremap [ctrlp]m :<C-u>CtrlPMRUFiles<CR>
  nnoremap [ctrlp]x :<C-u>CtrlPMixed<CR>
  nnoremap [ctrlp]y :<C-u>CtrlPYankRound<CR>
  let g:ctrlp_map = '<Nop>'
  " Guess vcs root dir
  let g:ctrlp_working_path_mode = 'ra'
  " Open new file in current window
  let g:ctrlp_open_new_file = 'r'
  let g:ctrlp_extensions = ['dir', 'mixed']
  let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
  let g:ctrlp_tilde_homedir=1
  let g:ctrlp_max_files = 20000
  " let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<Esc>', '<C-c>', '<C-g>', '<C-@>'] }
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