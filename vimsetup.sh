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
            echo -e '\n' >> ~/.bashrc
            echo '# Fancy Vim set up with custom .vimrc location' >> ~/.bashrc
            echo 'export VIMINIT=source $CUSTOMVIMRC' >> ~/.bashrc
            echo 'export CUSTOMVIMRC=~/html/vimrc/.vimrc' >> ~/.bashrc
            echo 'done!'
            ;;
        e)
            export VIMINIT='source $CUSTOMVIMRC'
            export CUSTOMVIMRC='~/html/vimrc/.vimrc'
            echo 'ready!'
            ;;
        esac
    done
    shift "$(($OPTIND -1))"