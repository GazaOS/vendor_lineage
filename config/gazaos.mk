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

# Touch responsiveness, frame pacing & smooth scrolling (Yaap / Axion inspired)
PRODUCT_PRODUCT_PROPERTIES += \
    windowsmgr.max_events_per_sec=240 \
    persist.sys.scrollingcache=3 \
    debug.sf.disable_backpressure=1 \
    debug.hwui.render_dirty_regions=false \
    view.scroll_friction=0.008 \
    view.touch_slop=8 \
    ro.input.video_enabled=false

# SurfaceFlinger display & color management
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.use_color_management=true

# Optimized dexopt & boot execution
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    pm.dexopt.boot-complete=verify \
    pm.dexopt.background-dexopt=everything \
    dalvik.vm.boot-dex2oat-threads=8 \
    dalvik.vm.dex2oat-threads=6

# GazaOS system identification
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.gazaos.brand=GazaOS \
    persist.sys.gazaos.lab=true \
    ro.gazaos.motto=Free_Palestine \
    ro.gazaos.hybrid=Lunaris-crDroid-LineageOS

# Extra packages
PRODUCT_PACKAGES += \
    BatteryStatsViewer \
    GameSpace \
    LMOFreeform \
    LMOFreeformSidebar \
    OmniJaws \
    OmniStyle

# ViPER4AndroidFX Audio Suite
ifneq ($(TARGET_EXCLUDE_V4A),true)
PRODUCT_PACKAGES += \
    ViPER4AndroidFX
endif
