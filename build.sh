#!/bin/bash
#case select test for
echo '欢迎使用CutefishDE自动编译脚本, 本脚本适用于大部分Debian/Ubuntu发行版, 旨在让更多Linux使用可爱鱼.'
echo '若编译出现错误可根据官方GitHub自行修改脚本内容再次编译, 官方Github: https://github.com/cutefishos/ .'
echo '原作者Moore本墨, Github: https://github.com/Moore2253/CutefishOSBuild.sh'
echo '增加了一次编译所有库的功能, 修改者wujunyi'
echo '提示: 请输入项目前序号并回车以开始编译, 输入25(quit)退出'

PS3='请选择你要编译的项目, 27为退出: '
echo $PS3
echo '检测~/目录下是否存在是否已经存在cutefishos文件夹'
if test -e ~/cutefishos 
then
  echo '检测到同名文件夹, 正在删除'
  sudo rm -rf ~/cutefishos
  echo '删除完毕, 重新创建文件夹, 继续编译'
  mkdir ~/cutefishos
else
  echo "无同名文件夹, 继续编译"
  mkdir ~/cutefishos
fi

echo '开始安装依赖'
sudo apt install libpolkit-qt5-1-dev qml-module-qtquick-dialogs libxcb-damage0-dev libicu-dev libqapt-dev libkf5solid-dev pkg-config extra-cmake-modules libpam0g-dev libxcb-util-dev lintian libsm-dev libkf5screen-dev libxcb-composite0-dev qml-module-qt-labs-settings libqt5sensors5-dev libcanberra-dev qml-module-qtqml debhelper libfreetype6-dev libkf5bluezqt-dev qml-module-qtquick-shapes libapt-pkg-dev xserver-xorg-dev qtbase5-dev libx11-dev libcrypt-dev libfontconfig1-dev cmake qml-module-qtquick-particles2 libxcb1-dev xserver-xorg-input-synaptics-dev libkf5idletime-dev libkf5networkmanagerqt-dev automake libqt5x11extras5-dev git libxcb-dri2-0-dev qml-module-qtquick2 libxcursor-dev qttools5-dev qml-module-qtquick-layouts libcanberra-pulse libxcb-keysyms1-dev libsystemd-dev gcc -y libxcb-glx0-dev qttools5-dev-tools qml-module-qtquick-window2 libxcb-image0-dev libcap-dev libpulse-dev libxcb-randr0-dev qml-module-qtquick-controls2 libxcb-shm0-dev libxcb-ewmh-dev equivs libxcb-icccm4-dev qtdeclarative5-dev libkf5kio-dev qtquickcontrols2-5-dev libkf5coreaddons-dev devscripts libxcb-xfixes0-dev libxcb-record0-dev qml-module-qt-labs-platform libxtst-dev libxcb-dpms0-dev build-essential libkf5windowsystem-dev xserver-xorg-input-libinput-dev autotools-dev libx11-xcb-dev libxcb-dri3-dev qml-module-org-kde-kwindowsystem libkf5globalaccel-dev qtbase5-private-dev modemmanager-qt-dev libpolkit-agent-1-dev curl libxcb-shape0-dev --no-install-recommends -y

function Compile(){
    case $1 in 
        filemanager)
        echo '开始编译filemanager'
        cd ~/cutefishos
        echo '正在克隆项目'
        git clone git://github.com/cutefishos/filemanager.git
        echo '正在编译'
        cd ~/cutefishos/filemanager
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        echo '编译完成, 正在安装'
        sudo make install
        echo 'filemanager安装完成'
        ;;
        dock)
        echo '开始编译dock'
        cd ~/cutefishos
        echo '正在克隆项目'
        git clone git://github.com/cutefishos/dock.git
        echo '正在编译'
        cd ~/cutefishos/dock
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        echo '编译完成, 正在安装'
        sudo make install
        echo 'dock安装完成'
        ;;
        fishui)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/fishui.git
        cd ~/cutefishos/fishui
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        screenshot)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/screenshot.git
        cd ~/cutefishos/screenshot
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        qt-plugins)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/qt-plugins.git
        cd ~/cutefishos/qt-plugins
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        ;;
        terminal)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/terminal.git
        cd ~/cutefishos/terminal
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        ;;
        launcher)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/launcher.git
        cd ~/cutefishos/launcher
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        settings)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/settings.git
        cd ~/cutefishos/settings
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        debinstaller)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/debinstaller.git
        cd ~/cutefishos/debinstaller
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        icons)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/icons.git
        cd ~/cutefishos/icons
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake  ..
        make
        sudo make install
        ;;
        gtk-themes)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/gtk-themes.git
        cd ~/cutefishos/gtk-themes
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        daemon)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/daemon.git
        cd ~/cutefishos/daemon
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        statusbar)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/statusbar.git
        cd ~/cutefishos/statusbar
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        libcutefish)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/libcutefish.git
        cd ~/cutefishos/libcutefish
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        ;;
        core)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/core.git
        cd ~/cutefishos/core
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        updator)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/updator.git
        cd ~/cutefishos/updator
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        screenlocker)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/screenlocker.git
        cd ~/cutefishos/screenlocker
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        texteditor)
        cd ~/cutefishos
        sudo mk-build-deps -i -t "apt-get --yes" -r
        git clone git://github.com/cutefishos/texteditor.git
        cd ~/cutefishos/texteditor
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        calculator)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/calculator.git
        cd ~/cutefishos/calculator
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        ;;
        kwin-plugins)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/kwin-plugins.git
        cd ~/cutefishos/kwin-plugins
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        ;;
        videoplayer)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/videoplayer.git
        cd ~/cutefishos/videoplayer
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        sddm-theme)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/sddm-theme.git
        cd ~/cutefishos/sddm-theme
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        ;;
        appmotor)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/appmotor.git
        cd ~/cutefishos/appmotor
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        wallpapers)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/wallpapers.git
        cd ~/cutefishos/wallpapers
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        calamares)
        cd ~/cutefishos
        git clone git://github.com/cutefishos/calamares.git
        cd ~/cutefishos/calamares
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        quit)
        exit 1
        ;;
        *)
        echo "输入错误, 请输入项目前序号或者输入27(quit)退出"
        ;;
    esac
}

select i in fishui libcutefish qt-plugins kwin-plugins core daemon filemanager dock screenshot terminal launcher settings debinstaller icons gtk-themes statusbar updator screenlocker calculator videoplayer sddm-theme appmotor wallpapers calamares texteditor all quit
do
   if test $i == all
   then
       for j in fishui libcutefish qt-plugins kwin-plugins core daemon filemanager dock screenshot terminal launcher settings debinstaller icons gtk-themes statusbar updator screenlocker calculator videoplayer sddm-theme appmotor wallpapers calamares texteditor
       do
          Compile $j
        done
    else
       Compile $i
    fi
done
