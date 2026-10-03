# dots

Personal Linux desktop configuration built around **dwm**, **dmenu**, **slstatus**, **Alacritty**, **Neovim**, and **Picom**.

Designed for a minimal, keyboard-driven X11 desktop on:

* Arch Linux
* Void Linux
* Void Linux with runit

> These are personal dotfiles. They are opinionated and primarily intended for my own machines, but the configuration is kept simple enough to reuse.

---

## Stack

| Component                                        | Purpose               |
| ------------------------------------------------ | --------------------- |
| [dwm](https://dwm.suckless.org/)                 | Window manager        |
| [dmenu](https://tools.suckless.org/dmenu/)       | Application launcher  |
| [slstatus](https://tools.suckless.org/slstatus/) | Status bar            |
| [Alacritty](https://alacritty.org/)              | Terminal              |
| [Neovim](https://neovim.io/)                     | Editor                |
| [Picom](https://github.com/yshui/picom)          | X11 compositor        |
| Xorg                                             | Display server        |
| JetBrainsMono Nerd Font                          | Primary font          |
| lazy.nvim                                        | Neovim plugin manager |

---

## Features

* Minimal X11 desktop
* dwm tiling window manager
* 18px inner/outer gaps
* Three layouts:

  * Tiled
  * Floating
  * Monocle
* Super/Windows key as dwm modifier
* dmenu application launcher
* CPU, RAM, date and time status
* Alacritty terminal
* Dark monochrome + amber accent palette
* Picom shadows
* Picom fading
* Background blur
* No rounded window corners
* Neovim with lazy.nvim
* Neo-tree file manager
* Colorizer
* `matte-black` Neovim colorscheme

---

## Screenshots

Add screenshots here when the rice is finished.

```text
screenshots/
├── desktop.png
├── terminal.png
├── nvim.png
└── dmenu.png
```

---

## Repository

```text
dots/
├── alacritty/
│   └── alacritty.toml
├── dmenu/
│   └── config.h
├── dwm/
│   └── config.h
├── nvim/
│   └── init.lua
├── picom/
│   └── picom.conf
├── slstatus-master/
│   └── config.h
├── INSTALL.md
└── README.md
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/gokayama/dots.git
cd dots
```

Choose your distribution:

### Arch Linux

See [INSTALL.md](INSTALL.md#arch-linux).

### Void Linux

See [INSTALL.md](INSTALL.md#void-linux).

### Void Linux + runit

See [INSTALL.md](INSTALL.md#void-linux-runit).

---

## Configuration

### dwm

The dwm configuration is located at:

```text
dwm/config.h
```

Current configuration:

```text
Border:       1px
Gaps:         18px
Master size:  55%
Master count: 1
Bar:          Top
Modifier:     Super
Font:         JetBrainsMono Nerd Font Mono
```

Layouts:

```text
[]=
><>
[M]
```

The default layout is tiled.

### dmenu

dmenu uses:

```text
Font: Mononoki 14
Position: Top
```

The configuration is located at:

```text
dmenu/config.h
```

### slstatus

The status bar displays:

```text
CPU | RAM | DATE | TIME
```

Example:

```text
 12% |  34% |  02/10/2026 |  21:44
```

Configuration:

```text
slstatus-master/config.h
```

### Alacritty

Configuration:

```text
alacritty/alacritty.toml
```

The terminal uses JetBrainsMono Nerd Font Mono and a dark palette with amber/red accents.

### Picom

Configuration:

```text
picom/picom.conf
```

Enabled effects include:

* GLX backend
* VSync
* Shadows
* Fading
* Background blur
* Damage tracking
* Unredirect optimization

Rounded corners are disabled.

### Neovim

Configuration:

```text
nvim/init.lua
```

Plugins are managed by `lazy.nvim`.

Current plugins include:

* `nvim-web-devicons`
* `neo-tree.nvim`
* `plenary.nvim`
* `nui.nvim`
* `nvim-colorizer.lua`

Colorscheme:

```text
matte-black
```

---

## Keybindings

The dwm modifier is:

```text
Super
```

### Applications

| Key             | Action    |
| --------------- | --------- |
| `Super + Space` | dmenu     |
| `Super + Enter` | Alacritty |

### Windows

| Key                     | Action                |
| ----------------------- | --------------------- |
| `Super + j`             | Focus next window     |
| `Super + k`             | Focus previous window |
| `Super + w`             | Close window          |
| `Super + Space`         | dmenu / launcher      |
| `Super + Shift + Space` | Toggle floating       |
| `Super + z`             | Zoom / promote window |

### Layouts

| Key         | Layout   |
| ----------- | -------- |
| `Super + t` | Tiled    |
| `Super + f` | Floating |
| `Super + m` | Monocle  |

### Master area

| Key         | Action                |
| ----------- | --------------------- |
| `Super + i` | Increase master count |
| `Super + d` | Decrease master count |
| `Super + h` | Shrink master area    |
| `Super + l` | Grow master area      |

### Tags

| Key                           | Action                |
| ----------------------------- | --------------------- |
| `Super + 1..9`                | View tag              |
| `Super + Ctrl + 1..9`         | Toggle tag visibility |
| `Super + Shift + 1..9`        | Move window to tag    |
| `Super + Ctrl + Shift + 1..9` | Toggle window tag     |

### Monitors

| Key                 | Action                          |
| ------------------- | ------------------------------- |
| `Super + ,`         | Previous monitor                |
| `Super + .`         | Next monitor                    |
| `Super + Shift + ,` | Move window to previous monitor |
| `Super + Shift + .` | Move window to next monitor     |

### Session

| Key                 | Action   |
| ------------------- | -------- |
| `Super + Shift + q` | Quit dwm |

---

## Starting dwm

The intended session is X11 + `startx`.

Create:

```text
~/.xinitrc
```

and start dwm from it.

Example:

```sh
picom &
slstatus &
exec dwm
```

Then:

```bash
startx
```

For a minimal setup, a display manager is not required.

---

## Philosophy

The goal of this repository is simple:

```text
minimal
fast
keyboard-driven
predictable
easy to rebuild
```

No desktop environment is required.

The desktop is composed from individual programs instead of one large desktop environment.

---

## Updating

Pull the latest configuration:

```bash
cd ~/dots
git pull
```

After changing a suckless configuration, rebuild it:

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

Restart the affected program after rebuilding.

---

## Important

These configurations are designed around X11.

They are **not Wayland configurations**.

Hardware-specific configuration such as:

* NVIDIA driver configuration
* filesystem mounts
* `/etc/fstab`
* kernel parameters
* bootloader configuration
* machine-specific services

should not be copied blindly from this repository.

---

## License

Configuration files are provided as-is.

Individual projects included or referenced by this repository retain their respective licenses.
