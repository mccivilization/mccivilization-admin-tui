#!/bin/bash

# config

updateServer="https://github.com/mccivilization/mccivilization-admin-tui.git"
updateServerVer="https://raw.githubusercontent.com/mccivilization/mccivilization-admin-tui/main/version"
localServerVer="./mccivilization-admin-tui/version"

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
        sudo rm -r mccivilization-adminui-ssh && echo "deleted old ver" && git clone $updateServer && sudo chmod 771 ./mccivilization-admin-tui/* && exec ./mccivilization-admin-tui/start.sh
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
    echo [6] Show installed plugins
    echo [7] Change password
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
    "stop" | "2")
        sudo systemctl stop mccivilization && echo "Server stopped" && read -p 'Press ENTER to close this message' $null
        clear
        ;;
    "restart" | "3")
        echo "Restarting server..." && sudo systemctl stop mccivilization && sleep 30 && sudo systemctl start mccivilization && echo "Server restarted"
        read -p 'Press ENTER to close this message' $null
        clear
        ;;
    "status" | "4")
        clear
        sudo systemctl status mccivilization
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
    "plugins" | "6")
        clear
        sudo echo "Plugins:"
        sudo ls /home/filip/mccivilization/plugins | grep .jar
        read -p 'Press ENTER to close this message' $null
        clear
        ;;
    "passwd" | "7")
        passwd && read -p 'Press ENTER to close this message' $null
        clear
        ;;
    *)
        echo "Unknown number / command"
        read -p 'Press ENTER to close this message' $null
        clear
        ;;
    esac
done
