#!/bin/bash

#######################################
# 1. Start the `sleep.sh` script      #
# 2. Trap & print itself exit signals #
#######################################

function verbose_exit {
    echo ""
    echo "THIRD_LAYERS: Received $1, wait for 1 sec ..."
    sleep 1 
    echo "THIRD_LAYERS: Exiting in 1 more seconds ..."
    sleep 1
    echo "THIRD_LAYERS: Exit now"
    exit 0
}

trap 'verbose_exit SIGINT'  SIGINT
trap 'verbose_exit SIGTERM' SIGTERM

# Sleep now
echo "Starting 'trap.sh' script"
./trap.sh
echo ""
echo "THIRD_LAYERS: Exiting WITHOUT having received any signal"
