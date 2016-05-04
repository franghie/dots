#!/bin/bash - 
#===============================================================================
#
#          FILE: setup.sh
# 
#         USAGE: ./setup.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 05/04/2016 09:14
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -fs ~/.vimrc  .vimrc
ln -fs ~/.git-prompt.sh .git-prompt.sh
echo "source .git-prompt.sh" >> ~/.bashrc

