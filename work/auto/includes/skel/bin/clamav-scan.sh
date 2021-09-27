#!/bin/bash
######################################
#   clamav-scan.sh
#
#   @1 検査path/file
######################################
#freshclamがエラー扱いになる
#set -e

LOG_FILE=$HOME/.local/var/log/clamav-scan.log
MESSAGE_PREFIX="clamav-scan.sh "
EXEC_NOTIFY_SCRIPT="mousepad $LOG_FILE"

######################################
#   SCANログ作成
######################################
create_scan_log() {
    if [[ ! -d $(dirname "$LOG_FILE") ]] ; then
        mkdir -p $(dirname "$LOG_FILE")
    fi
    
    #ログファイルオーナーをユーザにするため事前にログファイルを作成
    touch "$LOG_FILE"
}

######################################
#   例外
#
#   @1 exit code
#   @2 log message
######################################
throw() {
    log "ERROR_CODE=$1 $2"
    exit $1
}

######################################
#   ログ出力
#
#   @1 log message
######################################
log() {
    logger "$MESSAGE_PREFIX$1"
}

######################################
#   通知
#
#   @1 error code
######################################
notify() {
    nohup bash -c "$EXEC_NOTIFY_SCRIPT" >/dev/null 2>&1 &
}

######################################
#   main
######################################

if [[ ! -d "$1" && ! -f "$1" ]] ; then
    throw 1 "not define scan dir/file"
fi

create_scan_log

#0ではなく1がreturnされるため
#sudo freshclam || throw "$?" "failure freshclam"
sudo freshclam

#sudo clamscan -r -l "$LOG_FILE" "$1"
sudo clamdscan -l "$LOG_FILE" "$1"

if [[ "$?" = 1 ]] ; then
    notify $?
elif [[ "$?" = 0 ]] ; then
    :
else
    throw "$?" "fairure clamscan"
fi
