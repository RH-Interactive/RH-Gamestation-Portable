################################################################################
#
# gamestation configgen
#
################################################################################

GAMESTATION_CONFIGGEN_VERSION = 1.0
GAMESTATION_CONFIGGEN_LICENSE = GPL
GAMESTATION_CONFIGGEN_SOURCE=
GAMESTATION_CONFIGGEN_DEPENDENCIES = python python-pyyaml

define GAMESTATION_CONFIGGEN_EXTRACT_CMDS
	cp -R package/gamestation/core/gamestation-configgen/configgen/* $(@D)
endef

ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_RPI1),y)
	GAMESTATION_CONFIGGEN_SYSTEM=rpi1
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_RPI2),y)
	GAMESTATION_CONFIGGEN_SYSTEM=rpi2
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_RPI3),y)
	GAMESTATION_CONFIGGEN_SYSTEM=rpi3
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_XU4)$(BR2_PACKAGE_GAMESTATION_TARGET_LEGACYXU4),y)
	GAMESTATION_CONFIGGEN_SYSTEM=xu4
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_C2),y)
	GAMESTATION_CONFIGGEN_SYSTEM=c2
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_S905),y)
	GAMESTATION_CONFIGGEN_SYSTEM=s905
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_S912),y)
	GAMESTATION_CONFIGGEN_SYSTEM=s912
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_X86)$(BR2_PACKAGE_GAMESTATION_TARGET_X86_64),y)
	GAMESTATION_CONFIGGEN_SYSTEM=x86
else ifeq ($(BR2_PACKAGE_GAMESTATION_TARGET_ROCKPRO64),y)
	GAMESTATION_CONFIGGEN_SYSTEM=rockpro64
endif

define GAMESTATION_CONFIGGEN_CONFIGS
	mkdir -p $(TARGET_DIR)/gamestation/system/configgen
	cp package/gamestation/core/gamestation-configgen/configs/configgen-defaults.yml $(TARGET_DIR)/gamestation/system/configgen/configgen-defaults.yml
	cp package/gamestation/core/gamestation-configgen/configs/configgen-defaults-$(GAMESTATION_CONFIGGEN_SYSTEM).yml $(TARGET_DIR)/gamestation/system/configgen/configgen-defaults-arch.yml
endef
GAMESTATION_CONFIGGEN_POST_INSTALL_TARGET_HOOKS = GAMESTATION_CONFIGGEN_CONFIGS

GAMESTATION_CONFIGGEN_SETUP_TYPE = distutils

$(eval $(python-package))
