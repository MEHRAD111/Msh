#!/bin/bash

# =========================
# MPCos Msh - Rebuilt Shell
# =========================

MSH_REPO_URL="https://github.com/MEHRAD111/Msh.git"
MSH_PKG_INDEX="https://raw.githubusercontent.com/MEHRAD111/MshRepo/main/index.json"

# =========================
# Boot Sequence
# =========================

clear

echo "Booting MPCos Desktop CRR (Gazaneh)..."
sleep 2
echo "Initializing kernel..."
sleep 2
echo "Starting services..."
sleep 1

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
oooo     oooo  oooooooo8 ooooo ooooo       oooooooo8 oooooooooo  oooooooooo 
 8888o   888  888         888   888       888         888    888  888    888
 88 888o8 88   888oooooo  888ooo888        888oooooo  888oooo88   888oooo88 
 88  888  88          888 888   888               888 888  88o    888  88o  
o88o  8  o88o o88oooo888 o888o o888o      o88oooo888 o888o  88o8 o888o  88o8
"

# =========================
# Main Shell Loop
# =========================

while true; do
    read -rp "(RootUser|Msh)> " command args

    case "$command" in

        # --- General ---
        exit|quit)
            echo "Exiting Msh..."
            break
            ;;

        help)
            echo "File & navigation:"
            echo "  list, where, go, make-folder, make-file, remove, remove-full"
            echo "System:"
            echo "  whoami, disk, lan, process, network-status, shell, clear"
            echo "  refresh-system, upgrade-system, access"
            echo "Development:"
            echo "  python, python-run, git, bash-open, sh-open, code, codium"
            echo "Msh tools:"
            echo "  msh-refresh, guide, mshcenter, mshbackuper, mpkg, mpkg-get"
            echo "  information-full, version"
            echo "Other:"
            echo "  print, exit, help"
            echo "Or download the full guide from GitHub."
            ;;

        clear)
            clear
            ;;

        print)
            echo "$args"
            ;;

        # --- File & navigation ---
        list)
            ls
            ;;

        where)
            pwd
            ;;

        go)
            cd "$args" || echo "Directory not found"
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

        # --- System info ---
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

        # --- Development ---
        python)
            python3
            ;;

        python-run)
            python3 "$args"
            ;;

        git)
            command git "$args"
            ;;

        bash-open)
            bash "$args"
            ;;

        sh-open)
            sh "$args"
            ;;

        code)
            code
            ;;

        codium)
            codium
            ;;

        # --- Msh tools ---
        msh-refresh)
            read -rp "Do you clone the Msh? (yes/no) We need to delete the Msh folder and fetch the updates: " answer
            if [[ "$answer" == "yes" ]]; then
                sudo rm -rf Msh
                sudo git clone "$MSH_REPO_URL"
            else
                sudo git clone "$MSH_REPO_URL"
            fi
            if [[ -d Msh ]]; then
                (cd Msh && sudo git checkout Rolling-Release)
                pwd
                ls
            fi
            ;;

        guide)
            echo "If you have not cloned Msh, please run [msh-refresh] first"
            if [[ -d Msh ]]; then
                cat Msh/MSH-CRR-Guide.txt
            else
                echo "Msh folder not found."
            fi
            ;;

        information-full)
            echo "MPCos with Msh SRR "
            echo "Github branch rolling-release"
            echo "MshCenter v3"
            echo "Release URL: github.com/MEHRAD111"
            ;;

        version)
            echo "MPCos MSH SRR"
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
            echo "MSh Center is the Msh updater. It works with git to download updates."
            echo "Command: msh-refresh"
            ;;

        mshbackuper)
            echo "Welcome to MshBackuper!"
            echo "
______  ___      ______     ________             ______
___   |/  /_________  /_    ___  __ )_____ _________  /_____  ______________________
__  /|_/ /__  ___/_  __ \   __  __  |  __  /  ___/_  //_/  / / /__  __ \  _ \_  ___/
_  /  / / _(__  )_  / / /   _  /_/ // /_/ // /__ _  ,<  / /_/ /__  /_/ /  __/  /
/_/  /_/  /____/ /_/ /_/    /_____/ \____/ \___/ /_/|_| \__,_/ _  .___/\___//_/
                                                               /_/
            "

            read -rp "Which operation? cp/mv: " operation
            read -rp "file or directory? " type

            if [[ "$type" == "file" ]]; then
                read -rp "File full path: " filepath
                read -rp "File name: " filename
                read -rp "Backup path: " pathup
                read -rp "Review: $filename from $filepath -> $pathup. Continue? (yes/no): " resume

                if [[ "$resume" == "yes" ]]; then
                    sudo "$operation" -v "$filepath/$filename" "$pathup"
                else
                    echo "Cancelled."
                fi

            elif [[ "$type" == "directory" ]]; then
                read -rp "Directory full path: " dirpath
                read -rp "Directory name: " dirname
                read -rp "Backup path: " pathup
                read -rp "Review: $dirname from $dirpath -> $pathup. Continue? (yes/no): " resume

                if [[ "$resume" == "yes" ]]; then
                    sudo "$operation" -rv "$dirpath/$dirname" "$pathup"
                else
                    echo "Cancelled."
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
            echo "MPKG (Msh Plugin/Package Manager)"
            echo "Usage: mpkg-get <package-name>"
            ;;

        mpkg-get)
            read -rp "Package name: " PKG

            INDEX=$(curl -s "$MSH_PKG_INDEX")
            URL=$(echo "$INDEX" | grep -A3 "\"$PKG\"" | grep "url" | cut -d '"' -f4)

            if [[ -z "$URL" ]]; then
                echo "Package not found: $PKG"
            else
                read -rp "Please give me a path to save the file: " pkgpath
                curl -s "$URL" -o "$pkgpath/${PKG}.sh"
                echo "Installed: $PKG"
            fi
            ;;

        *)
            echo "Command not found: $command"
            ;;
    esac
done
