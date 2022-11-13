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
    echo [1] Starting server
    echo [2] Stop server
    echo [3] Restart server
    echo [4] Server status
    echo [5] Server console
    echo [6] Edit server and plugins config
    echo [7] Show installed plugins
    echo [8] Show this message
    echo [0] Exit
    ui="number"
fi
while :
do
    if [ "$ui" = "command" ]; then
        read -p 'command: ' command
    else
        read -p 'number: ' command
    fi
    case $command in
        "exit" | "quit" | "0")
            exit
        ;;
        "help" | "8")
            if [ "$ui" = "number" ]; then
                echo [1] Starting server
                echo [2] Stop server
                echo [3] Restart server
                echo [4] Server status
                echo [5] Server console
                echo [6] Edit server and plugins config
                echo [7] Show installed plugins
                echo [8] Show this message
                echo [0] Exit
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
            sudo systemctl start mccivilization && echo "Server started"
        ;;
        "stop" | "2")
            sudo systemctl stop mccivilization && echo "Server stopped"
        ;;
        "status" | "4")
            sudo systemctl status mccivilization
        ;;
        "restart" | "3")
            echo "Restarting server..." && sudo systemctl stop mccivilization && sleep 30 && sudo systemctl start mccivilization && echo "Server restarted"
        ;;
        "update")
            sudo rm -r mccivilization-adminui-ssh && echo "deleted old ver" && git clone https://github.com/filip2cz/mccivilization-adminui-ssh.git && sudo chmod 771 ./mccivilization-adminui-ssh/* && exec ./mccivilization-adminui-ssh/start.sh
        ;;
        "pwd")
            pwd
        ;;
        "cls" | "clear")
            clear
        ;;
        "uname")
            uname -a
        ;;
        "top")
            top
        ;;
        "console" | "5")
            /usr/local/bin/mcrcon -H 127.0.0.1 -P 20656 -p filipjebuh
        ;;
        "config" | "6")
            echo "Server configs:"
            echo "Empty"
            echo "Plugins:"
            echo [1] Essentials
            echo "Other options:"
            echo [0] Cancel
            read -p 'what config to edit? ' config
            if [ "$config" = "1" ]; then
                sudo chmod 777 /home/filip/mccivilization/plugins/Essentials/config.yml && nano /home/filip/mccivilization/plugins/Essentials/config.yml && sudo chmod 664 /home/filip/mccivilization/plugins/Essentials/config.yml
            fi
            if [ "$config" = "0" ]; then
                echo "canceled"
            fi
        ;;
        "plugins" | "7")
            sudo ls /home/filip/mccivilization/plugins
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