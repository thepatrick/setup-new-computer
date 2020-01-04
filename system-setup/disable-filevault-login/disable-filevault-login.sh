#!/bin/sh

defaults write \
  /Library/Preferences/com.apple.loginwindow \
  DisableFDEAutologin \
  -bool YES
