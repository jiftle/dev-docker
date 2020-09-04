# 基础镜像
FROM jiftle/dev-env:0.1

# 维护者
MAINTAINER jiftle "lixugood@126.com"

# --------------- 语言设置为中文
ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai

# # -------- 安装必要的软件工具 ----------
# RUN apt update && \
# apt install -y \
# libnss3 \
# libxkbfile1 \
# libsecret-1-0 \
# libgtk-3-0 \
# libxss1 \
# libx11-xcb1 \
# language-pack-zh-hans \
# fonts-droid-fallback \
# sudo \
# ctags \
# iputils-ping \
# ack-grep \
# iproute2 iproute2-doc \
# openssh-server \
# zsh \
# ruby-full

# # ------------- 安装第三方软件 -------------
# RUN gem install colorls

# ------------ 处理时区问题 ----------------
RUN export DEBIAN_FRONTEND=noninteractive \
&& apt install -y \
tzdata \
&& echo "Asia/Shanghai" > /etc/timezone \
&& dpkg-reconfigure -f noninteractive tzdata

# ---------- 环境变量处理 ----------
RUN \
echo 'export LC_ALL="zh_CN.UTF-8"' >> /etc/my.bashrc \
&& \
echo '' >> /etc/my.bashrc \
&& \
echo 'export TERM="xterm-256color"' >> /etc/my.bashrc \
&& \
echo '' >> /etc/my.bashrc


# 设置工作目录
WORKDIR /root
