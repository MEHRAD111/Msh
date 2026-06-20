#!/bin/bash

# =========================
# MPCos Msh - Rebuilt Shell
# =========================

clear

echo "Booting MPCos Desktop Stable V2 (Damavand)..."
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


oooo     oooo            oooo              oooooooo8   o8              oooo       o888            
 8888o   888   oooooooo8  888ooooo        888        o888oo  ooooooo    888ooooo   888  ooooooooo8
 88 888o8 88  888ooooooo  888   888        888oooooo  888    ooooo888   888    888 888 888oooooo8 
 88  888  88          888 888   888               888 888  888    888   888    888 888 888        
o88o  8  o88o 88oooooo88 o888o o888o      o88oooo888   888o 88ooo88 8o o888ooo88  o888o  88oooo888 V2

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
         echo "MPCos with Msh Stable V2"
        echo "Github branch Stable"
         echo "MshCenter v3"
        echo "Release URL:github.com/MEHRAD111"

           ;;
        version)
        MPCos MSH Stable V2
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
echo "MPKG(Msh Plugin Manager)"
echo "Uasge:mpkg-get app.sh"

;;


mpkg-get )
 read -p "Package name: " PKG

INDEX_URL="https://raw.githubusercontent.com/MEHRAD111/MshRepo/main/index.json"

INDEX=$(curl -s "$INDEX_URL")

URL=$(echo "$INDEX" | grep -A3 "\"$PKG\"" | grep "url" | cut -d '"' -f4)

if [ -z "$URL" ]; then
    echo "Package not found: $PKG"
    exit 1
fi


read -p "Please give me a path to save the file:" pkgpath
curl -s "$URL" -o $pkgpath/${PKG}.sh

echo "Installed: $PKG"
;;
        *)
            echo "Command not found: $command"
            ;;
    esac

done
