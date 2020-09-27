# Smartcard Login

Assuming you have setup a provisioning profile to enforce the use of smart cards, following [Configure macOS for smart card-only authentication](https://support.apple.com/en-us/HT208372) or other guides, you might want to allow logging in to network accounts, thankfully this isn't terribly difficult!

## SmartcardLogin.plist

Stored in `/etc/SmartcardLogin.plist`, this configures macOS to map smart cards to users (based on the common name from the certificate).

The `TrustedAuthorities` is SHA-256 Fingerprint of one or more certificate authorities (in this case the interemdiate CA, not the root) that will be trusted. I had to discover by trial and error the format expected (these fingeperints are usually presented as `8A 45 1B...` or `8A:45:1B:...` - this file expects no spaces or other seperators).

## The NoSmartcardRequired group

Users who do not have a smart card will not be able to login once this configuration is applied. To allow my per-machine local admin user to login, the postinstall script creates a group `NoSmartcardRequired`, and then adds all local users to it. The name of this group must match the one in `/etc/SmartcardLogin.plist`.