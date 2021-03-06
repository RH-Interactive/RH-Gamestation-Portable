#!/usr/bin/env python
import sys
import os
import gamestationFiles
from Emulator import Emulator
from settings.unixSettings import UnixSettings

sys.path.append(
    os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

fbaSettings = UnixSettings(gamestationFiles.fbaCustom)

# return true if the option is considered defined
def defined(key, dict):
    return key in dict and isinstance(dict[key], str) and len(dict[key]) > 0

ratioIndexes = {'16/9': '0', '4/3': '1'}

def writeFBAConfig(system):
    writeFBAConfigToFile(createFBAConfig(system))


# take a system, and returns a dict of retroarch.cfg compatible parameters
def createFBAConfig(system):
    fbaConfig = dict()
    gamestationConfig = system.config
    if system.isOptSet('smooth') and system.getOptBoolean('smooth') == True:
        fbaConfig['DisplaySmoothStretch'] = '1'
    else:
        fbaConfig['DisplaySmoothStretch'] = '0'

    if defined('ratio', gamestationConfig) and gamestationConfig['ratio'] in ratioIndexes:
        fbaConfig['MaintainAspectRatio'] = ratioIndexes[gamestationConfig['ratio']]
    else:
        fbaConfig['MaintainAspectRatio'] = '1'

    if defined('shaders', gamestationConfig) and gamestationConfig['shaders'] == 'scanlines':
        fbaConfig['DisplayEffect'] = '1'
    else :
        fbaConfig['DisplayEffect'] = '0'

    return fbaConfig


def writeFBAConfigToFile(config):
    for setting in config:
        fbaSettings.save(setting, config[setting])
