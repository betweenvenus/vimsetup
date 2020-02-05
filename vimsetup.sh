#!/bin/bash

# NOTE: This script should be sourced ('source ./vimsetup.sh -i')
# Arguments guide:
# -i: *Installs* the vimrc. Only run this the first time. Clones, then sets path.
# -e: Sets up your environment for the custom vimrc. Run this every time you SSH in.

while getopts "ie" opt; do
    case $opt in
        i)
            mkdir ~/html/vimrc
            git clone https://github.com/betweenvenus/vimrc ~/html/vimrc
            export VIMINIT='source $CUSTOMVIMRC'
            export CUSTOMVIMRC='~/html/vimrc/.vimrc'
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