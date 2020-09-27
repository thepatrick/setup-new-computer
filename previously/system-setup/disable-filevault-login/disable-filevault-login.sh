#!/bin/sh

defaults write \
  /Library/Preferences/com.apple.loginwindow \
  DisableFDEAutoLogin \
  -bool YES
