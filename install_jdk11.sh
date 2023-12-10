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
if  [ -d openjdk-11.0.12-aarch64     ];  then
  echo "已下载完成 正在配置环境变量"
elif ! [ -f openjdk-11.0.12-aarch64.zip   ]; then 
	echo "正在安装"
	pkg install wget -y
	wget https://github.com/zryyoung/openjdk-Termux/releases/download/openjdk-11.0.12/openjdk-11.0.12-aarch64.zip -O openjdk-11.0.12-aarch64.zip &&
	echo "下载完成  正在解压" 
fi
unzip openjdk-11.0.12-aarch64.zip &&
rm -rf openjdk-11.0.12-aarch64.zip &&
if [ -f "$HOME/.bashrc" ]; then
    echo "export JAVA_HOME=~/openjdk-11.0.12" >> $HOME/.bashrc
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> $HOME/.bashrc
else
    touch $HOME/.bashrc
    echo "export JAVA_HOME=~/openjdk-11.0.12" >> $HOME/.bashrc
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> $HOME/.bashrc
fi
echo "环境变量配置完成，请重启终端更新配置"