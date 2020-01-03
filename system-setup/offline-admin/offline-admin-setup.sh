#!/bin/sh

# Unload any existing LaunchDaemon in case of upgrades
launchctl unload /Library/LaunchDaemons/cloud.thepatrick.twopats.offline-admin.plist

# Move LaunchDaemon into place - this ensures local admin rights are maintained off-network
cp /Library/Management/twopats.thepatrick.cloud/offline-admin/cloud.thepatrick.twopats.offline-admin.plist /Library/LaunchDaemons/cloud.thepatrick.twopats.offline-admin.plist
launchctl load /Library/LaunchDaemons/cloud.thepatrick.twopats.offline-admin.plist
