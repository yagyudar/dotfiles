#!/bin/sh

#####################################
# スクリプトを実行したパスに
# vim関連の設定ファイル群を配置する
#####################################

# このスクリプトのパスを取得
cwd=`dirname "${0}"`

# 絶対パスに変換する。不要？
# expr "${0}" : "/.*" > /dev/null || cwd=`(cd "${cwd}" && pwd)`

echo "---------------------------------------------"
echo " 必要なディレクトリを作成します。"
echo "--------------------------------------------"

mkdir .vim
mkdir .vim/backup
mkdir .vim/swap
mkdir .vim/undo
mkdir .vim/plug
mkdir .vim/uiki

echo "---------------------------------------------"
echo " 各rcファイルのsymbolic linkを作成します。"
echo "---------------------------------------------"
ln -s "${cwd}/.vimrc"
#ln -s "${cwd}"/.*.vimrc .vim/

# TODO: 暫定処理(msysのlnがうまく動かない...)
# TODO: 本当はワイルドカードを使用して且つ任意のディレクトリ以下に配置したい。
cd .vim/
ln -s "${cwd}"/.base.vimrc
ln -s "${cwd}"/.default.vimrc
ln -s "${cwd}"/.plugin.vimrc
ln -s "${cwd}"/.plug.vimrc
cd ../

echo "---------------------------------------------"
echo " vim-plugをインストールします。"
echo "---------------------------------------------"

if [ `which git` ]; then
    git clone https://github.com/junegunn/vim-plug .vim/plug/vim-plug
    mkdir .vim/plug/vim-plug/autoload
    cp -p .vim/plug/vim-plug/plug.vim .vim/plug/vim-plug/autoload/plug.vim
else
    echo "gitコマンドが見つかりません。"
fi
