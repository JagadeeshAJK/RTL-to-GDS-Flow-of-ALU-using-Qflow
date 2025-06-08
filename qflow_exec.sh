#!/usr/bin/tcsh -f
#-------------------------------------------
# qflow exec script for project /home/zxcv/Downloads
#-------------------------------------------

# /usr/lib/qflow/scripts/synthesize.sh /home/zxcv/Downloads ALU /home/zxcv/Downloads/source/ALU.v || exit 1
# /usr/lib/qflow/scripts/placement.sh -d /home/zxcv/Downloads ALU || exit 1
# /usr/lib/qflow/scripts/opensta.sh  /home/zxcv/Downloads ALU || exit 1
# /usr/lib/qflow/scripts/vesta.sh -a /home/zxcv/Downloads ALU || exit 1
/usr/lib/qflow/scripts/router.sh /home/zxcv/Downloads ALU || exit 1
# /usr/lib/qflow/scripts/opensta.sh  -d /home/zxcv/Downloads ALU || exit 1
# /usr/lib/qflow/scripts/vesta.sh -a -d /home/zxcv/Downloads ALU || exit 1
# /usr/lib/qflow/scripts/migrate.sh /home/zxcv/Downloads ALU || exit 1
# /usr/lib/qflow/scripts/drc.sh /home/zxcv/Downloads ALU || exit 1
# /usr/lib/qflow/scripts/lvs.sh /home/zxcv/Downloads ALU || exit 1
# /usr/lib/qflow/scripts/gdsii.sh /home/zxcv/Downloads ALU || exit 1
# /usr/lib/qflow/scripts/cleanup.sh /home/zxcv/Downloads ALU || exit 1
# /usr/lib/qflow/scripts/display.sh /home/zxcv/Downloads ALU || exit 1
