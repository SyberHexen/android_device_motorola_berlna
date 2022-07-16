#
# Copyright (C) 2022 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/nothing/spacewar

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-service \
    android.hardware.boot@1.1-impl-wrapper.recovery \
    android.hardware.boot@1.1-impl-wrapper \
    android.hardware.boot@1.1-impl.recovery \
    bootctrl.lahaina \
    bootctrl.lahaina.recovery

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
