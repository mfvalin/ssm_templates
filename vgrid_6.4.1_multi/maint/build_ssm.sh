#!/bin/bash
set -e
Here=$(readlink -e $0)
Here=${Here%/maint*}
Package=${Here##*/}
echo ==  ${Package} home is $Here ===
cd $Here/.. || exit 1
SSMDIR=${1:-${TMPDIR:-/tmp}}
[[ "$2" == FULL ]] || IGNORE="--exclude=Build"
set -x
tar zcf ${SSMDIR}/${Package}.ssm ${Package} --exclude=.git ${IGNORE}
set +x
echo === ${SSMDIR}/${Package}.ssm DONE ===
