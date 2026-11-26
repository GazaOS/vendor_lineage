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
    ro.gazaos.logo=gazaos \
    ro.gazaos.motto=Free_Palestine \
    ro.gazaos.hybrid=Lunaris-crDroid-LineageOS \
    ro.gazaos.ui=HyperOS-Hybrid

# Lightweight HyperOS 4 Wallpapers (Partner Customization)
ifneq ($(TARGET_EXCLUDE_HYPEROS_WALLPAPERS),true)
PRODUCT_PACKAGES += \
    GazaOSWallpapers
endif

# Lightweight HyperOS 4 UI sounds, alarms, notifications, ringtones, and MiSans Latin font
PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/media/audio/ui/HyperOS4_Lock.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/HyperOS4_Lock.ogg \
    vendor/lineage/prebuilt/common/media/audio/ui/HyperOS4_Unlock.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/HyperOS4_Unlock.ogg \
    vendor/lineage/prebuilt/common/media/audio/ui/HyperOS4_ChargingStarted.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/HyperOS4_ChargingStarted.ogg \
    vendor/lineage/prebuilt/common/media/audio/ui/HyperOS4_WirelessChargingStarted.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/HyperOS4_WirelessChargingStarted.ogg \
    vendor/lineage/prebuilt/common/media/audio/alarms/HyperOS_AlarmClock.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/HyperOS_AlarmClock.ogg \
    vendor/lineage/prebuilt/common/media/audio/alarms/HyperOS_Breeze.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/HyperOS_Breeze.ogg \
    vendor/lineage/prebuilt/common/media/audio/alarms/HyperOS_Daydream.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/HyperOS_Daydream.ogg \
    vendor/lineage/prebuilt/common/media/audio/alarms/HyperOS_Dewdrops.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/HyperOS_Dewdrops.ogg \
    vendor/lineage/prebuilt/common/media/audio/alarms/HyperOS_Fireflies.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/HyperOS_Fireflies.ogg \
    vendor/lineage/prebuilt/common/media/audio/alarms/HyperOS_Morning.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/HyperOS_Morning.ogg \
    vendor/lineage/prebuilt/common/media/audio/alarms/HyperOS_Sunrise.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/HyperOS_Sunrise.ogg \
    vendor/lineage/prebuilt/common/media/audio/notifications/HyperOS_Bottle.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/HyperOS_Bottle.ogg \
    vendor/lineage/prebuilt/common/media/audio/notifications/HyperOS_Bubble.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/HyperOS_Bubble.ogg \
    vendor/lineage/prebuilt/common/media/audio/notifications/HyperOS_Chirp.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/HyperOS_Chirp.ogg \
    vendor/lineage/prebuilt/common/media/audio/notifications/HyperOS_Crystal.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/HyperOS_Crystal.ogg \
    vendor/lineage/prebuilt/common/media/audio/notifications/HyperOS_Fresh.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/HyperOS_Fresh.ogg \
    vendor/lineage/prebuilt/common/media/audio/notifications/HyperOS_Harp.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/HyperOS_Harp.ogg \
    vendor/lineage/prebuilt/common/media/audio/notifications/HyperOS_Moment.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/HyperOS_Moment.ogg \
    vendor/lineage/prebuilt/common/media/audio/notifications/HyperOS_Spring.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/HyperOS_Spring.ogg \
    vendor/lineage/prebuilt/common/media/audio/notifications/HyperOS_WaterDrop.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/HyperOS_WaterDrop.ogg \
    vendor/lineage/prebuilt/common/media/audio/notifications/HyperOS_WindChime.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/HyperOS_WindChime.ogg \
    vendor/lineage/prebuilt/common/media/audio/ringtones/HyperOS_Celesta.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/HyperOS_Celesta.ogg \
    vendor/lineage/prebuilt/common/media/audio/ringtones/HyperOS_Mi.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/HyperOS_Mi.ogg \
    vendor/lineage/prebuilt/common/media/audio/ringtones/HyperOS_MiHouse.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/HyperOS_MiHouse.ogg \
    vendor/lineage/prebuilt/common/media/audio/ringtones/HyperOS_MiJazz.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/HyperOS_MiJazz.ogg \
    vendor/lineage/prebuilt/common/media/audio/ringtones/HyperOS_MiMix2.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/HyperOS_MiMix2.ogg \
    vendor/lineage/prebuilt/common/media/audio/ringtones/HyperOS_MountainSpring.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/HyperOS_MountainSpring.ogg \
    vendor/lineage/prebuilt/common/media/audio/ringtones/HyperOS_Reveries.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/HyperOS_Reveries.ogg \
    vendor/lineage/prebuilt/common/fonts/MiSansLatinVF.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/MiSansLatinVF.ttf

# ViPER4AndroidFX Audio Suite
ifneq ($(TARGET_EXCLUDE_V4A),true)
PRODUCT_PACKAGES += \
    ViPER4AndroidFX
endif
