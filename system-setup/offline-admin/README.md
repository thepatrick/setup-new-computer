Check Local Admin
=================

This script runs at startup and syncs the members of AD group in the "Allow Administration By"
field with proper local admins on the Mac. 

This means that the members of the AD group
specified in "Allow Administration By" can still do admin and sudo tasks offline, which isn't
the case otherwise.

If no network is found, or it can't see AD, it leaves everything as is.

This is based on the code from [Graham Pugh](https://github.com/grahampugh/osx-scripts/tree/master/check_local_admin).

To install:

* Put in offline-admin.sh in `/Library/Management/twopats.thepatrick.cloud/offline-admin/offline-admin.sh`

* Put cloud.thepatrick.twopats.offline-admin.plist in `/Library/LaunchDaemons/cloud.thepatrick.twopats.offline-admin.plist`

* Initialise with `launchctl load /Library/LaunchDaemons/cloud.thepatrick.twopats.offline-admin.plist`

Or just use the installer (look in the Github Releases section)
