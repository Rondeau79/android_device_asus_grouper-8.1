#
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, hardware/nvidia/tegra3/tegra3.mk)

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Dalvik VM config
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# Build GO
$(call inherit-product, build/make/target/product/go_defaults.mk)

# Init files
PRODUCT_COPY_FILES += \
    device/asus/grouper/rootdir/init.grouper.usb.rc:root/init.grouper.usb.rc \
    device/asus/grouper/rootdir/ueventd.grouper.rc:root/ueventd.grouper.rc

# Prevent surfaceflinger crash
PRODUCT_COPY_FILES += \
    device/asus/grouper/91surface:system/etc/init.d/91surface

# HIDL
DEVICE_MANIFEST_FILE += device/asus/grouper/manifest.xml

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# File that declares the MIFARE NFC constant
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# Input device configs
PRODUCT_COPY_FILES += \
    device/asus/grouper/touchscreen/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc \
    device/asus/grouper/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# GPS
PRODUCT_COPY_FILES += \
    device/asus/grouper/gps/gps.conf:system/etc/gps.conf \
    device/asus/grouper/gps/gps.xml:system/etc/gps.xml

PRODUCT_PACKAGES += \
    libgpsd-compat \
    libstlport

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    libwpa_client \
    hostapd \
    wificond \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

WIFI_BAND := 802_11_BG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    libbt-vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    lights.grouper

# Keystore HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service

# Sensors
PRODUCT_COPY_FILES += \
    device/asus/grouper/sensors/sensors-load-calibration.sh:system/bin/sensors-load-calibration.sh

# Sensors HAL
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    sensors.grouper \
    libinvensense_hal \
    libmllite \
    libmplmpu

# USB HAL
PRODUCT_PACKAGES += \
	android.hardware.usb@1.0-service

# Power HAL
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    audio.primary.grouper \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

PRODUCT_COPY_FILES += \
    device/asus/grouper/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/asus/grouper/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# NFC
PRODUCT_PACKAGES += \
    nfc.grouper \
    libpn544_fw \
    Nfc \
    Tag

# Filesystem management tools
PRODUCT_PACKAGES += \
    fsck.f2fs \
    mkfs.f2fs

# Shell
ifneq ($(filter eng userdebug,$(TARGET_BUILD_VARIANT)),)
PRODUCT_PACKAGES += \
    Terminal
endif

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/asus/grouper/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/asus/grouper/media/media_codecs.xml:system/etc/media_codecs.xml

# Vendor blobs
$(call inherit-product, vendor/asus/grouper/asus-vendor.mk)
$(call inherit-product, vendor/broadcom/grouper/broadcom-vendor.mk)
