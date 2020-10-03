#!/bin/bash


URL=https://mangasum.com/manga/mahouka-koukou-no-rettousei-natsuyasumi-hen-raw/chapter-14/515354

OUT_PATH=/home/user/DL/mahou_natu/01
#OUT_PATH=./mahou_natu/01

USER_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4209.0 Safari/537.36"

wget \
    "$*" \
    -r \
    -l 1 \
    -c \
    -nd \
    -nc \
    -np \
    -H \
    -A jpg \
    --no-check-certificate \
    --user-agent="${USER_AGENT}" \
    -P "${OUT_PATH}" \
    "${URL}"


