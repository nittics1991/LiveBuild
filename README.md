#ライブビルド

##準備
    `sudo apt install -y live-build syslinux-utils`
    `sudo mount -o remount,dev /dev/sda`

##auto初期化
    `cp usr/share/doc/live-build/examples/auto ./work/auto`

##USB ISO write
    USBの全データを消すことになるので注意
    `sudo apt install xorriso`
    lsblkでUSBデバイス確認
    `xorriso -as cdrecord -v dev=/dev/sdb blank=as_needed img.hybrid.iso`

##USB ISO write2
    USBの全データを消すことになるので注意
    `dd bs=4M if=AAA.iso of=/dev/sdc status=progress && sync ;`

##virtualbox準備
    sidは未対応 xubuntu usbで
    `sudo apt install -y virtualbox`
    `sudo modprobe vboxdrv`

##virtualbox設定
    EFI使用

##debian liveユーザ
    ユーザ user
    パスワード　live

##virtualbox　キー解除
    右ctrlでホストに戻す

##virtualbox tty表示
    右ctrl+F1 =>tty
    右ctrl+F7 =>Xwindow

##git repository
    LiveBuild -b test

##参考資料
    debian live-build マニュアル
    <https://live-team.pages.debian.net/live-manual/html/live-manual/index.ja.html>
    
    Debianで作る学習用 お気軽ライブ・システム(PDF)
    <http://yakushi.shinshu-u.ac.jp/debian-live/osc2013fukuoka-debian-live.pdf>
    
    ubuntu live-build マニュアル
    <https://wiki.ubuntu.com/Live-Build>

    lb_config
    <https://manpages.debian.org/buster/live-build/lb_config.1.ja.html>
    
    task package
    <https://packages.debian.org/buster/tasks/>

    debian パッケージ検索「
    <https://www.debian.org/distrib/packages>
    
    debootstrapで自分好みの日本語環境を作る
    <https://qiita.com/office-itou/items/3bb82a1f09114821ecd7>
    
    debian locale
    <https://wiki.debian.org/Locale>
    <https://qiita.com/tailak/items/77b90a4df07e4f6a1fc2>
    
    Debian GNU/Linux インストールガイド
    <https://www.debian.org/releases/stable/amd64/index.ja.html>
    
    Debian リファレンス
    <https://www.debian.org/doc/manuals/debian-reference/index.ja.html>
    
    xorriso
    <https://manpages.debian.org/buster/xorriso/xorrisofs.1.en.html>
    
    Xorg gentto manual
    <https://wiki.gentoo.org/wiki/Xorg/Guide/ja>
    
    AMDGPU gentoo
    <https://wiki.gentoo.org/wiki/AMDGPU>
    
    debian AMD/ATI Open Source Drivers (amdgpu, radeon, r128, mach64)
    <https://wiki.debian.org/AtiHowTo>
    
    VirtualBox Mania
    <https://vboxmania.net/>
    
