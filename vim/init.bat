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
mkdir .vim\uiki

echo "---------------------------------------------"
echo " �erc�t�@�C����symbolic link���쐬���܂��B"
echo "---------------------------------------------"
mklink .vimrc %CURRENT_PATH%\.vimrc
mklink .gvimrc %CURRENT_PATH%\.gvimrc

cd .vim
mklink .base.vimrc %CURRENT_PATH%\.base.vimrc
mklink .default.vimrc %CURRENT_PATH%\.default.vimrc

cd ..
mklink /D volt %CURRENT_PATH%\volt

pause

