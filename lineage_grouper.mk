#
# Copyright 2013 The Android Open-Source Project
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

# Release name
PRODUCT_RELEASE_NAME := Nexus7

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inherit from grouper device
$(call inherit-product, device/asus/grouper/device.mk)
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

PRODUCT_NAME   := lineage_grouper
PRODUCT_DEVICE := grouper
PRODUCT_BRAND  := Google
PRODUCT_MODEL  := Nexus 7
PRODUCT_MANUFACTURER := Asus
