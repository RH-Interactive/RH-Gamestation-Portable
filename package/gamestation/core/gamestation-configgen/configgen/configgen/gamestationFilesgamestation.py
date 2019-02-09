#!/usr/bin/env python

esInputs = '/gamestation/share/system/.emulationstation/es_input.cfg'
esSettings = '/gamestation/share/system/.emulationstation/es_settings.cfg'
gamestationConf = '/gamestation/share/system/gamestation.conf'

retroarchRoot = '/gamestation/share/system/configs/retroarch'
retroarchRootInit = '/gamestation/share_init/system/configs/retroarch'
retroarchCustom = retroarchRoot + '/retroarchcustom.cfg'
retroarchCustomOrigin = retroarchRootInit + "/retroarchcustom.cfg"
retroarchCoreCustom = retroarchRoot + "/cores/retroarch-core-options.cfg"

retroarchBin = "retroarch"
retroarchCores = "/usr/lib/libretro/"
shadersRoot = "/gamestation/share_init/shaders/presets/"
shadersExt = '.gplsp'
libretroExt = '_libretro.so'

fbaRoot = '/gamestation/share/system/configs/fba/'
fbaCustom = fbaRoot + 'fba2x.cfg'
fbaCustomOrigin = fbaRoot + 'fba2x.cfg.origin'
fba2xBin = '/usr/bin/fba2x'

mupenCustom = "/gamestation/share/system/configs/mupen64/mupen64plus.cfg"

shaderPresetRoot = "/gamestation/share/system/configs/shadersets/"

kodiJoystick = '/gamestation/share/system/.kodi/userdata/keymaps/gamestation.xml'
kodiMapping  = '/gamestation/share/system/configs/kodi/input.xml'

kodiBin  = '/gamestation/scripts/kodilauncher.sh'

logdir = '/gamestation/share/system/logs/'
