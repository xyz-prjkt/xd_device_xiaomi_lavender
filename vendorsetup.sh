#!/bin/bash

# Copyright 2021 a xyzprjkt property

ROOTDIR=$(realpath .)

aosptel() {
echo Patching AOSP Telephony implementation . . .
    rm -rf frameworks/opt/telephony
    rm -rf frameworks/opt/net/ims
    rm -rf packages/providers/TelephonyProvider
    rm -rf packages/services/Telephony
    rm -rf packages/apps/Stk
    git clone https://github.com/xdroid-AOSP/frameworks_opt_telephony frameworks/opt/telephony -b eleven-aosp
    git clone https://github.com/xdroid-AOSP/frameworks_opt_net_ims frameworks/opt/net/ims -b eleven-aosp
    git clone https://github.com/xdroid-AOSP/packages_providers_TelephonyProvider packages/providers/TelephonyProvider -b eleven-aosp
    git clone https://github.com/xdroid-AOSP/packages_services_Telephony packages/services/Telephony -b eleven-aosp
    git clone https://github.com/xdroid-AOSP/packages_apps_Stk packages/apps/Stk -b eleven-aosp
}

aospfwtel() {
    cd frameworks/base
    git fetch xdroid
    git cherry-pick da3c7e1
    cd ../../packages/apps/Settings
    git fetch xdroid
    git cherry-pick e83d6ed
}

aosptel
aospfwtel
cd $ROOTDIR

echo "Patch Successfully !"
    
