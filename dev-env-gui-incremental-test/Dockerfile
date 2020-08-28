# 基础镜像
FROM jiftle/dev-env-gui:0.1

# 维护者
MAINTAINER jiftle "lixugood@126.com"

# ============== 变量定义==============
ARG INST_DIR="/instdir"

# ------------- 文件拷贝 -------------
COPY files ${INST_DIR}

# ---------- 中文语言 ----------
# --------- 处理中文乱码 --------------
# ------------ 终端设置为256色，显示效果更好---------------
# vim别名
RUN \
echo 'alias vi=vim' >> /etc/my.bashrc \
&& \
echo 'export LC_ALL="zh_CN.UTF-8"' >> /etc/my.bashrc \
&& \
echo '' >> /etc/my.bashrc \
&& \
echo 'export TERM="xterm-256color"' >> /etc/my.bashrc \
&& \
echo '' >> /etc/my.bashrc

# --------------- zsh 终端美化 ------------------
RUN apt update && \
apt install -y \
zsh

RUN \
cp -r $INST_DIR/oh-my-zsh /root/.oh-my-zsh \
&& \
cp $INST_DIR/zshrc /root/.zshrc \
&& \
cp $INST_DIR/p10k.zsh /root/.p10k.zsh

# 清理临时文件
RUN rm -rf ${INST_DIR}

# --------------- 语言设置为中文
# ENV LANG C.UTF-8
# # 设置时区
# RUN echo 'Asia/Shanghai' >/etc/timezone


# --------- 创建用户
# RUN addgroup -g 1000 john && adduser -u 1000 -D -h /home/john -G john john
# USER john

# 设置工作目录
# WORKDIR /home/john
WORKDIR /root
