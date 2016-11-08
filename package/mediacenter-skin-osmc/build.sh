# (c) 2014-2015 Sam Nazarko
# email@samnazarko.co.uk

#!/bin/bash

. ../common.sh

REV="4e7d53efae045fa020e808e10061c41c97da5bb2"
echo -e "Building package mediacenter-skin-osmc"
echo -e "Downloading skin"
pull_source "https://github.com/osmc/skin.osmc/archive/${REV}.tar.gz" "$(pwd)/src"
if [ $? != 0 ]; then echo -e "Error downloading" && exit 1; fi
echo -e "Moving files in to place"
mkdir -p files/usr/share/kodi/addons
cp -ar src/skin.osmc-${REV}/ files/usr/share/kodi/addons/skin.osmc
dpkg_build files/ mediacenter-skin-osmc.deb
