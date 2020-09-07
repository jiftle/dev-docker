# 基础镜像
FROM ubuntu:18.04

# 维护者
MAINTAINER jiftle "lixugood@126.com"

# ============== 变量定义==============
# 时区
ENV TZ "Asia/Shanghai"

# 替换镜像源为阿里云
COPY files/sources.list /etc/apt/sources.list

# -------- 安装必要的软件工具 ----------
RUN apt update && apt install -y \
 xz-utils \
 tree \
 curl \
 wget \
 htop \
 nmap \
 git \
 tig \
 apt-utils

# -------- c语言编译环境 ----------
RUN apt install -y \
 build-essential \
 gcc \
 g++ \
 make \
 cmake


# --------- 编译vim依赖库 ------------
RUN apt install -y \
 libncurses5-dev \
 libgnome2-dev \
 libgnomeui-dev \
 libgtk2.0-dev \
 libatk1.0-dev \
 libbonoboui2-dev \
 libcairo2-dev \
 libx11-dev \
 libxpm-dev \
 libxt-dev \
 python-dev \
 ruby-dev \
 mercurial

# ---------- NeoVim 编译需要的依赖库 ---------
RUN apt-get install -y \
 libtool \
 libtool-bin \
 autoconf \
 automake \
 pkg-config \
 unzip


# ------------- 安装Python ------------------
RUN apt-get install python3 python3-pip python-pip -y

# ------------- clang -----------------------
RUN apt-get install -y llvm clang
 
# ---------- Emacs26.3 编译需要的依赖库 ---------
RUN apt-get install -y \
texinfo \
libjpeg-dev \
libgif-dev \
libtiff5-dev

# ---------- 安装特殊
RUN apt update && apt-get install -y \
--fix-missing \
libgtk-3-dev \
libncurses5-dev \
libxml2-dev \
libgnutls28-dev

# -------- 清理冗余文件，减少体积 ------------
RUN apt clean \
&& \
rm -rf /var/lib/apt/lists/* \
&& \
rm -rf /root/.cache/*

# 设置工作目录
WORKDIR /
