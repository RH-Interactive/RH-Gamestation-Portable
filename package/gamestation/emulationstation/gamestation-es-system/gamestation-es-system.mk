################################################################################
#
# GAMESTATION-ES-SYSTEM
#
################################################################################

GAMESTATION_ES_SYSTEM_DEPENDENCIES = host-python host-python-pyyaml
GAMESTATION_ES_SYSTEM_SOURCE=
GAMESTATION_ES_SYSTEM_VERSION=1.0

define GAMESTATION_ES_SYSTEM_BUILD_CMDS
	$(HOST_DIR)/bin/python \
		package/gamestation/emulationstation/gamestation-es-system/gamestation-es-system.py \
		package/gamestation/emulationstation/gamestation-es-system/es_systems.yml        \
		$(CONFIG_DIR)/.config \
		$(@D)/es_systems.cfg \
		package/gamestation/emulationstation/gamestation-es-system/roms \
		$(@D)/roms
endef

define GAMESTATION_ES_SYSTEM_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(@D)/es_systems.cfg $(TARGET_DIR)/gamestation/share_init/system/.emulationstation/es_systems.cfg
        mkdir -p $(@D)/roms # in case there is no rom
	cp -pr $(@D)/roms $(TARGET_DIR)/gamestation/share_init/
endef

$(eval $(generic-package))
