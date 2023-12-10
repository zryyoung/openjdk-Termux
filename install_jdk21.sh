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
if  [ -d jdk     ];  then
  echo "已下载完成 正在配置环境变量"
elif ! [ -f jdk.zip   ]; then 
	echo "正在安装"
	apt install wget -y
	wget -c https://github.com/zryyoung/openjdk-Termux/releases/tag/openjdk-21.0.1 -O jdk.zip &&
	echo "下载完成  正在解压" 
fi
unzip jdk.zip &&
rm -rf jdk.zip &&
vartmp1=$(cat $HOME/.bashrc | grep "export PATH=$PWD/jdk/bin/:\$PATH")
if [ ! -n "$vartmp1" ] ; then 
	echo export LD_LIBRARY_PATH=$PWD/jdk/lib/:$PWD/jdk/lib/jli/:$PWD/jdk/lib/server/ >> $HOME/.bashrc
	echo export PATH=$PWD/jdk/bin/:\$PATH >> $HOME/.bashrc
fi
unset vartmp1
	echo "环境变量配置完成，请重启终端更新配置"
