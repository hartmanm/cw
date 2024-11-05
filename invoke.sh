#!/bin/bash
# Copyright (c) 2019 Michael Neill Hartman. All rights reserved.
# mnh_license@proton.me
# https://github.com/hartmanm

[[ ${2} =~ [0-9] ]] && EXEC_LINE=$(cat ${1} | head -$2 | tail -1)
[[ ${2} =~ [0-9] ]] || EXEC_LINE=$(grep -w ${2} ${1}| head -1)
EXEC=$(echo ${EXEC_LINE} | cut -f1 -d" " --complement)
LAST=$(echo ${EXEC_LINE} | awk '{print $1}')
[[ -e history ]] || touch history
[[ -e last_cmd ]] && cat last_cmd >> history
echo "# ${LAST}" > last_cmd
echo ${EXEC} >> last_cmd
bash last_cmd
