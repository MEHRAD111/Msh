#!/bin/bash
#MPCos Installer V1
#Full Customize Installer
echo "
                                                                      
                    ▐▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▌                  
                    ▐ 1 Start MPCos Installer      ▌                  
                    ▐ 2 Start Msh                  ▌                  
                    ▐ 3 Open MshCustomInstaller    ▌                  
                    ▐ 4 Reboot                     ▌                  
                    ▐ 5 ShutDown                   ▌                  
                    ▐ 6 Edit BootCommands          ▌                  
                    ▐▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▌                  
                                                                      
     oooo     oooo oooooooooo    oooooooo8                            
      8888o   888   888    888 o888     88   ooooooo    oooooooo8     
      88 888o8 88   888oooo88  888         888     888 888ooooooo     
      88  888  88   888        888o     oo 888     888         888    
     o88o  8  o88o o888o        888oooo88    88ooo88   88oooooo88     
                                                                      "
read -p "Please Enter A Number : " number

case "$number" in
    1)
        echo "Starting MPCos Installer..."
        ;;
    2)
        echo "Starting Msh..."
        sudo bash MSH/MSH-Stable-2.sh
        ;;
    3)
        echo "Opening MshCustomInstaller..."
        read -p "Vim or Nano?" ide
        case "$ide" in
        vim)
        sudo vim custominstall.icf
        ;;
        nano)
        sudo nano custominstall.icf
        ;;
        esac
        ;;
    4)
        reboot
        ;;
    5)
        poweroff
        ;;
    6)
        nano BootCommands
        ;;
    *)
        echo "Invalid option!"
        ;;
esac

