#!/bin/bash
running=true
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
            cd mccivilization-adminui-ssh && git fetch && cd
            ;;
        *)
            echo "Command not found"
            ;;
    esac
done