#!/usr/bin/env python
HOME_INIT = '/gamestation/share_init/system/'
HOME = '/gamestation/share/system'
CONF_INIT = HOME_INIT + '/configs'
CONF = HOME + '/configs'
SAVES = '/gamestation/share/saves'
SCREENSHOTS = '/gamestation/share/screenshots'
BIOS = '/gamestation/share/bios'
OVERLAYS = '/gamestation/share/overlays'

esInputs = HOME + '/.emulationstation/es_input.cfg'
esSettings = HOME + '/.emulationstation/es_settings.cfg'
gamestationConf = HOME + '/gamestation.conf'
logdir = HOME + '/logs/'

# This dict is indexed on the emulator name, not on the system
gamestationBins = {'dosbox'      : '/usr/bin/dosbox'
              , 'fba2x'       : '/usr/bin/fba2x'
              , 'kodi'        : '/gamestation/scripts/kodilauncher.sh'
              , 'libretro'    : '/usr/bin/retroarch'
              , 'linapple'    : '/usr/bin/linapple'
              , 'moonlight'   : '/usr/bin/moonlight'
              , 'mupen64plus' : '/usr/bin/mupen64plus'
              , 'ppsspp'      : '/usr/bin/PPSSPPSDL'
              , 'reicast'     : '/usr/bin/reicast.elf'
              , 'scummvm'     : '/usr/bin/scummvm'
              , 'vice'        : '/usr/bin/x64'
              , 'fsuae'       : '/usr/bin/fs-uae'
              , 'amiberry'    : '/usr/bin/amiberry'
              , 'dolphin'     : '/usr/bin/dolphin-emu-wx'
              , 'pcsx2'       : '/usr/PCSX/bin/PCSX2'
              , 'pcsx2_avx2'  : '/usr/PCSX_AVX2/bin/PCSX2'
              , 'advancemame' : '/usr/bin/advmame'
}


retroarchRoot = CONF + '/retroarch'
retroarchRootInit = CONF_INIT + '/retroarch'
retroarchCustom = retroarchRoot + '/retroarchcustom.cfg'
retroarchCustomOrigin = retroarchRootInit + "/retroarchcustom.cfg"
retroarchCoreCustom = retroarchRoot + "/cores/retroarch-core-options.cfg"

retroarchCores = "/usr/lib/libretro/"
shadersRoot = "/gamestation/share/shaders/presets/"
shadersExt = '.gplsp'
libretroExt = '_libretro.so'
screenshotsDir = "/gamestation/share/screenshots/"
savesDir = "/gamestation/share/saves/"

fbaRoot = CONF + '/fba/'
fbaCustom = fbaRoot + 'fba2x.cfg'
fbaCustomOrigin = fbaRoot + 'fba2x.cfg.origin'


mupenConf = CONF + '/mupen64/'
mupenCustom = mupenConf + "mupen64plus.cfg"
mupenInput = mupenConf + "InputAutoCfg.ini"
mupenSaves = SAVES + "/n64"
mupenMappingUser    = mupenConf + 'input.xml'
mupenMappingSystem  = '/gamestation/share_init/system/configs/mupen64/input.xml'

shaderPresetRoot = "/gamestation/share_init/system/configs/shadersets/"

kodiJoystick = HOME + '/.kodi/userdata/addon_data/peripheral.joystick/resources/buttonmaps/xml/linux/gamestation_{}.xml'

moonlightCustom = CONF+'/moonlight'
moonlightConfig = moonlightCustom + '/moonlight.conf'
moonlightGamelist = moonlightCustom + '/gamelist.txt'
moonlightMapping = dict()
moonlightMapping[1] = moonlightCustom + '/mappingP1.conf'
moonlightMapping[2] = moonlightCustom + '/mappingP2.conf'
moonlightMapping[3] = moonlightCustom + '/mappingP3.conf'
moonlightMapping[4] = moonlightCustom + '/mappingP4.conf'

reicastCustom = CONF + '/reicast'
reicastConfig = reicastCustom + '/emu.cfg'
reicastConfigInit = HOME_INIT + 'configs/reicast/emu.cfg'
reicastSaves = SAVES
reicastBios = BIOS
reicastVMUBlank = '/gamestation/share_init/saves/reicast/vmu_save_blank.bin'
reicastVMUA1 = reicastSaves + '/reicast/vmu_save_A1.bin'
reicastVMUA2 = reicastSaves + '/reicast/vmu_save_A2.bin'

dolphinConfig  = CONF + "/dolphin-emu"
dolphinData    = SAVES + "/dolphin-emu"
dolphinIni     = dolphinConfig + '/Dolphin.ini'
dolphinGfxIni  = dolphinConfig + '/GFX.ini'
dolphinSYSCONF = dolphinData + "/Wii/shared2/sys/SYSCONF"

pcsx2PluginsDir     = "/usr/PCSX/bin/plugins"
pcsx2Avx2PluginsDir = "/usr/PCSX_AVX2/bin/plugins"
pcsx2ConfigDir      = "/gamestation/share/system/configs/PCSX2"

ppssppConf = CONF + '/ppsspp/PSP/SYSTEM'
ppssppControlsIni = ppssppConf + '/controls.ini'
ppssppControls = CONF + '/ppsspp/gamecontrollerdb.txt'
ppssppControlsInit = HOME_INIT + 'configs/ppsspp/PSP/SYSTEM/controls.ini'
ppssppConfig = ppssppConf + '/ppsspp.ini'

dosboxCustom = CONF + '/dosbox'
dosboxConfig = dosboxCustom + '/dosbox.conf'

fsuaeBios = BIOS
fsuaeConfig = CONF + "/FS-UAE"
fsuaeSaves = SAVES + "/amiga"

scummvmSaves = SAVES + '/scummvm'

viceConfig = CONF + "/vice/vice.conf"

advancemameConfig = CONF + '/advancemame/advmame.rc'
advancemameConfigOrigin = CONF + '/advancemame/advmame.rc.origin'

overlaySystem = "/gamestation/share_init/decorations"
overlayUser = "/gamestation/share/decorations"
overlayConfigFile = "/gamestation/share/system/configs/retroarch/overlay.cfg"

amiberryRoot = CONF + '/amiberry'
amiberryRetroarchInputsDir = amiberryRoot + '/conf/retroarch/inputs'
amiberryRetroarchCustom = amiberryRoot + '/conf/retroarch/retroarchcustom.cfg'
