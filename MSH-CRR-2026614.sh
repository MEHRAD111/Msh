#!/bin/bash

# =========================
# MPCos Msh - Rebuilt Shell
# =========================

clear

echo "Booting MPCos Desktop CRR (Gazaneh)..."
sleep 2
echo "Initializing kernel..."
sleep 2
echo "Starting services..."
sleep 1

# --- Startup messages ---
services=(
"MSH Center"
"OSD for gpu"
"Firewall"
"Security Module of MSH"
"MSH-CLI"
"Mount /Msh"
"Read MSH.sh"
"Msh"
"RootUsers"
""
)

for s in "${services[@]}"; do
    echo "start $s"
    sleep 1.5
done

echo "System ready."
sleep 6

echo "Msh is ready to use!"
echo "


oooo     oooo  oooooooo8 ooooo ooooo        oooooooo8 oooooooooo  oooooooooo 
 8888o   888  888         888   888       o888     88  888    888  888    888
 88 888o8 88   888oooooo  888ooo888       888          888oooo88   888oooo88 
 88  888  88          888 888   888       888o     oo  888  88o    888  88o  
o88o  8  o88o o88oooo888 o888o o888o       888oooo88  o888o  88o8 o888o  88o8

"

# =========================
# Main Shell Loop
# =========================
while true; do
    read -rp "(RootUser|Msh)> " command args

    case "$command" in

        exit|quit)
            echo "Exiting Msh..."
            break
            ;;

        help)
            echo "Commands:"
            echo "  list, where, make-folder, remove, make-file"
            echo "  go, print, clear, whoami, disk, lan"
            echo "  exit, help"
            echo "  Or you can download the full guide from github"
            ;;

        list)
            ls
            ;;

        where)
            pwd
            ;;

        make-folder)
            mkdir -p "$args"
            ;;

        make-file)
            touch "$args"
            ;;

        remove)
            rm -r "$args"
            ;;

        remove-full)
            rm -rf "$args"
            ;;

        go)
            cd "$args" || echo "Directory not found"
            ;;

        print)
            echo "$args"
            ;;

        clear)
            clear
            ;;

        whoami)
            echo "MRU"
            command whoami
            ;;

        disk)
            df -h
            ;;

        lan)
            ip a
            ;;

        process)
            ps
            ;;

        network-status)
            ss
            ;;

        shell)
            echo "$SHELL"
            ;;

        python)
            python3
            ;;

        python-run)
            python3 "$args"
            ;;

        git)
            command git "$args"
            ;;

        refresh-system)
            echo "Trying package updates..."
            sudo apt update 2>/dev/null
            sudo dnf update 2>/dev/null
            sudo zypper refresh 2>/dev/null
            sudo pacman -Syu --noconfirm 2>/dev/null
            ;;

        upgrade-system)
            sudo apt upgrade -y 2>/dev/null
            sudo dnf upgrade -y 2>/dev/null
            sudo zypper update -y 2>/dev/null
            sudo pacman -Syu --noconfirm 2>/dev/null
            ;;

        access)
            chmod +x "$args"
            ;;

        bash-open)
            bash "$args"
            ;;

        sh-open)
            sh "$args"
            ;;
        msh-refresh)
        read -p  "Do you clone the Msh?(yes/no)(We need to delete the Msh folder and fetch the updates)" answer
        if [ "$answer" = "yes" ] 
        then
        sudo rm -r Msh
         sudo git clone https://github.com/MEHRAD111/Msh.git
        sudo -s cd Msh
        sudo git checkout Rolling-Release
        pwd
        ls
        else
        sudo git clone https://github.com/MEHRAD111/Msh.git
        sudo -s cd Msh
        sudo git checkout Rolling-Release
        pwd
        ls
fi

        ;;
        guide)
        echo "If you not clone the Msh,please run [msh-refresh] first"
        cd Msh
        cat MSH-CRR-Guide.txt
        ;;
        information-full)
        MPCos with Msh CRR 202667
        Github branch rolling-release
        MshCenter v3
        Release URL:github.com/MEHRAD111

           ;;
        version)
        MPCos MSH CRR 2026.6.7
        ;;
        mshcenter)
        echo "
███╗   ███╗███████╗██╗  ██╗     ██████╗███████╗███╗   ██╗████████╗███████╗██████╗     
████╗ ████║██╔════╝██║  ██║    ██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔════╝██╔══██╗    
██╔████╔██║███████╗███████║    ██║     █████╗  ██╔██╗ ██║   ██║   █████╗  ██████╔╝   
██║╚██╔╝██║╚════██║██╔══██║    ██║     ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗    
██║ ╚═╝ ██║███████║██║  ██║    ╚██████╗███████╗██║ ╚████║   ██║   ███████╗██║  ██║     
╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝     ╚═════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝  V3
            "
            echo "MSh Center is msh updater.it's work with git for downloads update"
            echo "Commands:msh-refreh"
            ;;
            code)
            code 
            ;;
            codium)
            codium 
            ;;
            mshbackuper)
echo "Welcome to MshBackuper!"

echo "
______  ___      ______     ________             ______                                    
___   |/  /_________  /_    ___  __ )_____ _________  /_____  ______________________       
__  /|_/ /__  ___/_  __ \   __  __  |  __  /  ___/_  //_/  / / /__  __ \  _ \_  ___/       
_  /  / / _(__  )_  / / /   _  /_/ // /_/ // /__ _  ,<  / /_/ /__  /_/ /  __/  /           
/_/  /_/  /____/ /_/ /_/    /_____/ \____/ \___/ /_/|_| \__,_/ _  .___/\___//_/            
                                                               /_/                 "

read -p "Which operation? cp/mv: " operation
read -p "file or directory? " type

if [ "$type" = "file" ]; then

    read -p "File full path: " filepath
    read -p "File name: " filename
    read -p "Backup path: " pathup

    read -p "Review: $filename from $filepath -> $pathup. Continue? (yes/no): " resume

    if [ "$resume" = "yes" ]; then
        sudo $operation -v "$filepath/$filename" "$pathup"
    else
        exit 1
    fi

elif [ "$type" = "directory" ]; then

    read -p "Directory full path: " dirpath
    read -p "Directory name: " dirname
    read -p "Backup path: " pathup

    read -p "Review: $dirname from $dirpath -> $pathup. Continue? (yes/no): " resume

    if [ "$resume" = "yes" ]; then
        sudo $operation -rv "$dirpath/$dirname" "$pathup"
    else
        exit 1
    fi

else
    echo "Invalid type!"
fi
;;
mpkg)
echo '
███╗   ███╗██████╗ ██╗  ██╗ ██████╗ 
████╗ ████║██╔══██╗██║ ██╔╝██╔════╝ 
██╔████╔██║██████╔╝█████╔╝ ██║  ███╗
██║╚██╔╝██║██╔═══╝ ██╔═██╗ ██║   ██║
██║ ╚═╝ ██║██║     ██║  ██╗╚██████╔╝
╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ 
'
echo 'Welcome to mpkg'
echo ''
read -p "Do you want to download a new app?" app
if [ "$app" == "yes" ]; then
echo "Loading repos..."
git clone https://github.com/MEHRAD111/MshRepo.git
cd Apps
ls
echo "just run bash filename.sh"
fi
;;
            
        *)
            echo "Command not found: $command"
            ;;
    esac

done