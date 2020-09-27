#!/bin/sh

security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /Library/Management/twopats.thepatrick.cloud/CA/thepatrick.cloud.pem

security add-trusted-cert -d -r trustAsRoot -k /Library/Keychains/System.keychain /Library/Management/twopats.thepatrick.cloud/CA/twopats.thepatrick.cloud.pem
