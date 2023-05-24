#!/bin/bash

# config

updateServer="https://github.com/filip2cz/mccivilization-adminui-ssh.git"
updateServerVer="https://raw.githubusercontent.com/filip2cz/mccivilization-adminui-ssh/main/version"
localServerVer="./mccivilization-adminui-ssh/version"

# code
clear

# autoupdate

echo "Checking for new updates"
REMOTE_CONTENT=$(timeout 10 curl -s "$updateServerVer")
RC=$?

if [[ $RC -eq 0 ]]; then
    LOCAL_CONTENT=$(cat "$localServerVer")

    if (($(echo "$REMOTE_CONTENT") > $(echo "$LOCAL_CONTENT"))); then
        echo "Update available"
        echo "Updating"
        sudo rm -r mccivilization-adminui-ssh && echo "deleted old ver" && git clone https://github.com/filip2cz/mccivilization-adminui-ssh.git && sudo chmod 771 ./mccivilization-adminui-ssh/* && exec ./mccivilization-adminui-ssh/start.sh
    else
        clear
    fi
else
    echo "Error: Timeout occurred while fetching remote content."
    echo
fi

# main while
while :; do
    echo -n "Vítej uživateli: "
    whoami
    echo -n "Právě je: "
    date
    echo "---------------------------------------"
    echo [1] Starting server
    echo [2] Stop server
    echo [3] Restart server
    echo [4] Server status
    echo [5] Server console
    echo [6] Edit server and plugins config
    echo [7] Show installed plugins
    echo [8] Change password
    echo [0] Exit
    read -p 'number: ' command
    case $command in
    "exit" | "quit" | "0")
        exit
        ;;
    "ver" | "version")
        echo
        echo -n "Version: "
        cat $localServerVer
        echo
        echo
        ;;
    "start" | "1")
        sudo systemctl start mccivilization && echo "Server started" && read -p 'Press ENTER to close this message' $null
        clear
        ;;
    "passwd" | "8")
        passwd && read -p 'Press ENTER to close this message' $null
        clear
        ;;
    "stop" | "2")
        sudo systemctl stop mccivilization && echo "Server stopped" && read -p 'Press ENTER to close this message' $null
        clear
        ;;
    "status" | "4")
        clear
        sudo systemctl status mccivilization
        read -p 'Press ENTER to close this message' $null
        clear
        ;;
    "restart" | "3")
        echo "Restarting server..." && sudo systemctl stop mccivilization && sleep 30 && sudo systemctl start mccivilization && echo "Server restarted"
        read -p 'Press ENTER to close this message' $null
        clear
        ;;
    "update")
        sudo rm -r mccivilization-adminui-ssh && echo "deleted old ver" && git clone https://github.com/filip2cz/mccivilization-adminui-ssh.git && sudo chmod 771 ./mccivilization-adminui-ssh/* && exec ./mccivilization-adminui-ssh/start.sh
        ;;
    "pwd")
        clear
        pwd
        read -p 'Press ENTER to close this message' $null
        ;;
    "uname")
        clear
        uname -a
        read -p 'Press ENTER to close this message' $null
        ;;
    "top")
        top
        ;;
    "console" | "5")
        /usr/local/bin/mcrcon -H 127.0.0.1 -P 20656 -p filipjebuh
        clear
        ;;
    "config" | "6")
        clear
        echo "Plugins:"
        echo [1] EssentialsX
        echo [2] Multiverse-Core
        echo [3] Multiverse-Inventories
        echo [4] Multiverse-Portals
        echo [5] TAB
        echo [6] AuthMe
        echo [7] Citizens
        echo [8] Residence
        echo [9] ItemJoin
        echo [10] BetterRTP
        echo [11] GWarp
        echo [12] Jobs
        echo [13] EzChestShop
        echo [14] Quests
        echo [15] DeadChest
        echo [16] SimpleScore
        echo [17] Votifier
        echo [18] VotingPlugin
        echo [19] AutoMessage
        echo [20] ajLeaderboards
        echo [21] HolographicDisplays
        echo "Other options:"
        echo [0] Cancel
        read -p 'what config to edit? ' config

        #EssentialsX
        if [ "$config" = "1" ]; then
            sudo nano /home/filip/mccivilization/plugins/Essentials/config.yml
            clear
        fi

        #Multiverse-Core
        if [ "$config" = "2" ]; then
            clear
            echo [1] "./Multiverse-Core/config.yml"
            echo [2] "./Multiverse-Core/worlds.yml"
            echo [0] "cancel"
            read -p "which file? " configFile
            if [ "$configFile" = "1" ]; then
                sudo nano /home/filip/mccivilization/plugins/Multiverse-Core/config.yml
            fi
            if [ "$configFile" = "2" ]; then
                sudo nano /home/filip/mccivilization/plugins/Multiverse-Core/worlds.yml
            fi
            if [ "$configFile" = "0" ]; then
                echo "canceled"
            fi
            clear
        fi

        #Multiverse-Inventories
        if [ "$config" = "3" ]; then
            clear
            echo [1] "./Multiverse-Inventories/config.yml"
            echo [2] "./Multiverse-Inventories/groups.yml"
            echo [0] "cancel"
            read -p "which file? " configFile
            if [ "$configFile" = "1" ]; then
                sudo nano /home/filip/mccivilization/plugins/Multiverse-Inventories/config.yml
            fi
            if [ "$configFile" = "2" ]; then
                sudo nano /home/filip/mccivilization/plugins/Multiverse-Inventories/groups.yml
            fi
            if [ "$configFile" = "0" ]; then
                echo "canceled"
            fi
            clear
        fi
        if [ "$config" = "0" ]; then
            echo canceled
            clear
        fi

        #Multiverse-Portals
        if [ "$config" = "4" ]; then
            clear
            echo [1] "./Multiverse-Portals/config.yml"
            echo [2] "./Multiverse-Portals/portals.yml"
            echo [0] "cancel"
            read -p "which file? " configFile
            if [ "$configFile" = "1" ]; then
                sudo nano /home/filip/mccivilization/plugins/Multiverse-Portals/config.yml
            fi
            if [ "$configFile" = "2" ]; then
                sudo nano /home/filip/mccivilization/plugins/Multiverse-Portals/portals.yml
            fi
            if [ "$configFile" = "0" ]; then
                echo "canceled"
            fi
            clear
        fi

        #TAB
        if [ "$config" = "5" ]; then
            clear
            echo [1] "./TAB/animations.yml"
            echo [2] "./TAB/config.yml"
            echo [3] "./TAB/groups.yml"
            echo [4] "./TAB/layout.yml"
            echo [5] "./TAB/messages.yml"
            echo [6] "./TAB/users.yml"

            echo [0] "cancel"
            read -p "which file? " configFile
            if [ "$configFile" = "1" ]; then
                sudo nano /home/filip/mccivilization/plugins/TAB/animations.yml
            fi
            if [ "$configFile" = "2" ]; then
                sudo nano /home/filip/mccivilization/plugins/TAB/config.yml
            fi
            if [ "$configFile" = "3" ]; then
                sudo nano /home/filip/mccivilization/plugins/TAB/groups.yml
            fi
            if [ "$configFile" = "4" ]; then
                sudo nano /home/filip/mccivilization/plugins/TAB/layout.yml
            fi
            if [ "$configFile" = "5" ]; then
                sudo nano /home/filip/mccivilization/plugins/TAB/messages.yml
            fi
            if [ "$configFile" = "6" ]; then
                sudo nano /home/filip/mccivilization/plugins/TAB/users.yml
            fi
            if [ "$configFile" = "0" ]; then
                echo "canceled"
            fi
            clear
        fi

        #AuthMe
        if [ "$config" = "6" ]; then
            clear
            echo [1] "./AuthMe/commands.yml"
            echo [2] "./AuthMe/config.yml"
            echo [3] "./AuthMe/email.html"
            echo [4] "./AuthMe/messages/help_en.yml"
            echo [5] "./AuthMe/messages/messages_en.yml"
            echo [6] "./AuthMe/recovery_code_email.html"
            echo [7] "./AuthMe/spawn.yml"
            echo [8] "./AuthMe/verification_code_email.html"
            echo [9] "./AuthMe/welcome.txt"

            echo [0] "cancel"
            read -p "which file? " configFile
            if [ "$configFile" = "1" ]; then
                sudo nano /home/filip/mccivilization/plugins/AuthMe/commands.yml
            fi
            if [ "$configFile" = "2" ]; then
                sudo nano /home/filip/mccivilization/plugins/AuthMe/config.yml
            fi
            if [ "$configFile" = "3" ]; then
                sudo nano /home/filip/mccivilization/plugins/AuthMe/email.html
            fi
            if [ "$configFile" = "4" ]; then
                sudo nano /home/filip/mccivilization/plugins/AuthMe/messages/help_en.yml
            fi
            if [ "$configFile" = "5" ]; then
                sudo nano /home/filip/mccivilization/plugins/AuthMe/messages/messages_en.yml
            fi
            if [ "$configFile" = "6" ]; then
                sudo nano /home/filip/mccivilization/plugins/AuthMe/recovery_code_email.html
            fi
            if [ "$configFile" = "7" ]; then
                sudo nano /home/filip/mccivilization/plugins/AuthMe/spawn.yml
            fi
            if [ "$configFile" = "8" ]; then
                sudo nano /home/filip/mccivilization/plugins/AuthMe/verification_code_email.html
            fi
            if [ "$configFile" = "9" ]; then
                sudo nano /home/filip/mccivilization/plugins/AuthMe/welcome.txt
            fi
            if [ "$configFile" = "0" ]; then
                echo "canceled"
            fi
            clear
        fi

        #Citizens
        if [ "$config" = "7" ]; then
            clear
            echo [1] "./Citizens/config.yml"
            echo [2] "./Citizens/saves.yml"
            echo [3] "./Citizens/shops.yml"

            echo [0] "cancel"
            read -p "which file? " configFile
            if [ "$configFile" = "1" ]; then
                sudo nano /home/filip/mccivilization/plugins/Citizens/config.yml
            fi
            if [ "$configFile" = "2" ]; then
                sudo nano /home/filip/mccivilization/plugins/Citizens/saves.yml
            fi
            if [ "$configFile" = "3" ]; then
                sudo nano /home/filip/mccivilization/plugins/Citizens/shops.yml
            fi
            clear
        fi

        #Residence
        if [ "$config" = "8" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/Residence/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/Residence/$configFile
            fi
            clear
        fi

        #ItemJoin
        if [ "$config" = "9" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/ItemJoin/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/ItemJoin/$configFile
            fi
            clear
        fi

        #BetterRTP
        if [ "$config" = "10" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/BetterRTP/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/BetterRTP/$configFile
            fi
            clear
        fi

        #GWarp
        if [ "$config" = "11" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/GWarp/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/GWarp/$configFile
            fi
            clear
        fi

        #Jobs
        if [ "$config" = "12" ]; then
            clear
            sudo bash /home/mccivilization/mccivilization-adminui-ssh/jobs.sh
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/Jobs/$configFile
            fi
            clear
        fi

        #EzChestShop
        if [ "$config" = "13" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/EzChestShop/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/EzChestShop/$configFile
            fi
            clear
        fi

        #Quests
        if [ "$config" = "14" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/Quests/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/Quests/$configFile
            fi
            clear
        fi

        #DeadChest
        if [ "$config" = "15" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/DeadChest/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/DeadChest/$configFile
            fi
            clear
        fi

        #SimpleScore
        if [ "$config" = "16" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/SimpleScore/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/SimpleScore/$configFile
            fi
            clear
        fi

        #Votifier
        if [ "$config" = "17" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/Votifier/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/Votifier/$configFile
            fi
            clear
        fi

        #VotingPlugin
        if [ "$config" = "18" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/VotingPlugin/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/VotingPlugin/$configFile
            fi
            clear
        fi

        #AutoMessage
        if [ "$config" = "19" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/AutoMessage/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/AutoMessage/$configFile
            fi
            clear
        fi

        #ajLeaderboards
        if [ "$config" = "20" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/ajLeaderboards/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/ajLeaderboards/$configFile
            fi
            clear
        fi

        #HolographicDisplays
        if [ "$config" = "21" ]; then
            clear
            sudo ls /home/filip/mccivilization/plugins/HolographicDisplays/ | grep .yml
            read -p "which file? " configFile
            if [ "$configFile" = "" ]; then
                echo canceled
            else
                sudo nano /home/filip/mccivilization/plugins/HolographicDisplays/$configFile
            fi
            clear
        fi

        #cancel
        if [ "$config" = "0" ]; then
            echo canceled
        fi
        clear
        ;;
    "plugins" | "7")
        clear
        sudo echo "Plugins:"
        sudo ls /home/filip/mccivilization/plugins | grep .jar
        read -p 'Press ENTER to close this message' $null
        clear
        ;;
    *)
        echo "Unknown number / command"
        read -p 'Press ENTER to close this message' $null
        clear
        ;;
    esac
done
