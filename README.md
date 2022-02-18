# CutefishDEBuild.sh
* Cutefish桌面环境自动编译脚本 。
* 作者: Moore、wujunyi。
## 概要
* 本脚本用于编译cutefish官方DE，基于官方编译方法，使用select和case语句以实现选择，并添加if语句检测文件夹。
* 适用于大部分的Ubuntu/Debian发行版，已在Ubuntu2110、2104、2010、2004、Debian11测试过，可以完美一键编译。
* 如果你有更多时间，可以一键编译；如果没有，也可以分开选择。
## 更新日志
* 1.0 2022年1月2日 基本框架已经完成，可正常编译，if语句和echo提示语暂未完工。
* 2.0 2022年1月2日 增加了一次编译所有项目的功能，并将克隆网址由https改为git，一些小修小改。
* 3.0 2022年2月16日 根据网传编译顺序进行排序，完善一键编译，实测已无明显bug。
* 4.0 2022年2月17日 修复一个小bug，新增两个编译项目。
## 提交Bug以及完善
* 如果你有更好的解决方案或者想出一份力可以提交PR。
* 如果编译出现问题请提交Issues。
## 使用方法
* 打开终端模拟器并依次输入：
> GitHub
```bash
git clone https://github.com/Moore2253/CutefishDEBuild.sh.git
cd ~/CutefishOSBuild.sh
chmod +x ./build.sh
bash ./build.sh
```
> Gitee
```bash
git clone https://gitee.com/moore123/CutefishDEBuild.sh.git
cd ~/CutefishOSBuild.sh
chmod +x ./build.sh
bash ./build.sh
```
* 输入项目前序号1-25即可单独编译，输入26将一键按顺序编译全部，输入27退出脚本运行。
