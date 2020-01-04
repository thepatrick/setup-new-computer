#!/bin/sh

log() {
  echo $(date) "${@}"
}

GROUP_NAME=NoSmartcardRequired
GROUP_PATH=/Groups/${GROUP_NAME}

# Create NoSmartcardRequired group
log Creating ${GROUP_PATH}.
dscl . create ${GROUP_PATH}

dscl . create ${GROUP_PATH} RealName "No Smartcard Required"
dscl . create ${GROUP_PATH} passwd "*"
dscl . create ${GROUP_PATH} gid 799

dscl . list /Users | grep -v '^_.*\|daemon\|root\|nobody' | while read localUser
do
  # check if user is in the local admin group
  IsLocalAdmin=$(dseditgroup -o checkmember -m $localUser admin | awk '{print $1}')

  IsLocalAccount=no
  dscl . read "/Users/${localUser}" OriginalAuthenticationAuthority | grep OriginalAuthenticationAuthority &>/dev/null
  if [ $? -ne 0 ]; then
    IsLocalAccount=yes
  fi

	IsSmartCardDisabled=$(dseditgroup -o checkmember -m $localUser ${GROUP_NAME} | awk '{print $1}')

  if [[ "$IsLocalAccount" = "yes" ]]; then
    if [[ "$IsLocalAdmin" = "yes" ]]; then
      if [[ "$IsSmartCardDisabled" = "no" ]]; then
        log "${localUser}: Add to ${GROUP_NAME}"
        /usr/sbin/dseditgroup -o edit -a "$localUser" -t user "${GROUP_NAME}"
      else
        log "${localUser}: Already in ${GROUP_NAME}"
      fi
    else
      log "${localUser}: Is not an admin, ignoring"
    fi
  else
    log "${localUser}: User is not a local account."
  fi
done
