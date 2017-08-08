@echo off

rem ####################################
rem vim関連の設定ファイル群を配置する
rem ####################################

rem このスクリプトのパスを取得
set CURRENT_PATH=%~dp0

rem 
cd %HOMEPATH%

echo "---------------------------------------------"
echo " 必要なディレクトリを作成します。"
echo "--------------------------------------------"

mkdir .vim
mkdir .vim\backup
mkdir .vim\swap
mkdir .vim\undo
mkdir .vim\plug
mkdir .vim\uiki

echo "---------------------------------------------"
echo " 各rcファイルのsymbolic linkを作成します。"
echo "---------------------------------------------"
mklink .vimrc %CURRENT_PATH%\.vimrc

cd .vim
mklink .base.vimrc %CURRENT_PATH%\.base.vimrc
mklink .default.vimrc %CURRENT_PATH%\.default.vimrc
mklink .plugin.vimrc %CURRENT_PATH%\.plugin.vimrc
mklink .plug.vimrc %CURRENT_PATH%\.plug.vimrc

echo "---------------------------------------------"
echo " vim-plugをインストールします。"
echo "---------------------------------------------"
git clone https://github.com/junegunn/vim-plug .vim/plug/vim-plug
mkdir .vim\plug\vim-plug\autoload
copy .vim\plug\vim-plug\plug.vim .vim\plug\vim-plug\autoload\plug.vim

pause

