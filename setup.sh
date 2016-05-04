#!/bin/bash - 
#===============================================================================
#
#          FILE: setup.sh
# 
#         USAGE: ./setup.sh 
# 
#   DESCRIPTION: setup vim and git
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Samuel, Nie
#  ORGANIZATION: 
#       CREATED: 05/04/2016 09:22
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

date=`date +"%Y-%m-%d:%H:%M:%S"`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"

echo "************************************************"
echo "******   Setup Vim plugin Vundle"
echo "************************************************"
if [ ! -d "~/.vim/bundle/Vundle.vim" ]; then
    CMD="mkdir -p ~/.vim/bundle/Vundle.vim"
    echo $CMD
    $CMD
    CMD="git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
    echo $CMD
    $CMD
fi

echo "************************************************"
echo "*******   Setup git shell prompt"
echo "************************************************"
if [ -f "~/.git-prompt.sh" ]; then
    CMD="mv ~/.git-prompt.sh ~/.git-prompt.sh-${date}"
    echo "$CMD"
    $CMD
fi

CMD="ln -fs ~/.git-prompt.sh ${DIR}/.git-prompt.sh"
echo $CMD
$CMD

echo "source ~/.git-prompt.sh" >> ~/.bashrc

echo "************************************************"
echo "*******   Setup PS1 "
echo "************************************************"
PS="PS1=\"\[\$GREEN\]\t\[\$RED\]-\[\$GREEN\]\h\[\$RED\]-\[\$BLUE\]\u\[\$YELLOW\]\[\$YELLOW\]\w\[\033[m\]\[\$MAGENTA\]\$(__git_ps1)\[\$WHITE\]\\\$ \""
echo $PS
echo "${PS}" >> ~/.bashrc


echo "************************************************"
echo "*******   Setup git-flow"
echo "************************************************"
INSTALL_PREFIX=~/bin ${DIR}/gitflow-installer.sh

echo "************************************************"
echo "*******   Setup utilities"
echo "************************************************"
cp -r ${DIR}/bin/* ~/bin/
