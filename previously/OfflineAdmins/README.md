# Offline Admins

Setups a systemd unit to manually provide admin rights to any user that is a member of any Active Directory group configured to have admin rights on the current Mac. 

This exists because if a users group membership is evaluated when an Active Directory Domain Controller is not reachable (and this has not been cached recently) then the user ends up without admin access. Depending on your machine config and users this could be annoying (have to connect to a VPN just to complete a task) to causing a major disrutpion (e.g. the VPN requires a VPN update before it can connect, but installing that update requires admin permission).

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
