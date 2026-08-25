#!/bin/bash
#Start Of Msh
#Var
  Build=47
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
  MSH_REPO_URL="https://github.com/MEHRAD111/Msh.git"
  MSH_PKG_INDEX="https://raw.githubusercontent.com/MEHRAD111/MshRepo/main/index.json"
#ASCII 
 clear
 echo "Welcome To MSH Srr"
 echo "
 oooo     oooo  oooooooo8 ooooo ooooo       oooooooo8 oooooooooo  oooooooooo 
  8888o   888  888         888   888       888         888    888  888    888
  88 888o8 88   888oooooo  888ooo888        888oooooo  888oooo88   888oooo88 
  88  888  88          888 888   888               888 888  88o    888  88o  
 o88o  8  o88o o88oooo888 o888o o888o      o88oooo888 o888o  88o8 o888o  88o8
 "
# Main Shell Loop
while true; do
    read -rp "$PS3" command args arg2 arg3

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
            cd "$args"
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
            whoami
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
            sudo apt update 
            sudo dnf update 
            sudo zypper refresh 
            sudo pacman -Syu 
            ;;

        upgrade-system)
            sudo apt upgrade 
            sudo dnf upgrade 
            sudo zypper update 
            sudo pacman -Syu 
            ;;
        install)
            sudo apt install "$args" 
            sudo dnf install "$args" 
            sudo pacman -S   "$args" 
            sudo zypper in   "$args" 
            ;;    
        remove)
            sudo apt remove   "$args"
            sudo dnf remove  "$args" 
            sudo pacman -R  "$args" 
            sudo zypper remove "$args"
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
            docker "$args"
            ;;

        # --- Msh tools ---
        msh-refresh)
          echo "Msh Srr GitHub Version:"
          wget -qO- https://raw.githubusercontent.com/MEHRAD111/Msh/refs/heads/Rolling-Release/MSH-SRR.sh | grep Build   
          echo "Your Msh Version:$Build"
           ;;

        guide)
           cat MSH-SRR-Guide.txt | less
            ;;
            
            open)
           case "$args" in
              log)
              journalctl | less
              ;;
              log2)
              journalctl -b 2 | less
              ;;
              live-log)
              journalctl -f
              ;;
              kernel-log)
              journalctl -k | less
              ;;
              reclog)
              journalctl -xe | less
              ;;
              errors)
              journalctl -p err -b | less
              ;;
              warnings)
              journalctl -p warning -b | less
              ;;
              disk)
              journalctl --disk-usage
              df -h | less
              ;;
              boots)
              journalctl --list-boots
              ;;
              website)
              firefox web-five-delta-69.vercel.app
              ;;
              github)
              firefox https://github.com/MEHRAD111/Msh
              ;;
              monitor)
              htop || top
              ;;
              *)
              echo "
                  ooooooo                                      
                o888   888o ooooooooo    ooooooooo8 oo oooooo  
                888     888  888    888 888oooooo8   888   888 
                888o   o888  888    888 888          888   888 
                  88ooo88    888ooo88     88oooo888 o888o o888o 
                            o888                               
                         "
                    echo "Open | Usage : [log,log2,live-log,kernel-log,reclog,errors,warning,disk,boots,website,github,monitor]"           
           esac
            ;;
        mshcenter)
            echo "
              ███╗   ███╗███████╗██╗  ██╗     ██████╗███████╗███╗   ██╗████████╗███████╗██████╗
              ████╗ ████║██╔════╝██║  ██║    ██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔════╝██╔══██╗
              ██╔████╔██║███████╗███████║    ██║     █████╗  ██╔██╗ ██║   ██║   █████╗  ██████╔╝
              ██║╚██╔╝██║╚════██║██╔══██║    ██║     ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗
              ██║ ╚═╝ ██║███████║██║  ██║    ╚██████╗███████╗██║ ╚████║   ██║   ███████╗██║  ██║
              ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝     ╚═════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝  V6
            "
            echo "Msh Center is the Msh updater. It works with git to download updates."
            echo "Command: msh-refresh"
            ;;

        mpkg)
            case "$args" in
        get)    
            PKG="$arg2"
        
            if [[ -z "$arg2" ]]; then
                echo -e "\033[1;31mUsage: mpkg-get <plugin-name>\033[0m"
            fi
        
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
        run)
        if [[ -f "$arg2.sh" ]]; then
        bash $arg2.sh
        else
        echo "Plugin $arg2 Not Found"
        fi
        ;;
        show)
            echo "Download And Show The Available Plugin.."
            echo ""
            wget "https://github.com/MEHRAD111/MshRepo/raw/refs/heads/main/available.plugin" 2>/dev/null
            cat available.plugin
            sudo rm available.plugin
            ;;
        disable)
            if [[ -f "$arg2.sh" ]]; then
            mv "$arg2.sh" ".$arg2.sh"
            echo "Plugin $arg2 Disabled"
            elif [ "$arg2" == "" ]; then
            echo "Usage : mpkg-disable <plugin-name>"
             else
             echo "Plugin $arg2 Not Found."
             fi
            
            ;;
        enable)
            if [[ -f ".$arg2.sh" ]]; then
            mv ".$arg2.sh" "$arg2.sh"
            echo "Plugin $arg2 Enabled"
            elif [ "$arg2" == "" ]; then
            echo "Usage : mpkg-enable <plugin-name>"
             else
             echo "Plugin $arg2 Not Found."
             fi
            ;;
        list)
            ls *.sh
            ;;
        run)
            if [[ -f "$arg2.sh" ]]; then
            bash "$arg2.sh"
            elif [ "$arg2" == "" ]; then
            echo "Usage : mpkg-run <plugin-name>"
            else
            echo "Plugin $arg2 Not Found"
            fi
            ;;
        info)
         if [[ -f "$arg2.sh" ]]; then
          cat "$arg2.sh" | grep Version
          cat "$arg2.sh" | grep Branch
           elif [ "$arg2" == "" ]; then
          echo "Usage:mpkg info <plugin-name>"
           else
          echo "Plugin $arg2 Not Found"
          fi
          ;;    
            *)
            echo '
              ███╗   ███╗██████╗ ██╗  ██╗ ██████╗
              ████╗ ████║██╔══██╗██║ ██╔╝██╔════╝
              ██╔████╔██║██████╔╝█████╔╝ ██║  ███╗
              ██║╚██╔╝██║██╔═══╝ ██╔═██╗ ██║   ██║
              ██║ ╚═╝ ██║██║     ██║  ██╗╚██████╔╝
              ╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ V7
            '
            echo "MPKG (Msh Plugin/Package Manager)"
            echo "Usage: get, show, list, enable, disable, run, info"
            esac
            
            ;;

        
        mshfetch)
             echo "
              oooo     oooo  oooooooo8 ooooo ooooo       oooooooo8 oooooooooo  oooooooooo 
               8888o   888  888         888   888       888         888    888  888    888
               88 888o8 88   888oooooo  888ooo888        888oooooo  888oooo88   888oooo88 
               88  888  88          888 888   888               888 888  88o    888  88o  
              o88o  8  o88o o88oooo888 o888o o888o      o88oooo888 o888o  88o8 o888o  88o8
                "
                  hostnamectl
            ;;
        backup-config)
             echo "Msh Backup Config Started"
             read -rp "Do You Want To Continue?[y/n]" BCT
             if [ "$BCT" == "y" ]; then
             echo "Start Backup From All Tools"
             mkdir -p ~/Backuped
             cp -r ~/.bashrc ~/.bash_profile ~/.profile ~/.zshrc \
             ~/.gitconfig ~/.git-credentials \
             ~/.ssh \
             ~/.gnupg \
             ~/.config/kdeglobals \
             ~/.config/kwinrc \
             ~/.config/plasmarc \
             ~/.config/plasma-org.kde.plasma.desktop-appletsrc \
             ~/.config/kglobalshortcutsrc \
             ~/.config/ksmserverrc \
             ~/.config/dolphinrc \
             ~/.config/Code \
             ~/.vscode \
             ~/.config/nvim \
             ~/.vim \
             ~/.vimrc \
             ~/.mozilla/firefox \
             ~/.config/chromium \
             ~/.config/google-chrome \
             ~/.docker \
             ~/.config/fish \
             ~/.config/starship.toml \
             ~/Backuped
             else
             echo "Backup Stopped"
             fi
            ;;
            lynxctl)
             git clone https://github.com/MEHRAD111/LynxCTL.git
            ;;
            sysmanager)
             echo "Welcome to System Manager"
             echo "
             1.Default Kernel
             2.Update System
             3.Disk Usage
             4.Disk - All
             5.All info
             "
             read -rp ">>>" sysmgr
             case "$sysmgr" in
             1)
             uname -r
             ;;
             2)
             if [[ -f /usr/bin/pacman ]]; then
             echo "Founded PacMan On Your System"
             sudo pacman -Syu
             elif [[ -f /usr/bin/dnf ]]; then 
             echo "Founded DNF On Your System"
             sudo dnf update && sudo dnf Upgrade
             elif [[ -f /usr/bin/apt ]]; then
             echo "Founded APT On Your System"
             sudo apt update && sudo apt Upgrade
             elif [[ -f /usr/bin/zypper ]]; then
             echo "Founded Zypper On Your System"
             sudo zypper ref
             sudo zypper up
             sudo zypper dup
             fi
             ;;
             3)
             df -h
             ;;
             4)
             lsblk -f
             ;;
             5)
             uname -a
             ;;
             *)
             echo "
 oooooooo8                      oooo     oooo                                                                     
888       oooo   oooo oooooooo8  8888o   888   ooooooo   oo oooooo    ooooooo     oooooooo8 ooooooooo8 oo oooooo  
 888oooooo 888   888 888ooooooo  88 888o8 88   ooooo888   888   888   ooooo888  888    88o 888oooooo8   888    888
        888 888 888          888 88  888  88 888    888   888   888 888    888   888oo888o 888          888       
o88oooo888    8888   88oooooo88 o88o  8  o88o 88ooo88 8o o888o o888o 88ooo88 8o 888     888  88oooo888 o888o      
           o8o888                                                                888ooo888                        
             "
             echo "SysManager"
             esac

            ;;
        *)
            echo "Command not found: $command"
            
    esac
done
#End Of Msh