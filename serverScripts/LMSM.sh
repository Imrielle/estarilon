#!/bin/bash
#Script used to start and create backups of a single minecraft server.
#created by Jared_Brian_. Heavily modified by Imri.
#v1.1

### Include Variables ###
source "${BASH_SOURCE%/*}/LMSM.cfg"

dbmode=$debugMode >&2
GUI=$useGUI >&2

if $dbmode ; then
    echo -e "The minecraft version is v${mcVersion}"
    echo -e "The Server Directory is located at ${serverDir}"
    echo -e "The max allocated memory is $maxRAM"

    if $GUI ;then
        echo -e "Starting with the GUI.."
    else
        echo -e "Starting without the GUI..."
    fi
fi

version=$mcVersion >&2
serverDir=${serverDir} >&2
mcWorld=${mcWorld} >&2
mcDifficulty=${mcDifficulty} >&2
backDir=${backupDir} >&2
minRAM=$minRAM >&2
maxRAM=$maxRAM >&2
maxBack=$maxBackup >&2
eBack=$enableBackup >&2
aBack=$autoBackup >&2
aClose=$autoClose >&2

if ${useForge} ;then
	serverFile="${version}-${forgeVersion}" >&2
else
	serverFile="minecraft_server.${version}" >&2
fi

### Functions ###
#Creates a backup and saves it into the backups folder as ${worldName}+${version}+${date}
function CreateBackup {
    #deletes backup with same date, if there is one.
    if [ -e "${backDir}/${mcWorld} $(date +%m-%d-%Y-%H:%M)" ]; then
        echo -e "\nDeleting backup that was created earlier today..."
        rm -r -f "${backDir}/${mcWorld} $(date +%m-%d-%Y-%H:%M)"
    fi

    echo -e "\nCreating Backup..."

    mkdir -p "${backDir}"
	cd ${backDir};
	
    cp -r "${serverDir}/${mcWorld}" "${backDir}"
    mv -f "${backDir}/${mcWorld}" "${backDir}/${mcWorld} $(date +%m-%d-%Y-%H:%M)"
	
	zip -r "${mcWorld} $(date +%m-%d-%Y-%H:%M)".zip "${mcWorld} $(date +%m-%d-%Y-%H:%M)"
	
	rm -r -f "${mcWorld} $(date +%m-%d-%Y-%H:%M)"
	
    echo -e "Backup Complete"
}

#delete old backups if needed
function DeleteOldBackups {
    dirCount=$(find ${backDir}/* -maxdepth 0 -type d | wc -l)

    #check for files above max amount
    if [ "$dirCount" -gt "$maxBack" ]; then 
        #re runs deleting script just in case there are more than one backups past the max amount
        while [ "$dirCount" -gt "$maxBack" ]; do

            echo -e "\nThere are more than $maxBack backups"
            echo "Deleting oldest Backup..."

            #find oldest file and store it in $file
            [[ $(find "${backDir}" -maxdepth 1 -type f | wc -l) -ge $maxBack ]] &&
            IFS= read -r -d $'\0' line < <(find "${backDir}" -maxdepth 1 -printf '%T@ %p\0' 2>/dev/null | sort -z -n)
            file="${line#* }"
            ls -lLd "$file"

            #delete olds file
            echo -e "\nDeleting $file..."
            rm -rf "$file"

            dirCount=$(find ${backDir}/* -maxdepth 0 -type d | wc -l)

        done
    else
        #prompts user
        echo -e "\nno files to delete"
    fi
}

### Main ###

#prompts user
echo -e "\nThank you for using the LSMS v1.0"
echo -e "Starting ${mcWorld}!"

#path to server directory
cd "${serverDir}"
if ${useForge} ;then
	if [ ! -f forge-${serverFile}-universal.jar ]; then
		if [ ! -f ${serverDir}/forge-${serverFile}-installer.jar ]; then
			echo "Downloading forge-${serverFile}-installer.jar"
			wget "https://files.minecraftforge.net/maven/net/minecraftforge/forge/${serverFile}/forge-${serverFile}-installer.jar"

			java -jar forge-${serverFile}-installer.jar --installServer
		fi
	fi
else
	if [ ! -f "${serverFile}-${version}.jar" ]; then
		echo "Downloading ${serverFile}-${version}.jar"
		wget "https://s3.amazonaws.com/Minecraft.Download/versions/${version}/minecraft_server.${version}.jar"
	fi
fi

if [ ! -f "server.properties" ]; then
	cat > "server.properties" << EOF1
level-name=${mcWorld}
difficulty=${mcDifficulty}
EOF1
fi

if [ ! -f "eula.txt" ]; then
	cat > "eula.txt" << EOF1
eula=true
EOF1
fi

#starts server jar with or without the GUI
if $GUI ;then
    if ${useForge} ;then
        java -XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:ParallelGCThreads=3 -XX:+UseStringDeduplication -XX:+UseAES -XX:+UseAESIntrinsics -Xmx$maxRAM -Xms$minRAM -XX:UseSSE=3 -Dname=${mcWorld} -jar forge-${version}-${forgeVersion}-universal.jar
    else
        java -XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:ParallelGCThreads=3 -XX:+UseStringDeduplication -XX:+UseAES -XX:+UseAESIntrinsics -Xmx$maxRAM -Xms$minRAM -XX:UseSSE=3 -Dname=${mcWorld} -jar minecraft_server.${version}.jar
    fi
else
    if ${useForge} ;then
        java -server -Xmx$maxRAM -Xms$minRAM -jar forge-${version}-${forgeVersion}-universal.jar nogui
    else
        java -server -XX:+UseG1GC -XX:MaxGCPauseMillis=500 -XX:ParallelGCThreads=3 -XX:+UseStringDeduplication -XX:+UseAES -XX:+UseAESIntrinsics -Xmx$maxRAM -Xms$minRAM -XX:UseSSE=3 -Dname=${mcWorld} -jar minecraft_server.${version}.jar nogui
    fi
fi

#after the user has stoped the server with /stop the following will run
echo -e "\nShutdown complete."

#resets file location
cd

#checks to see if the user wants to make backups
if $eBack ; then
    #checks to see if the user has automatic backups created or not
    if $aBack ; then
        CreateBackup
    else
        #prompts user
        echo -n -e "\nCreate backup? (y/n)"

        #if the user pressed y create backup else end
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg

        if echo "$answer" | grep -iq "^y" ;then
            #if there is already a backup created today prompt user
            if [ -e "${backDir}/${mcWorld} $(date +%m-%d-%Y-%T)" ]; then
                echo -n -e "\nA backup has already been created. \nAre you sure you want to replace it? (y/n)"
                old_stty_cfg=$(stty -g)
                stty raw -echo
                answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
                stty $old_stty_cfg
                if echo "$answer" | grep -iq "^y" ;then
                    CreateBackup
                else
                    echo -e "\nBackup Canceled"   
                fi
            else
                CreateBackup
            fi
        else
            echo -e "\nBackup Canceled"
        fi
    fi

    #delete old backups if needed
    dirCount=$(find ${backDir}/* -maxdepth 0 -type d | wc -l)

    #check for files above max amount
    if [ "$dirCount" -gt "$maxBack" ]; then 
        DeleteOldBackups
    fi
fi
#keeps console open until indicated by the user
if ! $aClose ; then
    read -p "Press enter to exit"
fi
exit 0






