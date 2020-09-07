#!/bin/bash
# -----------------------------------------------------------------
# FileName: emacs-serv.sh
# Date: 2020-01-06
# Author: jiftle
# Description: emacs 守护服务daemon方式运行
# -----------------------------------------------------------------
echo "---> Emacs服务，开始启动..."
nohup emacs --daemon > /dev/null 2>&1 &
echo "---> Emacs服务，启动完成。"

