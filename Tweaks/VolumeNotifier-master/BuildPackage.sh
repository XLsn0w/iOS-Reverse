#!/bin/bash
export PATH=/opt/local/bin:/bin:/usr/bin
/usr/bin/find /Users/Zheng/Projects/VolumeNotifier/Products -name ".DS_Store" -depth -exec rm {} \;
/opt/local/bin/dpkg -e /Users/Zheng/Projects/VolumeNotifier/Packages/*.deb /Users/Zheng/Projects/VolumeNotifier/Products/DEBIAN
/opt/local/bin/dpkg -x /Users/Zheng/Projects/VolumeNotifier/Packages/*.deb /Users/Zheng/Projects/VolumeNotifier/Products
/opt/local/bin/dpkg -x /Users/Zheng/Projects/VolumeNotifier/VolumeNotifierPrefs/Packages/*.deb /Users/Zheng/Projects/VolumeNotifier/Products
/opt/local/bin/dpkg-deb -Z lzma -b /Users/Zheng/Projects/VolumeNotifier/Products /Users/Zheng/Projects/VolumeNotifier/com.darwindev.VolumeNotifier_0.3-7_iphoneos-arm.deb
/bin/rm -rf /Users/Zheng/Projects/VolumeNotifier/Products/*
