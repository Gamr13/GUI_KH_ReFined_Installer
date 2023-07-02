#!/bin/bash

#==============================
#=== KH Re:Fined Installer ===
#============================
# Automatic installer for KH Re:Fined
# Credits: Kurumi78

Menu=1

#Game installation detector
(
    echo "25"
    echo "# Creating temporary folders..." ; sleep 2
    mkdir $HOME/RefinedSetup/RefinedSetup
    cd $HOME/RefinedSetup/RefinedSetup

    echo "50"
    echo "# Downloading KH Re:Fined 3.00"
    curl -LJO https://github.com/TopazTK/KH-ReFined/releases/download/v3.00/ReFined_v3.00.zip
    
    echo "75"
    echo "# Extracting KH Re:Fined 3.00"
    unzip ReFined_v3.00.zip

	echo "85"
	echo "# Downloading offline patch..."
	curl -LJO https://cloud.audreyvps.net/s/Offlinepatch/download/OfflinePatch.zip
	unzip OfflinePatch.zip

    echo "100"
    echo "# Detecting game folder..."
) |

zenity --progress \
    --title="Detecting..." \
    --text="Finding your game installation folder!" \
    --percentage=0 \
    --auto-close \
    
khInstall=$(find / -type d -name "KH_1.5_2.5" -print -quit 2>/dev/null)

if zenity --question \
    --title="Folder detection..." \
    --text="Is your game directory: ${khInstall}?" --no-wrap
then
    mkdir "${khInstall}/backup"
fi

while [[ $Menu -eq 1 ]]; do
	ans=$(zenity --list --radiolist --text "Please make a selection: (DA = Dual Audio)" \
        --hide-header --column "KH" \
        --column "Games" FALSE \
        "KH1" FALSE \
        "KH2" FALSE \
        "KH2 DA" FALSE \
        "KH BBS" FALSE \
        "KH BBS DA" FALSE \
        "All" FALSE \
        "All DA" FALSE \
		"Offline Patch" FALSE \
		"Create WINE Prefix" FALSE \
        Quit
    )    

    rc=$?
  	echo "${rc}-${ans}"
  	echo $ans

  	if [[ $ans = "KH1" ]]
  	then
		if zenity --info --title="Kingdom Hearts 1" --text="Installing KH Re:Fined for Kingdom Hearts 1..." --no-wrap 
    		then
    			mv "${khInstall}/KINGDOM HEARTS FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS FINAL MIX.exe"
                mv "$HOME/RefinedSetup/Kingdom Hearts I/Kingdom Hearts I.exe" "${khInstall}/KINGDOM HEARTS FINAL MIX.exe"
        		zenity --info --title="Success!" --text="Kingdom Hearts 1 Re:Fined successfully installed!" --no-wrap
			Menu=1
				
    		else
    			zenity --info --title="Cancelled." --text="Kingdom Hearts 1 Re:Fined was *NOT* installed." --no-wrap
			Menu=1
		fi
		else
        	Menu=$rc
	fi
	

  	if [[ $ans = "KH2" ]]
  	then
		if zenity --info --title="Kingdom Hearts 2" --text="Installing KH Re:Fined for Kingdom Hearts 2..." --no-wrap 
    		then
    			mv "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS II FINAL MIX.exe"
                mv "$HOME/RefinedSetup/Kingdom Hearts II/Kingdom Hearts II.exe" "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe" 
        		zenity --info --title="Success!" --text="Kingdom Hearts 2 Re:Fined successfully installed!" --no-wrap
			Menu=1
				
    		else
    			zenity --info --title="Cancelled." --text="Kingdom Hearts 2 Re:Fined was *NOT* installed." --no-wrap
			Menu=1
		fi
		else
        	Menu=$rc
	fi

  	if [[ $ans = "KH2 DA" ]]
  	then
		if zenity --info --title="Kingdom Hearts 2 Dual Audio" --text="Installing KH Re:Fined for Kingdom Hearts 2..." --no-wrap 
    		then
    			mv "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS II FINAL MIX.exe"
                mv "$HOME/RefinedSetup/Kingdom Hearts II/Kingdom Hearts II - Dual Audio.exe" "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe"
        		zenity --info --title="Success!" --text="Kingdom Hearts 2 Re:Fined Dual Audio successfully installed!" --no-wrap
			Menu=1
				
    		else
    			zenity --info --title="Cancelled." --text="Kingdom Hearts 2 Re:Fined Dual Audio was *NOT* installed." --no-wrap
			Menu=1
		fi
		else
        	Menu=$rc
	fi

  	if [[ $ans = "KH BBS" ]]
  	then
		if zenity --info --title="Kingdom Hearts BBS" --text="Installing KH Re:Fined for Kingdom Hearts BBS..." --no-wrap 
    		then
    			mv "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
                mv "$HOME/RefinedSetup/Birth by Sleep/Birth by Sleep.exe" "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
        		zenity --info --title="Success!" --text="Kingdom Hearts BBS Re:Fined successfully installed!" --no-wrap
			Menu=1
				
    		else
    			zenity --info --title="Cancelled." --text="Kingdom Hearts BBS Re:Fined was *NOT* installed." --no-wrap
			Menu=1
		fi
		else
        	Menu=$rc
	fi

  	if [[ $ans = "KH BBS DA" ]]
  	then
		if zenity --info --title="Kingdom Hearts BBS" --text="Installing KH Re:Fined for Kingdom Hearts BBS..." --no-wrap 
    		then
    			mv "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
                mv "$HOME/RefinedSetup/Birth by Sleep/Birth by Sleep - Dual Audio.exe" "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
        		zenity --info --title="Success!" --text="Kingdom Hearts BBS Re:Fined successfully installed!" --no-wrap
			Menu=1
				
    		else
    			zenity --info --title="Cancelled." --text="Kingdom Hearts BBS Re:Fined was *NOT* installed." --no-wrap
			Menu=1
		fi
		else
        	Menu=$rc
	fi

  	if [[ $ans = "All" ]]
  	then
		if zenity --info --title="Kingdom Hearts Re:Fined" --text="Installing KH Re:Fined..." --no-wrap 
    		then
    			mv "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
                mv "$HOME/RefinedSetup/Birth by Sleep/Birth by Sleep.exe" "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
                mv "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS II FINAL MIX.exe"
                mv "$HOME/RefinedSetup/Kingdom Hearts II/Kingdom Hearts II.exe" "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe" 
                mv "${khInstall}/KINGDOM HEARTS FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS FINAL MIX.exe"
                mv "$HOME/RefinedSetup/Kingdom Hearts I/Kingdom Hearts I.exe" "${khInstall}/KINGDOM HEARTS FINAL MIX.exe"
        		zenity --info --title="Success!" --text="Kingdom Hearts Re:Fined successfully installed!" --no-wrap
			Menu=1
				
    		else
    			zenity --info --title="Cancelled." --text="Kingdom Hearts Re:Fined was *NOT* installed." --no-wrap
			Menu=1
		fi
		else
        	Menu=$rc
	fi

  	if [[ $ans = "All DA" ]]
  	then
		if zenity --info --title="Kingdom Hearts Re:Fined" --text="Installing KH Re:Fined..." --no-wrap 
    		then
    			mv "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
                mv "$HOME/RefinedSetup/Birth by Sleep/Birth by Sleep - Dual Audio.exe" "${khInstall}/KINGDOM HEARTS Birth by Sleep FINAL MIX.exe"
                mv "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS II FINAL MIX.exe"
                mv "$HOME/RefinedSetup/Kingdom Hearts II/Kingdom Hearts II - Dual Audio.exe" "${khInstall}/KINGDOM HEARTS II FINAL MIX.exe"
                mv "${khInstall}/KINGDOM HEARTS FINAL MIX.exe" "${khInstall}/backup/KINGDOM HEARTS FINAL MIX.exe"
                mv "$HOME/RefinedSetup/Kingdom Hearts I/Kingdom Hearts I.exe" "${khInstall}/KINGDOM HEARTS FINAL MIX.exe"
        		zenity --info --title="Success!" --text="Kingdom Hearts Re:Fined Dual Audio successfully installed!" --no-wrap
			Menu=1
				
    		else
    			zenity --info --title="Cancelled." --text="Kingdom Hearts Re:Fined Dual Audio was *NOT* installed." --no-wrap
			Menu=1
		fi
		else
        	Menu=$rc
	fi

	if [[ $ans = "Offline Patch" ]]
  	then
		(
			echo "25"
   			echo "# Backing up original files..." ; sleep 2
			mv "${khInstall}/KINGDOM HEARTS HD 1.5+2.5 ReMIX.exe" "${khInstall}/backup/KINGDOM HEARTS HD 1.5+2.5 ReMIX.exe"
			mv "${khInstall}/KINGDOM HEARTS HD 1.5+2.5 Launcher.exe" "${khInstall}/backup/KINGDOM HEARTS HD 1.5+2.5 Launcher.exe"
			mv "${khInstall}/WaitTitleProject.exe" "${khInstall}/backup/WaitTitleProject.exe"
			mv "${khInstall}/EOSSDK-Win64-Shipping.dll" "${khInstall}/backup/EOSSDK-Win64-Shipping.dll"

			echo "85"
			echo "# Installing offline patch"
			mv "$HOME/RefinedSetup/OfflinePatch/CODEX64.dll" "${khInstall}"
			mv "$HOME/RefinedSetup/OfflinePatch/EOSSDK-Win64-Shipping.dll" "${khInstall}"
			mv "$HOME/RefinedSetup/OfflinePatch/epic_emu.ini" "${khInstall}"

			echo "100"
			echo "# Installed!"
		) |
			
		zenity --progress \
   			--title="Installing..." \
   			--text="Installing" \
   			--percentage=0 
			Menu=1
	fi

	if [[ $ans = "Create WINE Prefix" ]]
  	then
		zenity --info --title "Select an option" --text "Will you be using Proton/Proton-GE or WINE/WINE-GE?" --no-wrap \
		--extra-button "Proton/GE" \
		--extra-button "WINE/GE" 
		
		if [[ $ans = "Proton/GE" ]]
			then
				WINEPREFIX=$HOME/RefinedSetup/pfx winetricks -q -f dotnet48 vcrun2022 win10
			Menu=1
		fi

		if [[ $ans = "WINE/GE" ]]
			then
				WINEPREFIX=$HOME/RefinedSetup winetricks -q -f dotnet48 vcrun2022 win10
			Menu=1
		fi
	fi

    if [[ $ans = "Quit" ]]
  	then
		if zenity --info --title="Kingdom Hearts Re:Fined installer" --text="Thanks for using KH Re:Fined!" --no-wrap 
    		then
				rm -rf $HOME/RefinedSetup
				mv "${khInstall}/EPIC" "${khInstall}/EPIC.bak"
			Menu=0
		fi
	fi

#################################################################################
done