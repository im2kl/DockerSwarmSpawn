#!/bin/sh

sudo apt update

## Require Packages
REQUIRED_PKG="gnupg2 software-properties-common apt-transport-https ca-certificates"

#Iterate and install package
for pkg in $REQUIRED_PKG; do
    echo "> Checking $pkg"
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $pkg|grep -E 'install ok installed')
    echo Checking for $pkg: $PKG_OK
    if [ "" = "$PKG_OK" ]; then
    echo ">> $pkg NotFound.\n Requesting Install for: $pkg."
    sudo apt --yes --no-install-recommends install $pkg
    fi
done