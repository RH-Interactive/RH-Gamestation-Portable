#!/usr/bin/env python
import Command
import fba2xControllers
import gamestationFiles
import fba2xConfig
import shutil
from generators.Generator import Generator
import os.path


class Fba2xGenerator(Generator):
    
    # Main entry of the module
    # Configure fba and return a command
    def generate(self, system, rom, playersControllers, gameResolution):
        # Settings gamestation default config file if no user defined one
        if not 'configfile' in system.config:
            # Using gamestation config file
            system.config['configfile'] = gamestationFiles.fbaCustom
            # Copy original fba2x.cfg
            shutil.copyfile(gamestationFiles.fbaCustomOrigin, gamestationFiles.fbaCustom)
            #  Write controllers configuration files
            fba2xControllers.writeControllersConfig(system, rom, playersControllers)
            # Write configuration to retroarchcustom.cfg
            fba2xConfig.writeFBAConfig(system)

        commandArray = [gamestationFiles.gamestationBins[system.config['emulator']], "--configfile", system.config['configfile'], '--logfile', gamestationFiles.logdir+"/fba2x.log"]
        commandArray.append(rom)
        return Command.Command(array=commandArray)
