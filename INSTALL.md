# Installation

Complete installation instructions for the `dots` configuration.

Supported systems:

* Arch Linux
* Void Linux
* Void Linux + runit

The configuration is built around an X11 session running:

```text
Xorg
 └── dwm
      ├── dmenu
      ├── slstatus
      ├── Alacritty
      └── Picom
```

---

# Arch Linux

## 1. Update the system

```bash
sudo pacman -Syu
```

---

## 2. Install the base desktop dependencies

```bash
sudo pacman -S \
    xorg-server \
    xorg-xinit \
    xorg-xrandr \
    xorg-xsetroot \
    libx11 \
    libxft \
    libxinerama \
    freetype2 \
    fontconfig \
    base-devel \
    git
```

---

## 3. Install the desktop applications

```bash
sudo pacman -S \
    alacritty \
    neovim \
    picom
```

dwm, dmenu and slstatus are built from source from this repository.

---

## 4. Install fonts

Install a Nerd Font that provides the configured glyphs.

For example:

```bash
sudo pacman -S ttf-jetbrains-mono-nerd
```

The dwm and Alacritty configurations use:

```text
JetBrainsMono Nerd Font Mono
```

The dmenu configuration currently uses:

```text
Mononoki
```

Install Mononoki separately if it is not already available on your system.

Verify fonts:

```bash
fc-list | grep -i "JetBrains"
fc-list | grep -i "Mononoki"
```

---

## 5. Clone the repository

```bash
git clone https://github.com/gokayama/dots.git ~/dots
cd ~/dots
```

---

## 6. Build dwm

```bash
cd ~/dots/dwm
sudo make clean install
```

Test:

```bash
dwm
```

---

## 7. Build dmenu

```bash
cd ~/dots/dmenu
sudo make clean install
```

Test:

```bash
dmenu_run
```

---

## 8. Build slstatus

```bash
cd ~/dots/slstatus-master
sudo make clean install
```

Test:

```bash
slstatus
```

---

## 9. Install Alacritty

Create the configuration directory:

```bash
mkdir -p ~/.config/alacritty
```

Copy the configuration:

```bash
cp ~/dots/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
```

---

## 10. Install Picom

Create the configuration directory:

```bash
mkdir -p ~/.config/picom
```

Copy:

```bash
cp ~/dots/picom/picom.conf ~/.config/picom/picom.conf
```

Test:

```bash
picom --config ~/.config/picom/picom.conf
```

---

## 11. Install Neovim

Copy the configuration:

```bash
mkdir -p ~/.config/nvim
cp ~/dots/nvim/init.lua ~/.config/nvim/init.lua
```

Start:

```bash
nvim
```

`lazy.nvim` will bootstrap itself and install the configured plugins.

---

## 12. Configure Xinit

Create:

```bash
nvim ~/.xinitrc
```

Use:

```sh
picom &
slstatus &
exec dwm
```

Start the session:

```bash
startx
```

---

# Void Linux

Void uses XBPS instead of `pacman`.

---

## 1. Update repositories

```bash
sudo xbps-install -Syu
```

---

## 2. Install X11 and build dependencies

```bash
sudo xbps-install -S \
    xorg \
    xinit \
    libX11-devel \
    libXft-devel \
    libXinerama-devel \
    freetype-devel \
    fontconfig-devel \
    base-devel \
    git
```

If a package name differs on your Void installation, search with:

```bash
xbps-query -Rs <package>
```

---

## 3. Install applications

```bash
sudo xbps-install -S \
    alacritty \
    neovim \
    picom
```

---

## 4. Fonts

Install or manually place the fonts required by the configuration.

Verify:

```bash
fc-list | grep -i "JetBrains"
fc-list | grep -i "Mononoki"
```

If installing a font manually:

```bash
mkdir -p ~/.local/share/fonts
```

Place the font files there and refresh:

```bash
fc-cache -fv
```

---

## 5. Clone the repository

```bash
git clone https://github.com/gokayama/dots.git ~/dots
```

---

## 6. Build dwm

```bash
cd ~/dots/dwm
sudo make clean install
```

---

## 7. Build dmenu

```bash
cd ~/dots/dmenu
sudo make clean install
```

---

## 8. Build slstatus

```bash
cd ~/dots/slstatus-master
sudo make clean install
```

---

## 9. Install user configurations

```bash
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/picom
mkdir -p ~/.config/nvim

cp ~/dots/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
cp ~/dots/picom/picom.conf ~/.config/picom/picom.conf
cp ~/dots/nvim/init.lua ~/.config/nvim/init.lua
```

---

## 10. Configure Xinit

```bash
nvim ~/.xinitrc
```

Use:

```sh
picom &
slstatus &
exec dwm
```

Start:

```bash
startx
```

---

# Void Linux + runit

Void uses **runit** for service supervision.

Unlike a systemd-based distribution, services are controlled through `/etc/sv` and `/var/service`.

---

## Networking

Check available services:

```bash
ls /etc/sv
```

For example, if using `dhcpcd`:

```bash
sudo ln -s /etc/sv/dhcpcd /var/service/
```

Check:

```bash
sv status dhcpcd
```

---

## PipeWire

Install the audio stack:

```bash
sudo xbps-install -S \
    pipewire \
    wireplumber \
    alsa-pipewire
```

User-level PipeWire services should be started in the user session rather than treated as normal system services.

Verify:

```bash
pactl info
```

and:

```bash
wpctl status
```

---

## GameMode

Install:

```bash
sudo xbps-install -S gamemode
```

Test:

```bash
gamemoded -t
```

Check:

```bash
gamemoded -s
```

Games can use:

```bash
gamemoderun %command%
```

in Steam launch options.

---

## Runit service management

Enable a service:

```bash
sudo ln -s /etc/sv/SERVICE /var/service/
```

Check:

```bash
sv status SERVICE
```

Stop:

```bash
sudo sv down SERVICE
```

Start:

```bash
sudo sv up SERVICE
```

Restart:

```bash
sudo sv restart SERVICE
```

Disable:

```bash
sudo rm /var/service/SERVICE
```

---

# X11 Session

This configuration intentionally does not require a display manager.

The simplest session is:

```text
login
  ↓
startx
  ↓
.xinitrc
  ↓
picom
  ↓
slstatus
  ↓
dwm
```

Create:

```bash
nvim ~/.xinitrc
```

Configuration:

```sh
picom &
slstatus &
exec dwm
```

Then:

```bash
startx
```

---

# Troubleshooting

## dwm does not compile

Check the X11 development libraries.

Arch:

```bash
sudo pacman -S base-devel libx11 libxft libxinerama
```

Void:

```bash
sudo xbps-install -S base-devel libX11-devel libXft-devel libXinerama-devel
```

Then:

```bash
make clean
make
```

---

## Font does not work

Check:

```bash
fc-list | grep -i "JetBrains"
```

and:

```bash
fc-list | grep -i "Mononoki"
```

Refresh the font cache:

```bash
fc-cache -fv
```

---

## dmenu does not start

Check:

```bash
which dmenu_run
```

Then:

```bash
dmenu_run
```

If it works manually but not from dwm, rebuild dwm after installing dmenu:

```bash
cd ~/dots/dwm
sudo make clean install
```

---

## Picom fails to start

Run it manually:

```bash
picom --config ~/.config/picom/picom.conf
```

Check the compositor backend and X11 environment.

---

## slstatus does not appear

Run:

```bash
slstatus
```

Then inspect the X session:

```bash
echo $DISPLAY
```

It should contain something like:

```text
:0
```

---

## Neovim plugins are missing

Start:

```bash
nvim
```

Then inside Neovim:

```vim
:Lazy
```

If necessary:

```vim
:Lazy sync
```

---

# Rebuilding After Configuration Changes

Suckless programs compile their configuration into the binary.

After editing:

```text
dwm/config.h
```

run:

```bash
cd ~/dots/dwm
sudo make clean install
```

For dmenu:

```bash
cd ~/dots/dmenu
sudo make clean install
```

For slstatus:

```bash
cd ~/dots/slstatus-master
sudo make clean install
```

Then restart the program.

---

# Updating the Dotfiles

```bash
cd ~/dots
git pull
```

Review changes before overwriting local configurations:

```bash
git diff
```

---

# Clean Installation Checklist

After installing a new system:

```text
[ ] Xorg
[ ] Xinit
[ ] X11 development libraries
[ ] Git
[ ] Base build tools
[ ] JetBrainsMono Nerd Font
[ ] Mononoki
[ ] Alacritty
[ ] Neovim
[ ] Picom
[ ] dwm
[ ] dmenu
[ ] slstatus
[ ] .xinitrc
[ ] PipeWire
[ ] WirePlumber
[ ] Network service
[ ] GameMode
```

Then:

```bash
startx
```

---

# Architecture

The configuration intentionally keeps responsibilities separate:

```text
                Xorg
                 │
                 ▼
                dwm
          ┌──────┼──────┐
          │      │      │
       dmenu  slstatus picom
          │
          ▼
       programs
          │
     ┌────┴────┐
     ▼         ▼
 Alacritty    Neovim
```

System services remain outside the dotfiles repository.

Void-specific service management remains under runit.

User configuration remains under `$HOME`.

Suckless source configuration remains inside each respective source directory.

---

# Notes

This repository contains configuration, not a complete operating-system installation.

Distribution-specific system configuration should be kept separate from these dotfiles.

In particular, do not blindly copy:

```text
/etc/fstab
/etc/sv/
bootloader configuration
kernel parameters
GPU configuration
machine-specific mounts
```

between machines.
