#!/bin/bash
# -----------------------------------------------------------------
# FileName: sh-clean-docker.sh
# Date: 2020-05-22
# Author: jiftle
# Description:
# -----------------------------------------------------------------

echo "------------ ** JupyterNotebook脚本 ** -----------------"

echo "  |--> 启动JupyterNotebook"
jupyter notebook \
--ip=0.0.0.0 \
--port=8080 \
--notebook-dir="/home/john/workspace/jupynotebook" \
--allow-root

