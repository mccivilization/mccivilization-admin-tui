#!/bin/bash
if [ "$ui" = "number" ]; then
                clear
            fi
            echo "Server configs:"
            echo "Empty"
            echo "Plugins:"
            echo [1] EssentialsX
            echo [2] Multiverse-Core
            echo [3] Multiverse-
            echo [4] Multiverse-
            echo "Other options:"
            echo [0] Cancel
            read -p 'what config to edit? ' config
            if [ "$config" = "1" ]; then
                sudo nano /home/filip/mccivilization/plugins/Essentials/config.yml
            elif [ "$config" = "2" ]; then
                if [ "$ui" = "number" ]; then
                    clear
                else
                    echo
                fi
                echo [1] "./Multiverse-Core/config.yml"
                echo [2] "./Multiverse-Core/worlds.yml"
                echo [0] "cancel"
                read -p "which file? " configFile
                if [ "$configFile" = "1" ]
                    sudo nano /home/filip/mccivilization/plugins/Multiverse-Core/config.yml
                elif [ "$configFile" = "2" ]
                    sudo nano /home/filip/mccivilization/plugins/Multiverse-Core/worlds.yml
                elif [ "$configFile" = "0" ]
                    echo "canceled"
                else
                    echo "invalid option, exiting"
                    if [ "$ui" = "number" ]; then
                        read -p 'Press ENTER to close this message' $null
                    fi
                fi
            elif [ "$config" = "3" ]; then
                sudo nano /home/filip/mccivilization/plugins/Multiverse-Core/config.yml
            
            elif [ "$config" = "4" ]; then
                sudo nano /home/filip/mccivilization/plugins/Multiverse-Core/config.yml
            
            elif [ "$config" = "0" ]; then
                echo "canceled"
            else
                echo "Invalid option, canceling..."
                if [ "$ui" = "number" ]; then
                    read -p 'Press ENTER to close this message' $null
                fi
            fi