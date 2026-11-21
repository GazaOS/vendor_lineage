# Touch responsiveness, frame pacing & smooth scrolling
PRODUCT_PRODUCT_PROPERTIES += \
    windowsmgr.max_events_per_sec=240 \
    persist.sys.scrollingcache=3 \
    debug.sf.disable_backpressure=1 \
    debug.hwui.render_dirty_regions=false

# SurfaceFlinger display & color management
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.use_color_management=true

# Optimized dexopt
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    pm.dexopt.boot-complete=verify \
    pm.dexopt.background-dexopt=everything

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
