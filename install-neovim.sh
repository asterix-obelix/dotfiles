#!/bin/bash
#	Author: asterix-obelix
#	date: oct-26-2015
#	notes: shell script to install neovim and related files - run as sudo

#	1. install neovim https://github.com/neovim/neovim/wiki/Installing-Neovim
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install neovim

#	1.1 Prerequisites for the Python modules: 
sudo apt-get install python-dev python-pip python3-dev python3-pip

#	2.	install vundle -	note that it installs into nvim and not vim
cd ${HOME}
git clone https://github.com/VundleVim/Vundle.vim.git ~/.nvim/bundle/Vundle.vim

#	3.	install powerline fonts https://github.com/powerline/fonts
mkdir -p ${HOME}/downloads/powerline-fonts
cd ${HOME}/downloads/powerline-fonts

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ${HOME}/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/

#	3.1 clone many other fonts that could be used with powerline - powerline patched fonts they call it.
git clone https://github.com/powerline/fonts
cd fonts
chmod +x install.sh
./install.sh

#	clear the cache 
fc-cache -vf ~/.fonts/

echo "since we ran this script as sudo. you might need to do a chown the font files just installed to your account in the ${HOME}/.fonts/ folder."
echo "done installing neovim."
echo "copy the .vimrc file to your ${HOME}/ folder"
echo "and run it like this nvim -u ~/.vimrc"
echo "once inside vim do a :PluginInstall"
echo "then exit nvim and restart nvim."
