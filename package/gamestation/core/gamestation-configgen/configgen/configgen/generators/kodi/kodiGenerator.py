#!/usr/bin/env python
import Command
import gamestationFiles
from generators.Generator import Generator
import kodiConfig

class KodiGenerator(Generator):
    
    # Main entry of the module
    # Configure kodi inputs and return the command to run
    def generate(self, system, rom, playersControllers, gameResolution):
        kodiConfig.writeKodiConfig(playersControllers)
        commandArray = [gamestationFiles.gamestationBins[system.config['emulator']]]
        return Command.Command(array=commandArray)
