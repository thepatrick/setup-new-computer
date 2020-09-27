# Disable FileVault Auto Login

When FileVault is enabled, at least prior to Big Sur, the login screen presented (before the disk is unlocked) has no smart card support - it allows entering a password of a user (that is allowed to unlock the disk, such as the intiial user) and does not require a smart card to login. It then skips the macOS Login Screen, and takes you to the user that was authenticated while unlocking the disk.

If you wish to require a smart card to login, you will likely want to disable this behaviour - which is easy to do with a `defaults write` command. Users will now see a second login prompt, which supports smart cards (including configuration requiring their use)

## Big Sur

On one of my non-AD bound systems that use a locally paired smart card I see support for Smart Card login at the FileVault login screen. 