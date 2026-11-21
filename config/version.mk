PRODUCT_VERSION_MAJOR = 16
PRODUCT_VERSION_MINOR = 2

# crDroid flow versioning on Luna base
CR_VERSION_MAJOR = 16
CR_VERSION_MINOR = 2

GAZAOS_VERSION_MAJOR = 16
GAZAOS_VERSION_MINOR = 2
GAZAOS_VERSION := $(GAZAOS_VERSION_MAJOR).$(GAZAOS_VERSION_MINOR)
CR_VERSION := $(GAZAOS_VERSION)

GAZAOS_BUILD_TYPE ?= Community
CR_BUILD_TYPE ?= $(GAZAOS_BUILD_TYPE)
GAZAOS_MAINTAINER ?= GazaOS Team

ifeq ($(WITH_GMS),true)
GAZAOS_BUILD_VARIANT := GMS
else
GAZAOS_BUILD_VARIANT := VANILLA
endif

# Internal package version following crDroid naming:
# GazaOSAndroid-<ANDROID_VERSION>-<DATE>-<DEVICE>-v<VERSION>
LINEAGE_VERSION := GazaOSAndroid-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-v$(GAZAOS_VERSION)

# Display version
LINEAGE_DISPLAY_VERSION := v$(GAZAOS_VERSION)

# System properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.gazaos.version=$(GAZAOS_VERSION) \
    ro.gazaos.build.version=$(GAZAOS_VERSION) \
    ro.gazaos.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.gazaos.build.type=$(GAZAOS_BUILD_TYPE) \
    ro.gazaos.package.type=$(GAZAOS_BUILD_TYPE) \
    ro.gazaos.edition=$(GAZAOS_BUILD_VARIANT) \
    ro.gazaos.maintainer=$(GAZAOS_MAINTAINER) \
    ro.crdroid.version=$(GAZAOS_VERSION) \
    ro.crdroid.build.version=$(GAZAOS_VERSION) \
    ro.crdroid.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.crdroid.build.type=$(GAZAOS_BUILD_TYPE) \
    ro.crdroid.package.type=$(GAZAOS_BUILD_TYPE) \
    ro.crdroid.edition=$(GAZAOS_BUILD_VARIANT) \
    ro.crdroid.maintainer=$(GAZAOS_MAINTAINER) \
    ro.lunaris.build.version=$(GAZAOS_VERSION) \
    ro.lunaris.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.lunaris.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.lunaris.package.type=$(GAZAOS_BUILD_TYPE) \
    ro.lunaris.maintainer=$(GAZAOS_MAINTAINER)

ifdef LINEAGE_BUILD
PRODUCT_SYSTEM_PROPERTIES += \
    ro.gazaos.device=$(LINEAGE_BUILD) \
    ro.crdroid.device=$(LINEAGE_BUILD)
endif
