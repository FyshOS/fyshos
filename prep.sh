#!/bin/sh

ARCH="${1:-x86_64}"

convert -font open-sans-bold -pointsize 22 -fill white -weight bold -draw "text 405,47 \"$ARCH\" " ./img/splash.png splash-tmp.png
export DATE="`date "+%Y-%m-%d %H:%M:%S %Z"`"
convert -font open-sans-bold -pointsize 15 -fill white -weight bold -draw "text 191,107 \"Built: ${DATE}\" " ./splash-tmp.png ./config/includes.binary/isolinux/splash.png
rm splash-tmp.png

lb config

