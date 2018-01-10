" vim:set ts=8 sts=2 sw=2 tw=0:

" プラグインと関係ない設定
if 1 && filereadable($HOME . '/.vim/.default.vimrc')
  source $HOME/.vim/.default.vimrc
endif

" プラグインと関係ない設定
if 1 && filereadable($HOME . '/.vim/.base.vimrc')
  source $HOME/.vim/.base.vimrc
endif

" (最後に読み込む) サイトローカルな設定local.vimrc
" (このファイルはホームディレクトリに各環境で配置する)
if 1 && filereadable($HOME . '/.local.vimrc')
  source $HOME/.local.vimrc
endif
