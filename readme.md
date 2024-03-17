#      Openjdk for Termux 
## Install openjdk17/21
1.更新源
```bash
pkg update && pkg upgrade
```
2.安装wget
```bash
pkg install wget -y
```
3.下载一键安装脚本

安装openjdk11
```bash
wget https://raw.githubusercontent.com/zryyoung/openjdk-Termux/main/install_jdk11.sh
```
安装openjdk21
```bash
wget https://raw.githubusercontent.com/zryyoung/openjdk-Termux/main/install_jdk21.sh
```
4.执行脚本
```bash
bash install_jdk11.sh
```
5.查看Java版本
```bash
java -version
```
jdk21有异常，不过问题不大

[openjdk-21.0.1-aarch64.zip](https://github.com/zryyoung/openjdk-Termux/releases/tag/openjdk-21.0.1)

[openjdk-11.0.12-aarch64.zip](https://github.com/zryyoung/openjdk-Termux/releases/tag/openjdk-11.0.12)
### 推荐使用openjdk21的deb安装
1. 下载
```bash
wget https://github.com/zryyoung/openjdk-Termux/releases/download/openjdk-21.0.1.deb.zip/OpenJdk-21-and-alot-of-debs.zip
```
2. 解压
```bash
mkdir openjdk21
```
```bash
unzip OpenJdk-21-and-alot-of-debs.zip -d ~/openjdk21
```
3. 安装
```bash
cd openjdk21
```
```bash
dpkg -i openjdk-21_21.0.1_aarch64.deb
```
## install Maven
1.下载一键脚本
```bash
wget https://raw.githubusercontent.com/zryyoung/openjdk-Termux/main/install_maven.sh
```
2执行脚本
```bash
bash install_maven.sh
```
