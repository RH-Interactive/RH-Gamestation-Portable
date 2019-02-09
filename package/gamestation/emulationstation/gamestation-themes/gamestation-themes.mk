################################################################################
#
# RH Gamestation Themes - RH Interactive INC.
#
################################################################################

GAMESTATION_THEMES_VERSION = master
GAMESTATION_THEMES_SITE = $(call github,RH-Interactive,gamestation-themes,$(GAMESTATION_THEMES_VERSION))

define GAMESTATION_THEMES_INSTALL_TARGET_CMDS
        mkdir -p $(TARGET_DIR)/gamestation/share_init/system/.emulationstation/themes/
	cp -r $(@D)/themes/Default \
		$(TARGET_DIR)/gamestation/share_init/system/.emulationstation/themes/
endef

$(eval $(generic-package))
