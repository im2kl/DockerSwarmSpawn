#!/bin/sh

## Require Packages
REQUIRED_PKG="docker docker-engine docker.io containerd runc"

#Iterate and install package
for pkg in $REQUIRED_PKG; do
    echo "> Checking $pkg"
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $pkg|grep -E 'install ok installed|deinstall ok config-files')
    echo "Checking for $pkg: $PKG_OK"
    if [ "" != "$PKG_OK" ]; then
    echo ">> $pkg Is Installed.\n Requesting Removal for: $pkg."
    sudo apt --yes --no-install-recommends remove $pkg
    fi
done

sudo apt auto-remove