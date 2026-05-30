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
"firewall"
"MPC Defender"
"MPC_UFW_E"
"MpcDesktopDefender"
"vim support"
"MPC_DESKTOP"
"hardware support (Intel/AMD/NVIDIA)"
"display system"
"root account"
)

for s in "${services[@]}"; do
    echo "start $s"
    sleep 1
done

echo "System ready."
sleep 5

echo "MPCos is ready to use!"

# =========================
# Main Shell Loop
# =========================
while true; do
    read -rp "(MPCos|Msh)> " command args

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
        git clone -b Rolling-Release https://github.com/MEHRAD111/Msh.git
        git fetch origin
        pwd
        cd Msh
        ls
        ;;
        guide)
        echo "If you not clone the Msh,please run [msh-refresh] first"
        cd Msh
        cat MSH-CRR-Guide.txt
        ;;
        information-full)
        MPCos with Msh CRR 2026530
        Github branch rolling-release
        MshCenter v2
        26 commands are available
        Release URL:github.com/MEHRAD111

           ;;
        version)
        MPCos MSH CRR 2026.5.29
        ;;
        mshcenter)
        echo "
███╗   ███╗███████╗██╗  ██╗     ██████╗███████╗███╗   ██╗████████╗███████╗██████╗     ██╗   ██╗██████╗ 
████╗ ████║██╔════╝██║  ██║    ██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔════╝██╔══██╗    ██║   ██║╚════██╗
██╔████╔██║███████╗███████║    ██║     █████╗  ██╔██╗ ██║   ██║   █████╗  ██████╔╝    ██║   ██║ █████╔╝
██║╚██╔╝██║╚════██║██╔══██║    ██║     ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗    ╚██╗ ██╔╝██╔═══╝ 
██║ ╚═╝ ██║███████║██║  ██║    ╚██████╗███████╗██║ ╚████║   ██║   ███████╗██║  ██║     ╚████╔╝ ███████╗
╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝     ╚═════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝      ╚═══╝  ╚══════╝
            "
            echo "MSh Center is msh updater.it's work with git for downloads update"
            echo "Commands:msh-refreh"
    ;;
        *)
            echo "Command not found: $command"
            ;;
    esac

done