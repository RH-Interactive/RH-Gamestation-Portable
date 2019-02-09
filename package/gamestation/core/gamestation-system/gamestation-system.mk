################################################################################
#
# gamestation.linux System
#
################################################################################

GAMESTATION_SYSTEM_SOURCE=

GAMESTATION_SYSTEM_VERSION=1.0
GAMESTATION_SYSTEM_DEPENDENCIES = tzdata

ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_RPI3),y)
	GAMESTATION_SYSTEM_VERSION=rpi3
	GAMESTATION_SYSTEM_GAMESTATION_CONF=rpi3
	GAMESTATION_SYSTEM_SUBDIR=rpi-firmware
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_ROCKPRO64),y)
        GAMESTATION_SYSTEM_VERSION=rockpro64
        GAMESTATION_SYSTEM_GAMESTATION_CONF=rockpro64
        GAMESTATION_SYSTEM_SUBDIR=
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_XU4),y)
	GAMESTATION_SYSTEM_VERSION=odroidxu4
	GAMESTATION_SYSTEM_GAMESTATION_CONF=xu4
	GAMESTATION_SYSTEM_SUBDIR=
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_LEGACYXU4),y)
	GAMESTATION_SYSTEM_VERSION=odroidxu4
	GAMESTATION_SYSTEM_GAMESTATION_CONF=xu4
	GAMESTATION_SYSTEM_SUBDIR=
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_C2),y)
	GAMESTATION_SYSTEM_VERSION=odroidc2
	GAMESTATION_SYSTEM_GAMESTATION_CONF=c2
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_S905),y)
	GAMESTATION_SYSTEM_VERSION=s905
	GAMESTATION_SYSTEM_GAMESTATION_CONF=s905
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_S912),y)
        GAMESTATION_SYSTEM_VERSION=s912
        GAMESTATION_SYSTEM_GAMESTATION_CONF=s912
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_X86),y)
	GAMESTATION_SYSTEM_VERSION=x86
	GAMESTATION_SYSTEM_GAMESTATION_CONF=x86
	GAMESTATION_SYSTEM_SUBDIR=
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_X86_64),y)
	GAMESTATION_SYSTEM_VERSION=x86_64
	GAMESTATION_SYSTEM_GAMESTATION_CONF=x86_64
	GAMESTATION_SYSTEM_SUBDIR=
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_RPI2),y)
	GAMESTATION_SYSTEM_VERSION=rpi2
	GAMESTATION_SYSTEM_GAMESTATION_CONF=rpi2
	GAMESTATION_SYSTEM_SUBDIR=rpi-firmware
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_RPI1),y)
	GAMESTATION_SYSTEM_VERSION=rpi1
	GAMESTATION_SYSTEM_GAMESTATION_CONF=rpi1
	GAMESTATION_SYSTEM_SUBDIR=rpi-firmware
else
        GAMESTATION_SYSTEM_VERSION=unknown
        GAMESTATION_SYSTEM_GAMESTATION_CONF=unknown
        GAMESTATION_SYSTEM_SUBDIR=
endif

define GAMESTATION_SYSTEM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/gamestation/
	echo -n "$(GAMESTATION_SYSTEM_VERSION)" > $(TARGET_DIR)/gamestation/gamestation.arch
	mkdir -p $(TARGET_DIR)/gamestation/share_init/system
	cp package/gamestation/core/gamestation-system/$(GAMESTATION_SYSTEM_GAMESTATION_CONF)/gamestation.conf $(TARGET_DIR)/gamestation/share_init/system
	cp package/gamestation/core/gamestation-system/$(GAMESTATION_SYSTEM_GAMESTATION_CONF)/gamestation.conf $(TARGET_DIR)/gamestation/share_init/system/gamestation.conf.template
	# gamestation-boot.conf
        $(INSTALL) -D -m 0644 package/gamestation/core/gamestation-system/gamestation-boot.conf $(BINARIES_DIR)/$(GAMESTATION_SYSTEM_SUBDIR)/gamestation-boot.conf
endef

$(eval $(generic-package))
