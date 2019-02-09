################################################################################
#
# RH Gamestation IMAGEVIEWER - RH Interactive INC.
#
################################################################################
LIBRETRO_IMAGEVIEWER_VERSION = master
LIBRETRO_IMAGEVIEWER_SITE = $(call github,RH-Interactive,libretro-imageviewer-legacy,$(LIBRETRO_IMAGEVIEWER_VERSION))

define LIBRETRO_IMAGEVIEWER_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="$(LIBRETRO_PLATFORM)"
endef

define LIBRETRO_IMAGEVIEWER_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/imageviewer_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/imageviewer_libretro.so
endef

$(eval $(generic-package))
