# MshInstaller
## PREVIEW
### Full Manual | COURSE TO LEARN
#### 1.Clone And Run It:
For First Time,Just Clone The Msh And Switch To installer:
```Bash
#GIT is ready
git clone https://github.com/MEHRAD111/Msh.git
#Switch To Installer
git switch Installer
#Open The Folder
cd MshInstall
#Open The.sh
sudo bash install.sh
```
#### 2.Use The Options
When you run it,you can choose 6 options:
1.For Open The TUI Installer **(Preview)**
2.Start **MSH** Stable
3.Open A **ICF** File To Put Installation Options **(Only Advanced Users)**
4.Reboot
5.ShutDown
6.Edit BootCommands **(Preview)**
#### 3.Work With ICF Files:
In These Files,We can put some options for install MSH.Look at this Codes:
{
"@username":"$Mehrad";
"@hostname":"$dhpcc5";
"@desktop":"$kde-plasma";
"@pkg":"$default";
"@other-pkgs":$[sl, git];
"@shell":"$zsh";
"@target":$[dev, graphical];
"@boot":"$refind";
(disks[
%installon : !/dev/sdX;
%efion : ?(1Gib)?(ffs);
%swapon : ?(16Gib)?(ffs);
%kernel : !/default;
%initd : !/default
])

}
***
#### 4.Work With BootCoomands
When You Choose 4,Nano Will Open For You,Here Is A Simple Code For BootCommands(BCM):
{
kernel = !/dev/sdX/kernel/kernel-8.kre
initd = !/dev/sdX/initd/init.d4o.os
plymouth = no
services = all>libvirtd
rescue = no
emergency = never
sleep = 0
}
***
### MSHINSTALLER
#### MIT


