#!/bin/bash

MSH_REPO_URL="https://github.com/MEHRAD111/Msh.git"
MSH_PKG_INDEX="https://raw.githubusercontent.com/MEHRAD111/MshRepo/main/index.json"

clear
echo "Welcome To MSH SRR (Gazaneh)"
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
GREEN='\033[38;5;120m'
BLUE='\033[38;5;117m'
YELLOW='\033[38;5;221m'
PINK='\033[38;5;211m'
GRAY='\033[38;5;246m'
DARK='\033[38;5;238m'
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'
USER_NAME=$(whoami)
HOST_NAME=$(hostname)
CURRENT_DIR=$(pwd)
HOME_DIR="$HOME"
SHORT_DIR=$(echo "$CURRENT_DIR" | sed "s|$HOME_DIR|~|")
PS3="$(echo -e "
${DIM}${DARK}╭─${RESET}${BOLD}${GREEN}${USER_NAME}${RESET}${DIM}${GRAY}@${RESET}${BOLD}${BLUE}${HOST_NAME}${RESET}${DIM}${GRAY} │ ${RESET}${BOLD}${YELLOW}${SHORT_DIR}${RESET}
${DIM}${DARK}╰─${RESET}${BOLD}${PINK}❯${RESET} ")"
while true; do
    read -rp "$PS3" command args

    case "$command" in

        # --- General ---
        exit|quit)
            echo "Exiting Msh..."
            break
            ;;

        help)
            echo "Download the full guide from GitHub."
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
            run)
            read -rp "=>" write
            $write
            ;;
             install)
             read -rp "=>" installing
             sudo apt install $installing 2>/dev/null
             sudo dnf install $installing 2>/dev/null
             sudo pacman -S $installing 2>/dev/null
             sudo zypper in $installing 2>/dev/null
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
            docker)
            docker
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
            echo "Msh SRR "
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
            echo "Usage: mpkg-get, mpkg-show, mpkg-list, mpkg-enable, mpkg-disable, mpkg-run"
            
            ;;

        mpkg-get)
    read -rp "Package name: " PKG

    INDEX=$(curl -s "$MSH_PKG_INDEX")
    URL=$(echo "$INDEX" | grep -A3 "\"$PKG\"" | grep "url" | cut -d '"' -f4)

    if [[ -z "$URL" ]]; then
        echo -e "\033[1;31m✗ Package not found: $PKG\033[0m"
    else
        curl -s "$URL" -o "./${PKG}.sh"
        chmod +x "./${PKG}.sh"
        echo -e "\033[1;32m✓ Installed: $PKG in $(pwd)\033[0m"
    fi
    ;;
            mpkg-show)
            echo "Download And Show The Available Plugin.."
            echo ""
            wget "https://github.com/MEHRAD111/MshRepo/raw/refs/heads/main/available.plugin"
            cat available.plugin
            sudo rm available.plugin
            ;;
            mpkg-disable)
            read -rp "Which Plugin Do You Want to Disable :>" plugind
            if [[ -f "$plugind.sh" ]]; then
            mv "$plugind.sh" ".$plugind.sh"
             else
             echo "$plugind plugin not found."
             fi
            
            ;;
            mpkg-enable)
            read -rp "Which Plugin Do You Want To Enable :>" plugine
            if [[ -f ".$plugine.sh" ]]; then
            mv ".$plugine.sh" "$plugine.sh"
             else
             echo "$plugine.sh not found."
             fi
            ;;
            mpkg-list)
            ls *.sh
            ;;
            mpkg-run)
            read -rp "Which Plugin Do You Want To Run:>" pluginr
            if [[ -f "$pluginr.sh" ]]; then
            bash "$pluginr.sh"
            else
            echo "$pluginr.sh not found"
            fi
            ;;
            mshfetch)
             echo "
oooo     oooo  oooooooo8 ooooo ooooo       oooooooo8 oooooooooo  oooooooooo 
 8888o   888  888         888   888       888         888    888  888    888
 88 888o8 88   888oooooo  888ooo888        888oooooo  888oooo88   888oooo88 
 88  888  88          888 888   888               888 888  88o    888  88o  
o88o  8  o88o o88oooo888 o888o o888o      o88oooo888 o888o  88o8 o888o  88o8
"
hostnamectl                                                                                                                                        ;;

        *)
            echo "Command not found: $command"
            ;;
    esac
done
