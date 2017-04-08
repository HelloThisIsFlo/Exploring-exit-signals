#!/bin/bash

#######################################
# 1. Start the `sleep.sh` script      #
# 2. Trap & print itself exit signals #
#######################################

function verbose_exit {
    echo ""
    echo "EXTERNAL_TRAP: Received $1, wait for 1 sec ..."
    sleep 1 
    echo "EXTERNAL_TRAP: Exiting in 1 more seconds ..."
    sleep 1
    echo "EXTERNAL_TRAP: Exit now"
    exit 0
}

trap 'verbose_exit SIGINT'  SIGINT
trap 'verbose_exit SIGTERM' SIGTERM

# Sleep now
echo "Starting 'sleep.sh' script"
./sleep.sh
echo ""
echo "EXTERNAL_TRAP: Exiting WITHOUT having received any signal"
