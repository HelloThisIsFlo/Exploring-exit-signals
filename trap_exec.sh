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
echo "Starting 'exec sleep.sh'"
exec ./sleep.sh
echo ""
echo "EXTERNAL_TRAP: 'exec ./sleep.sh' replaced this process with the './sleep.sh' process"
echo "EXTERNAL_TRAP: so these 2 message should never show !!"
