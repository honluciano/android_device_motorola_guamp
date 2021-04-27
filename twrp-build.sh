#!bin/bash

# Go to the working directory
mkdir ~/SHRP-10 && cd ~/SHRP-10

# Configure git
git config --global user.email "100Daisy@protonmail.com"
git config --global user.name "GitDaisy"
git config --global color.ui false

# Sync the source
repo init --depth=1 -u git://github.com/SHRP/platform_manifest_twrp_omni.git -b v3_10.0
repo sync  -f --force-sync --no-clone-bundle --no-tags -j$(nproc --all)

# Clone device tree and common tree
git clone --depth=1 https://github.com/100Daisy/android_device_motorola_guamp -b shrp-10 device/motorola/guamp

# Build recovery image
export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch omni_guamp-eng; make -j$(nproc --all) recoveryimage
# Rename and copy the files
shrp_version=$(cat ~/SHRP-10/bootable/recovery/variables.h | grep "define TW_MAIN_VERSION_STR" | cut -d '"' -f2)
date_time=$(date +"%d%m%Y%H%M")
mkdir ~/final
cp out/target/product/guamp/recovery.img ~/final/shrp-$shrp_version-guamp-"$date_time"-unofficial.img
cp SHRP*.zip ~/final/
# Upload to oshi.at
curl -T ~/final/*.img https://oshi.at
curl -T ~/final/SHRP_v*.zip https://oshi.at
curl -T ~/final/SHRP_AddonRescue*.zip https://oshi.at