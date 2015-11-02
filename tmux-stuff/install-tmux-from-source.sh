#!/bin/bash
#	get it from https://github.com/asterix-obelix/dotfiles.git
#	Author: asterix-oeblix
#	date: nov-01-2015
#

sudo apt-get install -y automake libevent-2.0.5 libevent-dev libncurses5-dev

cd "${HOME}"
mkdir -p "${HOME}"/downloads/
cd "${HOME}"/downloads/
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure 
make
sudo make install

#	https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm "${HOME}"/.tmux/plugins/tpm

echo "copy the tmux.conf to the ${HOME} folder and dont forget to put a . infront of the tmux.conf file"
