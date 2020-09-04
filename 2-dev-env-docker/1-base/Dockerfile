# 基础镜像
FROM jiftle/build-env:1.0.1
# FROM ubuntu:18.04
# FROM jiftle/lang-env:0.1
# FROM dev-env:0.1

# 维护者
MAINTAINER jiftle "lixugood@126.com"

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
libnss3 \
libxkbfile1 \
libsecret-1-0 \
libgtk-3-0 \
libxss1 \
libx11-xcb1 \
language-pack-zh-hans \
fonts-droid-fallback \
sudo \
ctags \
iputils-ping \
ack-grep \
iproute2 iproute2-doc \
openssh-server \
zsh \
python3 python3-pip python-pip \
ruby-full


# -------- c语言编译环境 ----------
RUN apt install -y \
build-essential \
gcc \
g++ \
make \
cmake

# ------------- 安装第三方软件 -------------
RUN gem install colorls

# *********************** 清理冗余文件**********************
RUN rm -rf ${INST_DIR} \
&& \
rm -rf /var/lib/apt/lists/*
