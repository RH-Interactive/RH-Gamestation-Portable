################################################################################
#
# RH Gamestation EFI - RH Interactive INC.
#
################################################################################

GAMESTATION_X86_64_EFI_VERSION = 1.0
GAMESTATION_X86_64_EFI_SOURCE = bootx64.efi.gz
GAMESTATION_X86_64_EFI_SITE = https://github.com/RH-Interactive/rhgamestation-x86_64_efi/releases/download/$(GAMESTATION_X86_64_EFI_VERSION)

define GAMESTATION_X86_64_EFI_EXTRACT_CMDS
	cp $(DL_DIR)/$(GAMESTATION_X86_64_EFI_DL_SUBDIR)/$(GAMESTATION_X86_64_EFI_SOURCE) $(@D)
	gunzip $(@D)/$(GAMESTATION_X86_64_EFI_SOURCE)
endef

define GAMESTATION_X86_64_EFI_INSTALL_TARGET_CMDS
	cp $(@D)/bootx64.efi $(BINARIES_DIR)
endef

$(eval $(generic-package))
