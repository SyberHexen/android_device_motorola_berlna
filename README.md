# TWRP Device configuration for Motorola Edge 30

The Motorola Edge 30 (codenamed _"dubai"_) are high-end smartphones from Motorola.

It was announced in April 2022. Release date was May 2022.

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
SoC     | Qualcomm SM7350-AE Snapdragon 778G+ 5G (5 nm)
CPU     | Octa-core (1x2.5 GHz Cortex-A78 & 3x2.4 GHz Cortex-A78 & 4x1.8 GHz Cortex-A55)
GPU     | Adreno 642L
Memory  | 6 / 8 GB
Shipped Android Version | 12
Storage | 128 / 256 GB (UFS 3.1)
Battery | Non-removable Li-Po 4020 mAh
Dimensions | 159.4 x 74.2 x 6.8 mm (6.28 x 2.92 x 0.27 in)
Display | 1080 x 2400 pixels, AMOLED, 1B colors, 144Hz, HDR10+, 950 nits (HBM)
Rear Camera 1 | 50 MP, f/1.8, (wide), 1/1.55", 1.0µm, multi-directional PDAF, OIS
Rear Camera 2 | 50 MP, f/2.2, 118˚ (ultrawide), 1/2.76", 0.64µm, PDAF
Rear Camera 3 | 2 MP, f/2.4, (depth)
Front Camera | 32 MP, f/2.3, (wide), 0.7µm
Extras | Stereo Speakers, NFC, Bluetooth 5.2 A2DP LE, UDFPS, USB Type-C 2.0, Fast charging 33W
Ingress Protection | IP52
Touch Sampling Rate | 360 Hz

## Device picture

![Device Picture](https://motorolaau.vtexassets.com/arquivos/ids/156289/Motorola-edge-30-pdp-render-Silence-12-bcxm87y2.png)

## Kernel

Prebuilt kernel from stock ROM user-12-S1RD32.55-67-25c3ec-release-keys

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
  <project name="android_device_motorla_dubai" path="device/motorola/dubai" remote="TeamWin" revision="android-12.1"/>
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
lunch twrp_dubai-eng
make adbd bootimage
```
