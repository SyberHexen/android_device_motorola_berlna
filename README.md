# TWRP Device configuration for Motorola Edge 2021

The Motorola Edge 2021 (codenamed _"berlna"_) are high-end smartphones from Motorola.

It was announced in August 19th 2021. Release date was September 2nd 2021.

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core (1x2.4 GHz Cortex-A78 & 3x2.2 GHz Cortex-A78 & 4x1.9 GHz Cortex-A55)
CHIPSET | Qualcomm SM7325 Snapdragon 778G
GPU     | Adreno 642L
Shipped Android Version | 11
Memory  | 8 GB
Storage | 256GB
Battery | 5000 mAh
Dimensions | 169 x 75.6 x 9 mm
Display | 1080 x 2460 pixels, 6.8" TFT IPS LCD, 144Hz, HDR10
Rear Camera  | 108 MP (f/1.9) + 8 MP (f/2.2) + 2 MP (f/2.4)
Front Camera | 32 MP (f/2.3)

## Device picture

![Device Picture](https://fdn2.gsmarena.com/vv/pics/motorola/motorola-edge-2021-00.jpg)

## Kernel

Prebuilt kernel from LineageOS

## Compile

First repo init the twrp-12.1 tree (and necessary qcom dependencies):

```
mkdir ~/android/twrp-12.1
cd ~/android/twrp-12.1
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
mkdir -p .repo/local_manifests
```

Then add to a local manifest (if you don't have .repo/local_manifest then make that directory and make a blank file and name it something like twrp.xml):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="osm0sis/twrp_abtemplate" path="bootable/recovery/installer" remote="github" revision="master"/>
  <project name="android_device_motorla_berlna" path="device/motorola/berlna" remote="TeamWin" revision="android-12.1"/>
</manifest>
```

Now you can sync your source:

```
repo sync
```

To automatically make the TWRP installer zip, you need to import this commit in the build/make path: https://gerrit.twrp.me/c/android_build/+/5445

Finally execute these:

```
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch twrp_berlna-eng
make adbd bootimage
```
