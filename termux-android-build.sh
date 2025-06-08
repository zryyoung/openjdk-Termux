#!/bin/bash

set -e

# 更新并安装构建工具相关依赖
pkg update -y
pkg install -y termux-services wget aapt aapt2 openjdk-17 gradle unzip

# 创建工作目录
mkdir -p $PREFIX/opt
# cd $PREFIX/opt

# 下载 SDK 和 NDK（由 zryyoung 提供）
echo "📦 下载 Android SDK..."
wget -O android-sdk-aarch64.zip https://github.com/zryyoung/openjdk-Termux/releases/download/android-sdk-aarch64/android-sdk-aarch64.zip

echo "📦 下载 Android NDK..."
wget -O android-ndk-r27b-aarch64.zip https://github.com/zryyoung/openjdk-Termux/releases/download/android-ndk/android-ndk-r27b-aarch64.zip

# 解压 SDK 和 NDK
echo "📂 解压 Android SDK..."
unzip -o android-sdk-aarch64.zip -d $PREFIX/opt

echo "📂 解压 Android NDK..."
unzip -o android-ndk-r27b-aarch64.zip -d $PREFIX/opt

# 删除安装包
rm -f android-sdk-aarch64.zip android-ndk-r27b-aarch64.zip

# 写入环境变量到 ~/.zshrc 或 ~/.bashrc（自动检测）
SHELL_RC="$HOME/.zshrc"
if [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
fi

echo "🔧 写入环境变量到 $SHELL_RC ..."
cat >> $SHELL_RC <<EOF

# >>> Android Build Environment >>>
export NDK_HOME=$PREFIX/opt/android-ndk-r27b
export ANDROID_SDK_ROOT=$PREFIX/opt/android-sdk
export PATH=\$PATH:\$ANDROID_SDK_ROOT/tools/:\
\$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/:\
\$ANDROID_SDK_ROOT/platform-tools:\
\$ANDROID_SDK_ROOT/build-tools:\
\$NDK_HOME:\
$PREFIX/opt/gradle/gradle-8.14/bin/
# <<< Android Build Environment <<<
EOF

# 应用配置
echo "🔁 重载配置文件..."
source "$SHELL_RC"

echo -e "\n✅ Android 构建环境已安装成功！"
echo -e "👉 请重新打开 Termux 或运行以下命令以生效环境变量：\n"
echo "source $SHELL_RC"



# 查看ndk版本
cat /data/data/com.termux/files/usr/opt/android-ndk-r27b/source.properties

# 查看sdk版本
cat /data/data/com.termux/files/usr/opt/android-sdk/platform-tools/source.properties