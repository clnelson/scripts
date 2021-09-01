#!/data/data/com.termux/files/usr/bin/env bash

adb kill-server || exit 13

adb start-server && adb connect "$1"

adb devices -l
