#!/bin/bash

# NOTE: This script should be sourced ('source ./vimsetup.sh -i')
# Arguments guide:
# -i: Downloads the vimrc file and configures .bashrc to load it automatically. Only run this once.
# -e: Exports the environment variables. Source this if there's some kind of issue with the installation. 

while getopts "ie" opt; do
    case $opt in
        i)
            mkdir ~/html/vimrc
            git clone https://github.com/betweenvenus/vimrc ~/html/vimrc
            echo -e '\n' >> ~/.ssh/rc
            echo '# Fancy Vim set up with custom .vimrc location' >> ~/.ssh/rc
            echo 'export VIMINIT=source $CUSTOMVIMRC' >> ~/.ssh/rc
            echo 'export CUSTOMVIMRC=~/html/vimrc/.vimrc' >> ~/.ssh/rc
            echo 'done!'
            ;;
        e)
            source export VIMINIT='source $CUSTOMVIMRC'
            source export CUSTOMVIMRC='~/html/vimrc/.vimrc'
            echo 'ready!'
            ;;
        esac
    done
    shift "$(($OPTIND -1))"