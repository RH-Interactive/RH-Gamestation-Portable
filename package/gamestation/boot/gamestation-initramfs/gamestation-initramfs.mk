################################################################################
#
# busybox_initramfs
#
################################################################################

GAMESTATION_INITRAMFS_VERSION = 1.24.2
GAMESTATION_INITRAMFS_SITE = http://www.busybox.net/downloads
GAMESTATION_INITRAMFS_SOURCE = busybox-$(GAMESTATION_INITRAMFS_VERSION).tar.bz2
GAMESTATION_INITRAMFS_LICENSE = GPLv2
GAMESTATION_INITRAMFS_LICENSE_FILES = LICENSE

GAMESTATION_INITRAMFS_CFLAGS = $(TARGET_CFLAGS)
GAMESTATION_INITRAMFS_LDFLAGS = $(TARGET_LDFLAGS)

GAMESTATION_INITRAMFS_KCONFIG_FILE = "package/gamestation/boot/gamestation-initramfs/busybox.config"

INITRAMFS_DIR=$(BINARIES_DIR)/initramfs

# Allows the build system to tweak CFLAGS
GAMESTATION_INITRAMFS_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	CFLAGS="$(GAMESTATION_INITRAMFS_CFLAGS)"
GAMESTATION_INITRAMFS_MAKE_OPTS = \
	CC="$(TARGET_CC)" \
	ARCH=$(KERNEL_ARCH) \
	PREFIX="$(INITRAMFS_DIR)" \
	EXTRA_LDFLAGS="$(GAMESTATION_INITRAMFS_LDFLAGS)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	CONFIG_PREFIX="$(INITRAMFS_DIR)" \
	SKIP_STRIP=y

GAMESTATION_INITRAMFS_KCONFIG_OPTS = $(GAMESTATION_INITRAMFS_MAKE_OPTS)

define GAMESTATION_INITRAMFS_BUILD_CMDS
	$(GAMESTATION_INITRAMFS_MAKE_ENV) $(MAKE) $(GAMESTATION_INITRAMFS_MAKE_OPTS) -C $(@D)
endef

ifeq ($(BR2_PACKAGE_UBOOT_ODROID_C2)$(BR2_PACKAGE_UBOOT_ODROID_XU4)$(BR2_PACKAGE_GAMESTATION_TARGET_S905)$(BR2_PACKAGE_GAMESTATION_TARGET_S912),y)

ifeq ($(BR2_aarch64),y)
GAMESTATION_INITRAMFS_INITRDA=arm64
else
GAMESTATION_INITRAMFS_INITRDA=arm
endif

define GAMESTATION_INITRAMFS_INSTALL_TARGET_CMDS
	mkdir -p $(INITRAMFS_DIR)
	cp package/gamestation/boot/gamestation-initramfs/init $(INITRAMFS_DIR)/init
	$(GAMESTATION_INITRAMFS_MAKE_ENV) $(MAKE) $(GAMESTATION_INITRAMFS_MAKE_OPTS) -C $(@D) install
	(cd $(INITRAMFS_DIR) && find . | cpio -H newc -o > $(BINARIES_DIR)/initrd)
	(cd $(BINARIES_DIR) && mkimage -A $(GAMESTATION_INITRAMFS_INITRDA) -O linux -T ramdisk -C none -a 0 -e 0 -n initrd -d ./initrd ./uInitrd)
endef
else
define GAMESTATION_INITRAMFS_INSTALL_TARGET_CMDS
	mkdir -p $(INITRAMFS_DIR)
	cp package/gamestation/boot/gamestation-initramfs/init $(INITRAMFS_DIR)/init
	$(GAMESTATION_INITRAMFS_MAKE_ENV) $(MAKE) $(GAMESTATION_INITRAMFS_MAKE_OPTS) -C $(@D) install
	(cd $(INITRAMFS_DIR) && find . | cpio -H newc -o | gzip -9 > $(BINARIES_DIR)/initrd.gz)
endef
endif


$(eval $(kconfig-package))