#!/bin/bash
# Copyright (c) 2019 Michael Neill Hartman. All rights reserved.
# mnh_license@proton.me
# https://github.com/hartmanm

[[ ${2} =~ [0-9] ]] && EXEC_LINE=$(cat ${1} | head -$2 | tail -1)
[[ ${2} =~ [0-9] ]] || EXEC_LINE=$(grep -w ${2} ${1}| head -1)
EXEC=$(echo ${EXEC_LINE} | cut -f1 -d" " --complement)
LAST=$(echo ${EXEC_LINE} | awk '{print $1}')
[[ ! -d run ]] && mkdir -p run
[[ -e history ]] || touch run/history
echo "# ${LAST}" > run/last_cmd
echo ${EXEC} >> run/last_cmd
[[ -e run/last_cmd ]] && cat run/last_cmd >> run/history
bash run/last_cmd
echo "
       Copyright (c) 2019 Michael Neill Hartman. All rights reserved.
       mnh_license@proton.me
       https://github.com/hartmanm
"
