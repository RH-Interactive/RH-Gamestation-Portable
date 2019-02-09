################################################################################
#
# RetroGame Gamestation
#
################################################################################
GAMESTATION_RETROGAME_VERSION = 1.0
GAMESTATION_RETROGAME_SOURCE=  

define GAMESTATION_RETROGAME_EXTRACT_CMDS
	cp package/gamestation/core/gamestation-retrogame/RetroGame/* $(@D)
endef

define GAMESTATION_RETROGAME_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) retrogame
endef

define GAMESTATION_RETROGAME_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/retrogame \
		$(TARGET_DIR)/usr/bin/gamestation-retrogame
endef

$(eval $(generic-package))
