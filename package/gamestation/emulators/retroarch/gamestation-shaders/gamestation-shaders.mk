################################################################################
#
# gamestation shaders
#
################################################################################

GAMESTATION_SHADERS_VERSION = 1.0
GAMESTATION_SHADERS_SOURCE=

define GAMESTATION_SHADERS_INSTALL_TARGET_CMDS
        mkdir -p $(TARGET_DIR)/gamestation/share_init/shaders
	cp -r package/gamestation/emulators/retroarch/gamestation-shaders/shaders/* $(TARGET_DIR)/gamestation/share_init/shaders
endef

$(eval $(generic-package))
