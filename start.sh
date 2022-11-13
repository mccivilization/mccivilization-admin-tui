#!/bin/bash
clear
read -p 'command or number mode? [command]' ui
echo

if [ "$ui" = "number" ]; then
echo "not implemented yet"
else
echo [start] Starting server
echo [stop] Stop server
echo [restart] Restart server
echo [status] Server status
echo [help] Show this message
echo [exit]/[quit] Exit
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
            echo [start] Starting server
            echo [stop] Stop server
            echo [restart] Restart server
            echo [status] Server status
            echo [help] Show this message
            echo [exit]/[quit] Exit
            ;;
        "start")
            sudo systemctl start mccivilization && echo "Server started"
            ;;
        "stop")
            sudo systemctl stop mccivilization && echo "Server stopped"
            ;;
        "status")
            sudo systemctl status mccivilization
            ;;
        "restart")
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
        "config")
            echo "Plugins: essentialsx"
            echo "or entet cancel to cancel"
            read -p 'what plugin?: ' plugin
            case $plugin in
                "essentialsx")
                    sudo nano /home/filip/mccivilization/plugins/Essentials/config.yml && chmod 777 /home/filip/mccivilization/plugins/Essentials/config.yml
                    ;;
                "cancel")
                    echo "canceled"
                    ;;
                *) 
                    echo "plugin not found"
                    ;;
            ;;
        *)
            echo "Unknown command"
            ;;
    esac
done
fi