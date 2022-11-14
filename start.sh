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
                sudo nano /home/filip/mccivilization/plugins/Multiverse-Core/config.yml
            
            if [ "$config" = "3" ]; then
                sudo nano /home/filip/mccivilization/plugins/Multiverse-Core/config.yml
            
            if [ "$config" = "4" ]; then
                sudo nano /home/filip/mccivilization/plugins/Multiverse-Core/config.yml
            
            if [ "$config" = "0" ]; then
                echo "canceled"
            else
                echo "Invalid option, canceling..."
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