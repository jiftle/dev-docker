#!/bin/bash
# -----------------------------------------------------------------
# FileName: run.sh
# Date: 2020-01-09
# Author: jiftle
# Description: 
# -----------------------------------------------------------------
set -e

WSP="$HOME/wsp/build-wsp"
BuildDir="/usrlocal/git/gitee/dev-docker/dev-env-gui/files/app"

# 发布到编译目录
# cp -r $WSP/vim-8.2.1525 $BuildDir/vim
echo "  |--> 删除目录vim"
rm -rf $BuildDir/vim

# echo "  |--> 复制vim文件"
cp -r $WSP/vim-8.2.1525 $BuildDir/vim

