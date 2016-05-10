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
bundle=$HOME/.vim/bundle/Vundle.vim
if [ ! -d "$bundle" ]; then
    CMD="mkdir -p $bundle"
    echo $CMD
    $CMD
    CMD="git clone https://github.com/VundleVim/Vundle.vim.git $bundle"
    echo $CMD
    $CMD
fi

echo "************************************************"
echo "*******   Setup vimrc"
echo "************************************************"
vimrcd=$HOME/.vimrc
vimrcs=$DIR/.vimrc
if [ -f "$vimrcd" ]; then
    CMD="mv $vimrcd $vimrcd-${date}"
    echo "$CMD"
    $CMD
fi

CMD="ln -fs ${vimrcs} ${vimrcd}"
echo $CMD
$CMD
echo "************************************************"
echo "*******   Setup git shell prompt"
echo "************************************************"
gitpd=$HOME/.git-prompt.sh
gitps=$DIR/.git-prompt.sh
if [ -f "$gitpd" ]; then
    CMD="mv $gitpd $gitpd-${date}"
    echo "$CMD"
    $CMD
fi

CMD="ln -fs ${gitps} ${gitpd}"
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
installer=${DIR}/gitflow/contrib/gitflow-installer.sh
chmod +x $installer
INSTALL_PREFIX=~/bin $installer

echo "************************************************"
echo "*******   Setup utilities"
echo "************************************************"
cp -r ${DIR}/bin/* ~/bin/
