#!/bin/bash

########################################################
# This script simulate infinite sleep.                 #
#                                                      #
# The particularity is that when a signal is received: #
#  1. It traps signals                                 #
#  2. Print the signal                                 #
#  3. Exit normally                                    #
#                                                      #
# That is for SIGINT & SIGTERM.                        #
# SIGKILL will still abruptly kill the script          #
########################################################

function verbose_exit {
    echo ''
    echo "SLEEP: Received $1, wait for 1 sec ..."
    sleep 1 
    echo "SLEEP: Exiting in 1 more seconds ..."
    sleep 1
    echo "SLEEP: Exit now"
    exit 0
}

trap 'verbose_exit SIGINT'  SIGINT
trap 'verbose_exit SIGTERM' SIGTERM

# Sleep now
echo "Sleeping till the end of times"
while true; do :; done
