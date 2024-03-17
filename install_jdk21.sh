#!/bin/bash
set -x
if  [ $(uname -m) != "aarch64"   ]; then
	echo "不支持的平台 无法安装 正在退出"
	exit 1
fi
if  [ -x "$(command -v java)"    ]; then
	echo "jdk已安装，请检查"
	exit 1
fi
if  [ -d openjdk-21.0.1-aarch64     ];  then
  echo "已下载完成 正在配置环境变量"
elif ! [ -f openjdk-21.0.1-aarch64.zip   ]; then 
	echo "正在安装"
	apt install wget -y
	wget https://github.com/zryyoung/openjdk-Termux/releases/download/openjdk-21.0.1/openjdk-21.0.1-aarch64.zip -O openjdk-21.0.1-aarch64.zip &&
	echo "下载完成  正在解压" 
fi
unzip openjdk-21.0.1-aarch64.zip -d /data/data/com.termux/files/usr/opt/ &&
rm -rf openjdk-21.0.1-aarch64.zip &&
if [ -f "/data/data/com.termux/files/usr/etc/bash.bashrc" ]; then
    echo "export JAVA_HOME=/data/data/com.termux/files/usr/opt/openjdk-21.0.1" >> /data/data/com.termux/files/usr/etc/bash.bashrc
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /data/data/com.termux/files/usr/etc/bash.bashrc
else
    touch /data/data/com.termux/files/usr/etc/bash.bashrc
    echo "export JAVA_HOME=/data/data/com.termux/files/usr/opt/openjdk-21.0.1" >> /data/data/com.termux/files/usr/etc/bash.bashrc
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /data/data/com.termux/files/usr/etc/bash.bashrc
fi
echo "环境变量配置完成，请重启终端更新配置"