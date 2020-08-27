# 基础镜像
FROM jiftle/dev-env:0.1

# 维护者
MAINTAINER jiftle "lixugood@126.com"

# -------- 安装必要的软件工具 ----------
RUN apt update && \
apt install -y \
libnss3 \
libxkbfile1 \
libsecret-1-0 \
libgtk-3-0 \
libxss1 \
libx11-xcb1 \
language-pack-zh-hans

RUN export DEBIAN_FRONTEND=noninteractive \
&& apt install -y \
tzdata

# RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# ---------- 基础环境变量 ----------
# RUN cat ${INST_DIR}/bash-env.rc >> /etc/bash.bashrc

# 处理配置文件
# RUN cp -ar ${INST_DIR}/root/. /root/

# --------------- 语言设置为中文
ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai
# 设置时区
# RUN echo 'Asia/Shanghai' > /etc/timezone


# --------- 创建用户
# RUN addgroup -g 1000 john && adduser -u 1000 -D -h /home/john -G john john
# USER john

# 设置工作目录
# WORKDIR /home/john
WORKDIR /root
