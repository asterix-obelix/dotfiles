#!/usr/bin/env bash

cd ${HOME}
sudo apt install -y python3-pip

#	install powerline
pip3 install git+git://github.com/Lokaltog/powerline

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

sudo mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf /usr/share/fonts/
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

#	install patched fonts from https://github.com/powerline/fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh

pip3 show powerline-status

echo "copy the location for use in the bash, tmux and vim config files"


