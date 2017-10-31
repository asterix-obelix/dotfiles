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
cat << EOF >> ~/.tmux-01.conf
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
EOF
#   all done, now try out tmux
echo "Done. type tmux to try it out if there were no errors."

