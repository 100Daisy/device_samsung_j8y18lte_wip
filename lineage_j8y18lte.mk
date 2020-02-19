#
# Copyright (C) 2017 The LineageOS Project
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

# Boot animation
TARGET_SCREEN_HEIGHT := 2220
TARGET_SCREEN_WIDTH := 1080

ifeq ($(BUILD_64BIT),true)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
endif

ifeq ($(BUILD_TWRP),true)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/lineage/config/common.mk)

PRODUCT_PACKAGES += \
	libxml2

else

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/j8y18lte/device.mk)

# Overlay
PRODUCT_PACKAGE_OVERLAYS += \
	$(LOCAL_PATH)/overlay-lineage

# Trust HAL
PRODUCT_PACKAGES += \
	vendor.lineage.trust@1.0-service

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.samsung

# LiveDisplay
PRODUCT_PACKAGES += \
	vendor.lineage.livedisplay@2.0-service.samsung-qcom

endif

# Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_j8y18lte
PRODUCT_DEVICE := j8y18lte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-J810M
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung
TARGET_VENDOR := samsung
TARGET_VENDOR_PRODUCT_NAME := j8y18lte

PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="j8y18lteub-user 8.0.0 R16NW J810MUBS2ARL2 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := samsung/j8y18lteub/j8y18lte:8.0.0/R16NW/J810MUBS2ARL2:user/release-keys