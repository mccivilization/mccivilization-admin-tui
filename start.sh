#!/bin/bash
clear
read -p 'command or number mode? [number]' ui
echo
if [ "$ui" = "update" ]; then
    sudo rm -r mccivilization-adminui-ssh && echo "deleted old ver" && git clone https://github.com/filip2cz/mccivilization-adminui-ssh.git && sudo chmod 771 ./mccivilization-adminui-ssh/* && exec ./mccivilization-adminui-ssh/start.sh
fi
if [ "$ui" = "command" ]; then
    echo [start] Starting server
    echo [stop] Stop server
    echo [restart] Restart server
    echo [status] Server status
    echo [console] Server console
    echo [config] Edit server and plugins config
    echo [plugins] Show installed plugins
    echo [help] Show this message
    echo [exit]/[quit] Exit
else
    ui="number"
fi
while :
do
    if [ "$ui" = "command" ]; then
        read -p '> ' command
    else
        clear
        echo [1] Starting server
        echo [2] Stop server
        echo [3] Restart server
        echo [4] Server status
        echo [5] Server console
        echo [6] Edit server and plugins config
        echo [7] Show installed plugins
        echo [0] Exit
        read -p 'number: ' command
    fi
    case $command in
        "exit" | "quit" | "0")
            exit
        ;;
        "help")
            if [ "$ui" = "number" ]; then
                echo [1] Starting server
                echo [2] Stop server
                echo [3] Restart server
                echo [4] Server status
                echo [5] Server console
                echo [6] Edit server and plugins config
                echo [7] Show installed plugins
                echo [0] Exit
                read -p 'Press ENTER to close this message' $null
            else
                echo [start] Starting server
                echo [stop] Stop server
                echo [restart] Restart server
                echo [status] Server status
                echo [console] Server console
                echo [config] Edit server and plugins config
                echo [plugins] Show installed plugins
                echo [help] Show this message
                echo [exit]/[quit] Exit
            fi
        ;;
        "start" | "1")
            sudo systemctl start mccivilization && echo "Server started" && read -p 'Press ENTER to close this message' $null
        ;;
        "stop" | "2")
            sudo systemctl stop mccivilization && echo "Server stopped" && read -p 'Press ENTER to close this message' $null
        ;;
        "status" | "4")
            if [ "$ui" = "number" ]; then
                clear
            fi
            sudo systemctl status mccivilization
            if [ "$ui" = "number" ]; then
                read -p 'Press ENTER to close this message' $null
            fi
        ;;
        "restart" | "3")
            echo "Restarting server..." && sudo systemctl stop mccivilization && sleep 30 && sudo systemctl start mccivilization && echo "Server restarted"
            if [ "$ui" = "number" ]; then
                read -p 'Press ENTER to close this message' $null
            fi
        ;;
        "update")
            sudo rm -r mccivilization-adminui-ssh && echo "deleted old ver" && git clone https://github.com/filip2cz/mccivilization-adminui-ssh.git && sudo chmod 771 ./mccivilization-adminui-ssh/* && exec ./mccivilization-adminui-ssh/start.sh
        ;;
        "pwd")
            if [ "$ui" = "number" ]; then
                clear
            fi
            pwd
            if [ "$ui" = "number" ]; then
                read -p 'Press ENTER to close this message' $null
            fi
        ;;
        "cls" | "clear")
            clear
        ;;
        "uname")
            if [ "$ui" = "number" ]; then
                clear
            fi
            uname -a
            if [ "$ui" = "number" ]; then
                read -p 'Press ENTER to close this message' $null
            fi
        ;;
        "top")
            top
        ;;
        "console" | "5")
            /usr/local/bin/mcrcon -H 127.0.0.1 -P 20656 -p filipjebuh
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
            echo "Other options:"
            echo [0] Cancel
            read -p 'what config to edit? ' config

            #EssentialsX
            if [ "$config" = "1" ]; then
                sudo nano /home/filip/mccivilization/plugins/Essentials/config.yml
            fi

            #Multiverse-Core
            if [ "$config" = "2" ]; then
                clear
                if [ "$ui" = "number" ]; then
                    clear
                else
                    echo
                fi
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
            fi

            #Multiverse-Inventories
            if [ "$config" = "3" ]; then
                clear
                if [ "$ui" = "number" ]; then
                    clear
                else
                    echo
                fi
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
            fi
            if [ "$config" = "0" ]; then
                echo canceled
            fi

            #Multiverse-Portals
            if [ "$config" = "4" ]; then
                clear
                if [ "$ui" = "number" ]; then
                    clear
                else
                    echo
                fi
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
            fi

            #TAB
            if [ "$config" = "5" ]; then
                clear
                if [ "$ui" = "number" ]; then
                    clear
                else
                    echo
                fi
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
            fi

            #AuthMe
            if [ "$config" = "6" ]; then
                clear
                if [ "$ui" = "number" ]; then
                    clear
                else
                    echo
                fi
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
            fi

            #Citizens
            if [ "$config" = "7" ]; then
                clear
                if [ "$ui" = "number" ]; then
                    clear
                else
                    echo
                fi
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
            fi

            #ItemJoin
            if [ "$config" = "9" ]; then
                clear
                if [ "$ui" = "number" ]; then
                    clear
                else
                    echo
                fi
                echo [1] "./ItemJoin/config.yml"
                echo [2] "./ItemJoin/en-lang.yml"
                echo [3] "./ItemJoin/items.yml"
                echo [0] "cancel"
                read -p "which file? " configFile
                if [ "$configFile" = "1" ]; then
                    sudo nano /home/filip/mccivilization/plugins/ItemJoin/config.yml
                fi
                if [ "$configFile" = "2" ]; then
                    sudo nano /home/filip/mccivilization/plugins/ItemJoin/en-lang.yml
                fi
                if [ "$configFile" = "3" ]; then
                    sudo nano /home/filip/mccivilization/plugins/ItemJoin/items.yml
                fi
                if [ "$configFile" = "0" ]; then
                    echo "canceled"
                fi
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
            fi

            #Jobs
            if [ "$config" = "12" ]; then
                clear
                sudo ls /home/filip/mccivilization/plugins/Jobs/ | grep .yml
                read -p "which file? " configFile
                if [ "$configFile" = "" ]; then
                    echo canceled
                else
                    sudo nano /home/filip/mccivilization/plugins/Jobs/$configFile
                fi
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
            fi

            #cancel
            if [ "$config" = "0" ]; then
                echo canceled
            fi
        ;;
        "plugins" | "7")
            if [ "$ui" = "number" ]; then
                clear
            fi
            sudo echo "Plugins:"
            sudo ls /home/filip/mccivilization/plugins | grep .jar
            if [ "$ui" = "number" ]; then
                read -p 'Press ENTER to close this message' $null
            fi
        ;;
        *)
            if [ "$ui" = "command" ]; then
                echo "Unknown command"
            else
                echo "Unknown number"
            fi
        ;;
    esac
done