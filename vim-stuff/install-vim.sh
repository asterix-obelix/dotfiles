#!/usr/bin/env bash
#   Author: asterix-obelix
#   date: oct-20-2017
#   notes: nothing special. install vim and then from github using some goodies like pathogen, sensible vim etc. just a handy script.

#   check this site https://github.com/amix/vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh


#   using pathogen https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#   create a .vimrc
echo << EOF >> ~/.vimrc
execute pathogen#infect()
syntax on
filetype plugin indent on
EOF

#   check this site for https://github.com/tpope/vim-sensible
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-sensible.git

#   get the solarized scheme
git clone git://github.com/altercation/vim-colors-solarized.git

echo "done. time to try. first log out and log back in for the changes to take effect.

