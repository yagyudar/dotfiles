" vim:set ts=8 sts=2 sw=2 tw=0:

" 標準のvimrc(手を加えてはある)
if 1 && filereadable($HOME . '/.vim/.default.vimrc')
  source $HOME/.vim/.default.vimrc
endif

" プラグインと関係ない設定
if 1 && filereadable($HOME . '/.vim/.base.vimrc')
  source $HOME/.vim/.base.vimrc
endif

let s:has_plugin_manager=0

" vim-plugの設定
if 1 && filereadable($HOME . '/.vim/plug/vim-plug/autoload/plug.vim')
  if 1 && filereadable($HOME . '/.vim/.plug.vimrc')
    source $HOME/.vim/.plug.vimrc
    let s:has_plugin_manager=1
  endif
endif

" プラグイン関連の設定
if 1 && s:has_plugin_manager && filereadable($HOME . '/.vim/.plugin.vimrc')
  source $HOME/.vim/.plugin.vimrc
endif

" (最後に読み込む) サイトローカルな設定local.vimrc
" (このファイルはホームディレクトリに各環境で配置する)
if 1 && filereadable($HOME . '/.local.vimrc')
  source $HOME/.local.vimrc
endif
