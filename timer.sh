#!/usr/bin/env bash

function timer() {
    cmd=$1
    start=$(date +%s)

    ($cmd) & ret_pid=$!
    wait $ret_pid

    ret_val=$?

    end=$(date +%s)
    duration=$(($end - $start))
    echo "$cmd took $((($duration / 60) % 60 )) minutes and $(($duration % 60)) seconds. exit code: $ret_val"
}

timer "sleep 5" &
timer "sleep 1" &
timer "sleep 10" &

wait
