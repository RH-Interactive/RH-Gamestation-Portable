################################################################################
#
# Gamestation desktop applications
#
################################################################################
GAMESTATION_DESKTOPAPPS_VERSION = 1.0
GAMESTATION_DESKTOPAPPS_SOURCE=  

GAMESTATION_DESKTOPAPPS_SCRIPTS = filemanagerlauncher.sh
GAMESTATION_DESKTOPAPPS_APPS = 

# pcsx2
ifneq ($(BR2_PACKAGE_PCSX2_X86)$(BR2_PACKAGE_PCSX2)$(BR2_PACKAGE_PCSX2_AVX2),)
  GAMESTATION_DESKTOPAPPS_SCRIPTS += gamestation-config-pcsx2.sh
  GAMESTATION_DESKTOPAPPS_APPS    += pcsx2-config.desktop
endif

# dolphin
ifeq ($(BR2_PACKAGE_DOLPHIN_EMU),y)
  GAMESTATION_DESKTOPAPPS_SCRIPTS += gamestation-config-dolphin.sh
  GAMESTATION_DESKTOPAPPS_APPS    += dolphin-config.desktop
endif

# retroarch
ifeq ($(BR2_PACKAGE_RETROARCH),y)
  GAMESTATION_DESKTOPAPPS_SCRIPTS += gamestation-config-retroarch.sh
  GAMESTATION_DESKTOPAPPS_APPS    += retroarch-config.desktop
endif

define GAMESTATION_DESKTOPAPPS_INSTALL_TARGET_CMDS
	# scripts
	mkdir -p $(TARGET_DIR)/gamestation/scripts
	$(foreach f,$(GAMESTATION_DESKTOPAPPS_SCRIPTS), cp package/gamestation/core/gamestation-desktopapps/scripts/$(f) $(TARGET_DIR)/gamestation/scripts/$(f)$(sep))

	# apps
	mkdir -p $(TARGET_DIR)/usr/share/applications
	$(foreach f,$(GAMESTATION_DESKTOPAPPS_APPS), cp package/gamestation/core/gamestation-desktopapps/apps/$(f) $(TARGET_DIR)/usr/share/applications/$(f)$(sep))

	# menu
	mkdir -p $(TARGET_DIR)/etc/xdg/menus
	cp package/gamestation/core/gamestation-desktopapps/menu/gamestation-applications.menu $(TARGET_DIR)/etc/xdg/menus/gamestation-applications.menu
endef

$(eval $(generic-package))
