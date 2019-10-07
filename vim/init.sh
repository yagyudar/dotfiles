#!/bin/sh

#####################################
# スクリプトを実行したパスに
# vim関連の設定ファイル群を配置する
#####################################

# このスクリプトの絶対パスを取得
cwd=`cd \`dirname "${0}"\`; pwd`

echo "---------------------------------------------"
echo " 必要なディレクトリを作成します。"
echo "--------------------------------------------"

mkdir .vim
mkdir .vim/backup
mkdir .vim/swap
mkdir .vim/undo
mkdir .vim/uiki

echo "---------------------------------------------"
echo " 各rcファイルのsymbolic linkを作成します。"
echo "---------------------------------------------"
ln -s "${cwd}/.vimrc"
ln -s "${cwd}/.gvimrc"

# TODO: 暫定処理(msysのlnがうまく動かない...)
# TODO: 本当はワイルドカードを使用して且つ任意のディレクトリ以下に配置したい。
cd .vim/
ln -s "${cwd}"/.base.vimrc
ln -s "${cwd}"/.default.vimrc
cd ../

# volt
ln -s "${cwd}"/volt
