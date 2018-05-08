function! s:on_load_pre()
  " Plugin configuration like the code written in vimrc.
  " This configuration is executed *before* a plugin is loaded.

  let g:LanguageClient_serverCommands = {
              \ 'vue': ['vls'],
              \ 'typescript': ['typescript-language-server', '--stdio'],
              \ 'javascript': ['javascript-typescript-stdio'],
              \ }

  " let g:LanguageClient_rootMarkers = {
  "     \ 'javascript': ['project.json'],
  "     \ 'rust': ['Cargo.toml'],
  "     \ }

  let g:LanguageClient_rootMarkers = {
      \ 'vue': ['package.json'],
      \ }

  nnoremap <silent> gK :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gD :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> gN :call LanguageClient#textDocument_rename()<CR>
  nnoremap <silent> gR :call LanguageClient#textDocument_references()<CR>
  nnoremap <silent> gS :call LanguageClient#textDocument_documentSymbol()<CR>
  nnoremap <silent> g* :call LanguageClient#textDocument_documentHighlight()<CR>
  nnoremap <silent> g= :call LanguageClient#textDocument_formatting()<CR>

  vnoremap <silent> g= :call LanguageClient#textDocument_rangeFormatting()<CR>
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

  return [
  \  'github.com/roxma/vim-hug-neovim-rpc.vim'
  \]
endfunction