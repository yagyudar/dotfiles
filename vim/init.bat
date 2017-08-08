@echo off

rem ####################################
rem vim�֘A�̐ݒ�t�@�C���Q��z�u����
rem ####################################

rem ���̃X�N���v�g�̃p�X���擾
set CURRENT_PATH=%~dp0

rem 
cd %HOMEPATH%

echo "---------------------------------------------"
echo " �K�v�ȃf�B���N�g�����쐬���܂��B"
echo "--------------------------------------------"

mkdir .vim
mkdir .vim\backup
mkdir .vim\swap
mkdir .vim\undo
mkdir .vim\plug
mkdir .vim\uiki

echo "---------------------------------------------"
echo " �erc�t�@�C����symbolic link���쐬���܂��B"
echo "---------------------------------------------"
mklink .vimrc %CURRENT_PATH%\.vimrc

cd .vim
mklink .base.vimrc %CURRENT_PATH%\.base.vimrc
mklink .default.vimrc %CURRENT_PATH%\.default.vimrc
mklink .plugin.vimrc %CURRENT_PATH%\.plugin.vimrc
mklink .plug.vimrc %CURRENT_PATH%\.plug.vimrc

echo "---------------------------------------------"
echo " vim-plug���C���X�g�[�����܂��B"
echo "---------------------------------------------"
git clone https://github.com/junegunn/vim-plug .vim/plug/vim-plug
mkdir .vim\plug\vim-plug\autoload
copy .vim\plug\vim-plug\plug.vim .vim\plug\vim-plug\autoload\plug.vim

pause

