# !/bin/bash

ipcaddr=`printf "%02d" $1`


geth attach ipc:./data/15/data/$ipcaddr/geth.ipc


