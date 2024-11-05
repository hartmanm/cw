#!/bin/bash
# Copyright (c) 2019 Michael Neill Hartman. All rights reserved.
# mnh_license@proton.me
# https://github.com/hartmanm

APIS_TO_RUN=`ls -1 apis | sort -r`
[[ $# -gt 0 ]] && APIS_TO_RUN="${@}"
> run/ra_history
> run/history
for API in `echo $APIS_TO_RUN`
do
[[ -f "apis/$API" ]] && {
echo "starting: apis/${API}" >> run/ra_history
for CMD in `awk '{print $1}' "apis/$API"`
do
[[ "${CMD:0:1}" != "#" ]] && {
echo "executing: apis/"$API" ${CMD}" >> run/ra_history
bash invoke.sh apis/"$API" "$CMD"
}
done
}
done