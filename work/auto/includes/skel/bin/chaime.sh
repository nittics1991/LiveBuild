#!/bin/bash

pacat --volume=32000 /usr/lib/libreoffice/share/gallery/sounds/drama.wav

#調査コマンド 51-60件目のみ
#find /usr/ -name "*.wav" 2>/dev/null |sed -n '51,60p' |xargs -I {} bash -c 'echo {}; sleep 1; pacat --volume=32000 {}'
