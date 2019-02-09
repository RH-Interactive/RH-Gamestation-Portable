#!/usr/bin/env python
import Command
import controllersConfig
import gamestationFiles
from generators.Generator import Generator
import shutil
import os.path


class MoonlightGenerator(Generator):

    def getResolutionMode(self, config):
        return 'default'
    
    # Main entry of the module
    # Configure fba and return a command
    def generate(self, system, rom, playersControllers, gameResolution):
        outputFile = gamestationFiles.moonlightCustom + '/gamecontrollerdb.txt'
        configFile = controllersConfig.generateSDLGameDBAllControllers(playersControllers, outputFile)
        gameName,confFile = self.getRealGameNameAndConfigFile(rom)
        commandArray = [gamestationFiles.gamestationBins[system.config['emulator']], 'stream','-config',  confFile]
        commandArray.append('-app')
        commandArray.append(gameName)
        return Command.Command(array=commandArray, env={"XDG_DATA_DIRS": gamestationFiles.CONF})

    def getRealGameNameAndConfigFile(self, rom):
        # Rom's basename without extension
        romName = os.path.splitext(os.path.basename(rom))[0]
        # find the real game name
        f = open(gamestationFiles.moonlightGamelist, 'r')
        for line in f:
            try:
                gfeRom, gfeGame, confFile = line.rstrip().split(';')
                #confFile = confFile.rstrip()
            except:
                gfeRom, gfeGame = line.split(';')
                confFile = gamestationFiles.moonlightConfig
            #If found
            if gfeRom == romName:
                # return it
                f.close()
                return [gfeGame, confFile]
        # If nothing is found (old gamelist file format ?)
        return [gfeGame, gamestationFiles.moonlightConfig]
