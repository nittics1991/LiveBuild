#ライブビルド

##準備
    `sudo apt install -y live-build syslinux-utils`
    `sudo mount -o remount,dev /dev/sda`

##auto初期化
    新規設計の場合に初回実施
    `cp usr/share/doc/live-build/examples/auto ./work/auto`

##live build
    base dir(./work)にて実行
    `sudo lb clean --all`
    `sudo lb clean --cache`
    `sudo lb clean --config`
    `sudo lb config`
    `sudo lb build`
    base dirにISOファイルが出来れば作成終了

##virtualboxテスト
    `install_bullseye_vbox.sh`
    `virtualbox`

##USB ISO write
    コピー先USBデバイス確認
    `lsblk`
    ISOファイルを指定し、USBの全データ書き換え
    `sudo dd bs=4M if=AAA.iso of=/dev/sdc status=progress && sync ;`







---


###USB ISO write
    USBの全データを消すことになるので注意
    `sudo apt install xorriso`
    lsblkでUSBデバイス確認の事
    `sudo xorriso -as cdrecord -v dev=stdio:/dev/sdc blank=as_needed img.hybrid.iso`


###USB ISO write3
    USBの全データを消すことになるので注意
    `sudo apt install ddrescue`
    sudo ddrescue ubuntu-20.04-beta-desktop-amd64.iso /dev/sdc --force -D

##parted
    unitで単位をMiBにすると扱いやすい
    全パーテーションを削除する場合、ラベルを作り直す mklabel gpt

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

##追加情報

###Isohybridについて
    Debian Liveで作成される標準isohybridは、gptパーテーションをappleで作る模様
    Apple Partition Mapは、全てのエリアをマップする
    xorriso/ddで作成するbootable USBはパーテーションを区切れない('20-12-30)
    partedで追加エリアが作れない理由として、これが原因と思われる
    
    Apple Partition Map
    <https://en.wikipedia.org/wiki/Apple_Partition_Map>
    
    
###動作確認用xubuntu USBについて

###USB作成
    xubuntuの最新をDL
    USBを接続し、lsblkでデバイス確認
    USBがマウントされた場合、umountする
    USBを全消去
        sudo parted /dev/sdc mklabel gpt
    USBにISOを書き込み
        xorriso/dd
    
###virtualbox起動まで
    作成したxutuntu USBで起動
        boot menu 1 without installで起動
        checksumで起動に時間がかかる
        英語OSで起動する
        languageパッケージはメモリ不足?でインストールできない
    vittualboxインストール
        sudo apt install -y virtualbox準備
        sudo modprobe vboxdrv
    virtualbox起動
        作業エリアを設定
            /media/user/hdd/debian/vm/xxxx
        言語を日本語に切り替え
        既存のファイルから起動
            デバイスCDをテストするDebianLive.imgを選択
            LiveCDのチェックを入れる
        CPU/memoryなど問題ないことを確認して起動する


###bullseyeへのインストール

    `wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -`
    `wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -`
    `echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bullseye contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list`
    `sudo apt update`
    `sudo apt install linux-headers-$(uname -r) dkms`
    `sudo apt install virtualbox-6.1`

    [How to Install VirtualBox on Debian 11](https://linoxide.com/how-to-install-virtualbox-on-debian-11/)


##関連dir
    /usr/lib/live/
    /usr/share/live/build.sh　がbuildエントリーポイント?
        ./build/buildが続く?

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
    
    Quita partedでディスクを初期化
    <https://qiita.com/propella/items/a085ec43fd59841da9d0>
    



