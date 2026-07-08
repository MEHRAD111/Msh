# MPCos Installer V1 | User Guide

## Let's Get Started!

---

### 1. Run the Installer

Open a terminal and run:

```bash
sudo bash install.sh
```

Then choose one of the following options:

```
1. Start MPCos Installer (TUI)
2. Start MSH
3. MSH Custom Installer
4. Reboot
5. Shut Down
6. Edit Boot Commands
```

---

## 1. Start MPCos Installer (TUI)

Launches the Text User Interface (TUI) installer for MPCos.

---

## 2. Start MSH

Selecting option **2** starts the stable version of **MSH**, allowing you to use all standard MSH features.

---

## 3. MSH Custom Installer

This option is intended for advanced users.

Instead of using the graphical installer, you can create a configuration file that gives you full control over the installation process.

Example configuration (`config.icf`):

```icf
{
    "@name"        : "$mehrad";
    "@pc-name"     : "$mehradpc-mpcos";
    "@pkg"         : "$default";
    "@desktop"     : "$kde-plasma";
    "@other-pkg"   : "$[elisa, sl, neofetch]";
    "@boot"        : "$refind";

    "@installon"   : "!/dev/sda ؟(ffs)";
    "@swapon"      : "!/dev/sda ؟(16GiB)؟(ffs)";
    "@efion"       : "!/dev/sda ؟(1GiB)؟(ffs)";

    "@/": [
        "@/home>>/dev/sdb1"
    ];
}
```

The Custom Installer parses this file and automatically installs and configures MPCos based on the options you specify.

---

## 4. Reboot

Restarts your computer.

---

## 5. Shut Down

Powers off your computer.

---

## 6. Edit Boot Commands

Allows you to edit the boot commands used by MPCos before startup.
Here is a simple boot commands:
{
title = "MPCos Stable"
boot = !/dev/sdb1
initd = !/dev/sdb1/boot/initrd.os
kernel = !/dev/sdb1/kernel/kernel-8.kre
plymouth = on
/\services = all
on-services = all>libvirtd
rescue = yes
emergency = no
chainloader = no
sleep = 0

}





