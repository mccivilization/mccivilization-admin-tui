#!/bin/bash
clear
read -p 'command or number mode? [number]' ui
echo
if [ "$ui" = "update" ]; then
    sudo rm -r mccivilization-adminui-ssh && echo "deleted old ver" && git clone https://github.com/filip2cz/mccivilization-adminui-ssh.git && sudo chmod 777 ./mccivilization-adminui-ssh/* && exec ./mccivilization-adminui-ssh/start.sh
fi
if [ "$ui" = "command" ]; then
    echo [start] Starting server
    echo [stop] Stop server
    echo [restart] Restart server
    echo [status] Server status
    echo [config] Edit server and plugins config
    echo [console] Server console
    echo [help] Show this message
    echo [exit]/[quit] Exit
else
    echo [1] Starting server
    echo [2] Stop server
    echo [3] Restart server
    echo [4] Server status
    echo [5] Edit server and plugins config
    echo [6] Server console
    echo [7] Show this message
    echo [0] Exit
    $ui = "number"
fi
while :
do
    read -p '> ' command
    case $command in
        "exit")
            exit
        ;;
        "quit")
            exit
        ;;
        "help")
            if [ "$uid" = "number" ]; then
                echo [1] Starting server
                echo [2] Stop server
                echo [3] Restart server
                echo [4] Server status
                echo [5] Edit server and plugins config
                echo [6] Server console
                echo [7] Show this message
                echo [0] Exit
            else
                echo [start] Starting server
                echo [stop] Stop server
                echo [restart] Restart server
                echo [status] Server status
                echo [config] Edit server and plugins config
                echo [console] Server console
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
            sudo rm -r mccivilization-adminui-ssh && echo "deleted old ver" && git clone https://github.com/filip2cz/mccivilization-adminui-ssh.git && sudo chmod 777 ./mccivilization-adminui-ssh/* && exec ./mccivilization-adminui-ssh/start.sh
        ;;
        "pwd")
            pwd
        ;;
        "uname")
            uname -a
        ;;
        "console" | "6")
            /usr/local/bin/mcrcon -H 127.0.0.1 -P 20656 -p filipjebuh
        ;;
        "config" | "5")
            echo "Server configs:"
            echo "Empty"
            echo "Plugins:"
            echo [1] Essentials
            echo "Other options:"
            echo [0] Cancel
            read -p 'what config to edit? ' config
            if [ "$config" = "1" ]; then
                sudo nano /home/filip/mccivilization/plugins/Essentials/config.yml && sudo chmod 777 /home/filip/mccivilization/plugins/Essentials/config.yml
            else
                sudo nano /home/filip/mccivilization/plugins/Essentials/config.yml && sudo chmod 777 /home/filip/mccivilization/plugins/Essentials/config.yml
            fi
        ;;
        *)
            echo "Unknown command"
        ;;
    esac
done