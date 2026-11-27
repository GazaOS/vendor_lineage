PRODUCT_VERSION_MAJOR = 16
PRODUCT_VERSION_MINOR = 2

# crDroid flow versioning on Luna base
CR_VERSION_MAJOR = 16
CR_VERSION_MINOR = 2

GAZAOS_VERSION_MAJOR = 16
GAZAOS_VERSION_MINOR = 2
GAZAOS_VERSION := $(GAZAOS_VERSION_MAJOR).$(GAZAOS_VERSION_MINOR)
CR_VERSION := $(GAZAOS_VERSION)
LUNARIS_VERSION := $(GAZAOS_VERSION)

ifdef LUNARIS_BUILD_TYPE
GAZAOS_BUILD_TYPE ?= $(LUNARIS_BUILD_TYPE)
endif
GAZAOS_BUILD_TYPE ?= Community
CR_BUILD_TYPE ?= $(GAZAOS_BUILD_TYPE)
LUNARIS_BUILD_TYPE ?= $(GAZAOS_BUILD_TYPE)
ifdef LUNARIS_MAINTAINER
GAZAOS_MAINTAINER ?= $(LUNARIS_MAINTAINER)
endif
GAZAOS_MAINTAINER ?= GazaOS Team
LUNARIS_MAINTAINER ?= $(GAZAOS_MAINTAINER)

_gazaos_empty :=
_gazaos_space := $(_gazaos_empty) $(_gazaos_empty)
_GAZAOS_MAINTAINER_ESC := $(subst $(_gazaos_space),__GAZAOS_SPACE__,$(strip $(GAZAOS_MAINTAINER)))

ifeq ($(WITH_GMS),true)
GAZAOS_BUILD_VARIANT := GMS
else
GAZAOS_BUILD_VARIANT := VANILLA
endif
CR_BUILD_VARIANT := $(GAZAOS_BUILD_VARIANT)
LUNARIS_BUILD_VARIANT := $(GAZAOS_BUILD_VARIANT)

# Internal package version following crDroid + Lunaris official naming:
# GazaOSAndroid-<ANDROID_VERSION>-<DATE>-<DEVICE>-v<VERSION>-<BUILD_TYPE>-<VARIANT>
LINEAGE_VERSION := GazaOSAndroid-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-v$(GAZAOS_VERSION)-$(GAZAOS_BUILD_TYPE)-$(GAZAOS_BUILD_VARIANT)

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
    ro.gazaos.maintainer=$(_GAZAOS_MAINTAINER_ESC) \
    ro.crdroid.version=$(GAZAOS_VERSION) \
    ro.crdroid.build.version=$(GAZAOS_VERSION) \
    ro.crdroid.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.crdroid.build.type=$(GAZAOS_BUILD_TYPE) \
    ro.crdroid.package.type=$(GAZAOS_BUILD_TYPE) \
    ro.crdroid.edition=$(GAZAOS_BUILD_VARIANT) \
    ro.crdroid.maintainer=$(_GAZAOS_MAINTAINER_ESC) \
    ro.lunaris.build.version=$(GAZAOS_VERSION) \
    ro.lunaris.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.lunaris.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.lunaris.package.type=$(GAZAOS_BUILD_TYPE) \
    ro.lunaris.maintainer=$(_GAZAOS_MAINTAINER_ESC)

ifdef LINEAGE_BUILD
PRODUCT_SYSTEM_PROPERTIES += \
    ro.gazaos.device=$(LINEAGE_BUILD) \
    ro.crdroid.device=$(LINEAGE_BUILD)
endif
