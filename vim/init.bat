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
mkdir .vim\uiki

echo "---------------------------------------------"
echo " 各rcファイルのsymbolic linkを作成します。"
echo "---------------------------------------------"
mklink .vimrc %CURRENT_PATH%\.vimrc
mklink .gvimrc_first.vim %CURRENT_PATH%\.gvimrc_first.vim

cd .vim
mklink .base.vimrc %CURRENT_PATH%\.base.vimrc
mklink .default.vimrc %CURRENT_PATH%\.default.vimrc

cd ..
mklink /D volt %CURRENT_PATH%\volt

pause

