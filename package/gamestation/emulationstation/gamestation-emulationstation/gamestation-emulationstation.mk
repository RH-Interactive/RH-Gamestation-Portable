################################################################################
#
# RHOS Emulation Station
#
################################################################################

ifeq ($(BR2_PACKAGE_KODI),y)
	GAMESTATION_EMULATIONSTATION_CONF_OPTS += -DDISABLE_KODI=0
else
	GAMESTATION_EMULATIONSTATION_CONF_OPTS += -DDISABLE_KODI=1
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
	GAMESTATION_EMULATIONSTATION_CONF_OPTS += -DENABLE_FILEMANAGER=1
else
	GAMESTATION_EMULATIONSTATION_CONF_OPTS += -DENABLE_FILEMANAGER=0
endif

GAMESTATION_EMULATIONSTATION_SITE = $(call github,RH-Interactive,rh-emulationstation,$(GAMESTATION_EMULATIONSTATION_VERSION))
GAMESTATION_EMULATIONSTATION_VERSION = master

GAMESTATION_EMULATIONSTATION_LICENSE = MIT
GAMESTATION_EMULATIONSTATION_DEPENDENCIES = sdl2 sdl2_mixer boost libfreeimage freetype eigen alsa-lib \
	libcurl openssl

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
GAMESTATION_EMULATIONSTATION_DEPENDENCIES += libgl
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
GAMESTATION_EMULATIONSTATION_DEPENDENCIES += libgles
endif


define GAMESTATION_EMULATIONSTATION_RPI_FIXUP
	$(SED) 's|/opt/vc/include|$(STAGING_DIR)/usr/include|g' $(@D)/CMakeLists.txt
	$(SED) 's|/opt/vc/lib|$(STAGING_DIR)/usr/lib|g' $(@D)/CMakeLists.txt
	$(SED) 's|/usr/lib|$(STAGING_DIR)/usr/lib|g' $(@D)/CMakeLists.txt
endef

GAMESTATION_EMULATIONSTATION_PRE_CONFIGURE_HOOKS += GAMESTATION_EMULATIONSTATION_RPI_FIXUP

$(eval $(cmake-package))
