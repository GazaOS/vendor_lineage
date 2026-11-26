#
# Copyright (C) 2026 GazaOS Project
# SPDX-License-Identifier: Apache-2.0
#

# GazaOS Bootanimation configuration
TARGET_SCREEN_WIDTH ?= 1080
TARGET_SCREEN_HEIGHT ?= 2400
TARGET_BOOTANIMATION ?= vendor/lineage/prebuilt/common/media/bootanimation_1080.zip

ifneq ($(TARGET_BOOTANIMATION),)
PRODUCT_COPY_FILES += \
    $(TARGET_BOOTANIMATION):$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif

# Touch responsiveness, frame pacing & blur efficiency
TARGET_LOW_END_BLUR ?= true

PRODUCT_PRODUCT_PROPERTIES += \
    ro.input.video_enabled=false \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true \
    debug.hwui.use_hint_manager=true

# SurfaceFlinger display & color management
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.use_color_management=true

# Optimized dexopt & boot execution
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.boot-dex2oat-threads=8 \
    dalvik.vm.dex2oat-threads=6

# GazaOS system identification
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.gazaos.brand=GazaOS \
    persist.sys.gazaos.lab=true \
    ro.gazaos.motto=Free_Palestine \
    ro.gazaos.hybrid=Lunaris-crDroid-LineageOS

# ViPER4AndroidFX Audio Suite
ifneq ($(TARGET_EXCLUDE_V4A),true)
PRODUCT_PACKAGES += \
    ViPER4AndroidFX
endif
