#!/usr/bin/env bash
#   date: 0ct-30-2017
#   notes: install tmux from source, a collection of scripts in one place all sourced from github

#   install some essentials -- find latest versions and fix the version numbers accordingly.
sudo apt install libevent-1.4-2 libevent-dev libncurses5-dev make autoconf automake pkg-config
#   go to the  users home dir
cd ${HOME}

#   clone the git repo
git clone https://github.com/tmux/tmux.git
cd tmux/
sh autogen.sh
./configure
sudo make install
#
which tmux
#   install some sensible plugins https://github.com/tmux-plugins/tmux-sensible
#   follow instructions from here https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#   create the .tmux.conf and write some contents as spicified on the above site
cat << EOF >> ~/.tmux.conf
run-shell "powerline-daemon -q"
source "~/.local/lib/python3.5/site-packages/powerline/bindings/tmux/powerline.conf"
set -g mouse on
# utf8 is on
set -g utf8 on
set -g status-utf8 on
# increase scrollback buffer size
set -g history-limit 50000
# tmux messages are displayed for 4 seconds
set -g display-time 4000

# refresh 'status-left' and 'status-right' more often
set -g status-interval 5
# focus events enabled for terminals that support them
set -g focus-events on

# super useful when using "grouped sessions" and multi-monitor setup
setw -g aggressive-resize on

set -g @colors-solarized '256'
#set -g @colors-solarized 'dark'
#set -g @colors-solarized 'light'
#set -g @colors-solarized 'base16'

set -g prefix Home
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'seebi/tmux-colors-solarized'
run '~/.tmux/plugins/tpm/tpm'

EOF
#   all done, now try out tmux
echo "Done. type tmux to try it out if there were no errors."

