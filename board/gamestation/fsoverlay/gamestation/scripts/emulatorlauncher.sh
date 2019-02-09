#!/bin/bash
declare -A ratiomap
ratiomap[arkanoid.zip]="8:7"
ratiomap[centiped.zip]="8:7"
ratiomap[dkongjr.zip]="8:7"
ratiomap[dkong.zip]="8:7"
ratiomap[frogger.zip]="8:7"
ratiomap[invaders.zip]="7:9"
ratiomap[mario.zip]="8:7"
ratiomap[missile.zip]="8:7"
ratiomap[mspacman.zip]="7:9"
ratiomap[pacmanm.zip]="7:9"
ratiomap[pacman.zip]="7:9"
ratiomap[starw.zip]="7:9"
ratiomap[zaxxon.zip]="8:7"

sixBTNgames=(sfa sfz sf2 dstlk hsf2 msh mshvsf mvsc nwarr ssf2 vsav vhunt xmvsf xmcota)

emulator="$2"

fullfilename=$(basename "$1")

dirName=$(dirname "$1")

filename=$(printf '%q' "$fullfilename")

filenameNoExt="${filename%.*}"

extension="${filename##*.}"

systemsetting=/gamestation/scripts/systemsetting.sh


echo $fullfilename
echo $filename
echo $dirName
echo $1

if [[ ! "$emulator" ]]; then
	#seeking emulator from extension (needed for news)
	if [[ "$extension" == "smc" || "$extension" == "sfc" ]]; then
        	emulator="snes"
	fi
	if [[ "$extension" == "nes" || "$extension" == "NES" ]]; then
        	emulator="nes"
	fi
	if [[ "$extension" == "SMS" || "$extension" == "sms" ]]; then
		emulator="mastersystem"
	fi
	if [[ "$extension" == "gba" ]]; then
		emulator="gba"
	fi
	if [[ "$extension" == "MD" || "$extension" == "md" ]]; then
		emulator="megadrive"
	fi
fi

retroarchbin="/usr/bin/retroarch"
gpspbin="/usr/emulators/gpsp/gpsp"
mupen64bin="/usr/bin/mupen64plus"
retroarchcores="/usr/lib/libretro"

if [[ "$emulator" == "psx" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/pcsx_rearmed_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "snes" ]]; then
        settings_snes="`$systemsetting get snes_emulator`"
        if [[ "$settings_snes" == "catsfc" ]];then
                /gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/catsfc_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
        elif [[ "$settings_snes" == "snes9x_next" ]];then
                /gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/snes9x_next_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
        elif [[ "$settings_snes" == "snes9x" ]];then
                /gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/snes9x_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
        else
                /gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/pocketsnes_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
        fi
fi

if [[ "$emulator" == "nes" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/fceunext_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi
if [[ "$emulator" == "virtualboy" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/vb_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "n64" ]]; then
        settings_n64="`$systemsetting get n64.pluginvideo`"
        if [[ "$settings_n64" == "n64" ]];then
                /gamestation/scripts/runcommand.sh 4 "SDL_VIDEO_GL_DRIVER=/usr/lib/libGLESv2.so  mupen64plus --corelib /usr/lib/libmupen64plus.so.2.0.0 --gfx /usr/lib/mupen64plus/mupen64plus-video-n64.so --configdir /gamestation/configs/mupen64/ --datadir /gamestation/configs/mupen64/ \"$1\""
        elif [[ "$settings_n64" == "rice" ]];then
                /gamestation/scripts/runcommand.sh 3 "SDL_VIDEO_GL_DRIVER=/usr/lib/libGLESv2.so  mupen64plus --corelib /usr/lib/libmupen64plus.so.2.0.0 --gfx /usr/lib/mupen64plus/mupen64plus-video-rice.so --configdir /gamestation/configs/mupen64/ --datadir /gamestation/configs/mupen64/ \"$1\""
        else
  		/gamestation/scripts/runcommand.sh 4 "SDL_VIDEO_GL_DRIVER=/usr/lib/libGLESv2.so  mupen64plus --corelib /usr/lib/libmupen64plus.so.2.0.0 --gfx /usr/lib/mupen64plus/mupen64plus-video-n64.so --configdir /gamestation/configs/mupen64/ --datadir /gamestation/configs/mupen64/ \"$1\""
        fi
fi

if [[ "$emulator" == "mastersystem" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/picodrive_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "sg1000" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/genesisplusgx_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "gba" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/gpsp_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
#	/gamestation/scripts/runcommand.sh 4 "$gpspbin \"/gamestation/share/roms/gba/${fullfilename}\""
fi

if [[ "$emulator" == "gbc" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/gambatte_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "fds" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/nestopia_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "megadrive" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/picodrive_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "gamegear" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/genesisplusgx_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "segacd" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/picodrive_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "sega32x" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/picodrive_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "gw" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/gw_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "prboom" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/prboom_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "ngp" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/mednafen_ngp_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "vectrex" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/vecx_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "lynx" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/mednafen_lynx_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "lutro" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/lutro_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "wswan" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/mednafen_wswan_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "atari2600" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/stella_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "atari5200" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/atari800_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "pcengine" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/mednafen_supergrafx_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "atari7800" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/prosystem_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi


if [[ "$emulator" == "msx" ]]; then
        if [[ "$extension" == "mx1" ]] ||  [[ "$extension" == "MX1" ]] ; then
                sed -i "s/^fmsx_mode = .*$/fmsx_mode = MSX1/g" /gamestation/configs/retroarch/cores/retroarch-core-options.cfg
        else
                sed -i "s/^fmsx_mode = .*$/fmsx_mode = MSX2/g" /gamestation/configs/retroarch/cores/retroarch-core-options.cfg
        fi
        /gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/fmsx_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "neogeo" ]]; then
        settings_neogeo="`$systemsetting get neogeo_emulator`"
        if [[ "$settings_neogeo" == "fbalibretro" ]];then
                /gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/fba_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
        elif [[ "$settings_neogeo" == "imame" ]];then
                /gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/imame4all_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
        else
                runsix=0
                for game in ${sixBTNgames[*]}; do
                        echo "checking if $filename is like $game "
                        if [[ "$filename" =~ ^$game.* ]]; then
                                runsix=1
                                break
                        fi
                done
                if [[ "$runsix" == "1" ]]; then
                        /gamestation/scripts/runcommand.sh 4 "fba2x --configfile /gamestation/configs/fba/fba2x6btn.cfg \"$1\""
                else
                        /gamestation/scripts/runcommand.sh 4 "fba2x --configfile /gamestation/configs/fba/fba2x.cfg \"$1\""
                fi
        fi
fi

if [[ "$emulator" == "imame" ]]; then
	if [[ -n ${ratiomap[$filename]} ]]; then
        	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/imame4all_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg --appendconfig /gamestation/configs/retroarch/${ratiomap[$filename]}.cfg \"$1\""
	else
        	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/imame4all_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg --appendconfig /gamestation/configs/retroarch/4:3.cfg \"$1\""
	fi
fi

if [[ "$emulator" == "fba" ]]; then
                runsix=0
                for game in ${sixBTNgames[*]}; do
                        echo "checking if $filename is like $game "
                        if [[ "$filename" =~ ^$game.* ]]; then
                                runsix=1
                                break
                        fi
                done
                if [[ "$runsix" == "1" ]]; then
                        /gamestation/scripts/runcommand.sh 4 "fba2x --configfile /gamestation/configs/fba/fba2x6btn.cfg \"$1\""
                else
                        /gamestation/scripts/runcommand.sh 4 "fba2x --configfile /gamestation/configs/fba/fba2x.cfg \"$1\""
                fi
fi
if [[ "$emulator" == "fbalibretro" ]]; then
	/gamestation/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/fba_libretro.so --config /gamestation/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "scummvm" ]]; then
         /gamestation/scripts/runcommand.sh 2 "scummvm --joystick=0 --screenshotspath=/gamestation/share/screenshots --extrapath=/usr/share/scummvm --path=\"$dirName\" \"$filenameNoExt\""
fi
