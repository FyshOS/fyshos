#!/bin/sh

DATE=`date "+%Y-%m-%d %H:%M:%S %Z"` convert -family Sans -pointsize 15 -fill white -weight bold -draw "text 191,107 \"Built: $DATE\" " ./img/splash.png ./config/includes.binary/isolinux/splash.png

lb config

