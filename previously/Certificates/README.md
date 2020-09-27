# Certificates

This installs two certificates:

* thepatrick.cloud.pem - a root CA that is valid for ~ 20 years
* ad.thepatrick.cloud.pem - a intermediate CA that is valid for ~ 10 years

The intermediate should not normally be required, but the smart cards I was using do not contain the intermediate certifacte, so this needed to be on the machine (and trusted) as well.

## Big Sur

The script included will no longer work as is, due to changes - see [macOS 11 Big Sur: A bird’s-eye view](https://blogs.manageengine.com/desktop-mobile/desktopcentral/2020/09/09/macos-11-big-sur-a-birds-eye-view.html), specifically:

> With macOS Catalina and earlier, the command line security tool can be used to change certificate trust settings if the effective user is running as root via the add-trusted-cert flag. In macOS Big Sur, simply running with UID 0 will no longer be sufficient to make this change: confirmation will be required with an administrator password. Apple will allow the change to take place without confirmation if the certificate payload is deployed with the root certificate using a configuration profile.

