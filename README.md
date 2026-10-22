# Halo 2 Main Menu Theme Linux App Configs

Dark navy and steel-blue colors inspired by the Halo 2 main menu, for a GNOME desktop on Linux. Each section below is independent, so set up only the apps you use. Every step copies a file into place or changes one setting. Nothing needs a special launcher or a client mod.

## Getting started

```bash
git clone https://github.com/JamisonHunter/halo2-theme-configs.git
cd halo2-theme-configs
```

Run the commands in each section from inside this folder. Paths start with `~`, so they work for any username. Restart an app after changing it to see the new colors.

**Requirements:** GNOME 46 or newer and a terminal with true color support for the terminal apps. GNOME 46 (Ubuntu 24.04) needs a different accent color step, noted in section 1. The package commands use `pacman` (Arch Linux). On other distros, install the same package with your package manager (for example `sudo apt install` on Ubuntu).

**Before you start:** back up any of these config files you already have. Several steps overwrite a whole file, as noted in each section.

## Contents

1. [GNOME desktop](#1-gnome-desktop)
2. [Ghostty](#2-ghostty)
3. [VS Code / Code - OSS](#3-vs-code--code---oss)
4. [Arduino IDE 2](#4-arduino-ide-2)
5. [GNOME Text Editor](#5-gnome-text-editor-syntax-colors)
6. [Neovim and Vim](#6-neovim-and-vim)
7. [cava](#7-cava-audio-visualizer)
8. [spotify_player](#8-spotify_player-terminal-spotify-client)
9. [nano](#9-nano)
10. [fzf](#10-fzf)
11. [lsd](#11-lsd-ls-replacement)
12. [fastfetch](#12-fastfetch)
13. [mpv](#13-mpv-on-screen-display-only)
14. [Tilix](#14-tilix)
15. [GNOME Terminal](#15-gnome-terminal)
16. [neofetch](#16-neofetch)
17. [Blender](#17-blender)
18. [Brave / Chromium](#18-brave--chromium)
19. [aider](#19-aider)

## Palette

| Role | Color |
|---|---|
| Background | `#060b16` |
| Deep background (bars, sidebars) | `#04080f` |
| Raised surfaces (inputs, menus) | `#0a1322` |
| Borders | `#1b3354` |
| Selection | `#1d3d66` |
| Buttons | `#24578f` |
| Accent | `#7cc4ff` |
| Text | `#c4ddf7` |
| Bright text | `#e6f3ff` |
| Dim text | `#5d7799` |
| Strings / cyan | `#86def2` |
| Numbers / gold | `#d4b066` |
| Types / violet | `#b1a3f0` |
| Errors / red | `#e07a7f` |
| Green | `#82d6ad` |

---

## 1. GNOME desktop

### Apps (libadwaita / GTK4)
Covers Files, Settings, Calculator, Calendar, Text Editor's window, Papers and the other GNOME apps.
```bash
mkdir -p ~/.config/gtk-4.0
cp gnome/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
```

### Older GTK3 apps
Covers GPU Screen Recorder, Popsicle, Ventoy, Network Connections, IBus Preferences, Evince, and the menus and toolbars of LibreOffice and Audacity.
`settings.ini` makes GTK3 apps use their dark style, which the stylesheet builds on.
```bash
mkdir -p ~/.config/gtk-3.0
cp gnome/gtk-3.0/gtk.css gnome/gtk-3.0/settings.ini ~/.config/gtk-3.0/
```
If `~/.config/gtk-3.0/settings.ini` already exists, don't overwrite it. Add `gtk-application-prefer-dark-theme=1` under its `[Settings]` line instead.

### Top bar, panels and overview (GNOME Shell)
This needs the **User Themes** extension, which comes with the `gnome-shell-extensions` package.
```bash
sudo pacman -S --needed gnome-shell-extensions
mkdir -p ~/.themes/Halo2/gnome-shell
cp gnome/gnome-shell/gnome-shell.css ~/.themes/Halo2/gnome-shell/
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gsettings set org.gnome.shell.extensions.user-theme name 'Halo2'
```
On Wayland, log out and back in for the shell theme to load.

On Ubuntu, the package is `sudo apt install gnome-shell-extensions`. Without root access, install **User Themes** for your GNOME version from [extensions.gnome.org](https://extensions.gnome.org/extension/19/user-themes/) instead, then log out and back in before running the `gsettings set` line.

### Dark mode and blue accent
```bash
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface accent-color 'blue'
```
GNOME 46 doesn't have the `accent-color` setting. On Ubuntu 24.04, pick the blue Yaru theme instead:
```bash
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-blue-dark'
```

### Ubuntu Dock / Dash to Dock
The dock draws its own background over the shell theme. Set it to the Halo 2 navy:
```bash
gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color true
gsettings set org.gnome.shell.extensions.dash-to-dock background-color '#060b16'
```

### Wallpaper (optional)
```bash
mkdir -p ~/.local/share/backgrounds
cp gnome/halo2-menu.png ~/.local/share/backgrounds/
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/.local/share/backgrounds/halo2-menu.png"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/.local/share/backgrounds/halo2-menu.png"
```

---

## 2. Ghostty
```bash
mkdir -p ~/.config/ghostty/themes
cp ghostty/Halo2 ~/.config/ghostty/themes/Halo2
```
Then open your Ghostty config (`~/.config/ghostty/config`, or `config.ghostty` on newer versions). Replace any existing `theme =` line with these:
```
theme = Halo2
background-opacity = 0.94
window-theme = dark
```
`background-opacity` is optional. Leave it out for a solid background.

---

## 3. VS Code / Code - OSS
Install the packaged theme. Use `code` for VS Code or `code-oss` for Code - OSS:
```bash
code --install-extension vscode/halo2-menu-theme-1.0.0.vsix
```
Then open the theme picker (**Ctrl+K Ctrl+T**) and choose **Halo 2 Menu**. You can also add this to `settings.json`:
```json
"workbench.colorTheme": "Halo 2 Menu"
```
The unpacked extension is also in `vscode/halo2-menu-theme/` if you want to look at or edit the colors.

---

## 4. Arduino IDE 2
Arduino IDE 2 loads VS Code-style themes from its plugins folder. This copy adds colors for Arduino's own toolbar and output panel.
```bash
mkdir -p ~/.arduinoIDE/plugins
cp -r arduino-ide/halo2-menu-theme ~/.arduinoIDE/plugins/
```
Then add this to `~/.arduinoIDE/settings.json`, inside the `{ }`:
```json
"workbench.colorTheme": "Halo 2 Menu"
```
Or pick it from **File → Preferences → Settings → Color Theme**. This works with the Flatpak, AppImage and native builds, since they all use `~/.arduinoIDE`.

---

## 5. GNOME Text Editor (syntax colors)
```bash
mkdir -p ~/.local/share/gtksourceview-5/styles
cp gnome-text-editor/halo2.xml ~/.local/share/gtksourceview-5/styles/
gsettings set org.gnome.TextEditor style-scheme 'halo2'
```
You can also choose **Halo 2 Menu** from the scheme list in Text Editor's settings.

---

## 6. Neovim and Vim
**Overwrites:** `~/.config/nvim/init.lua` and `~/.vimrc`. If you already have either one, don't copy it. Add the `colorscheme halo2` and `termguicolors` lines from this repo's copy to your own file instead.
```bash
# Neovim
mkdir -p ~/.config/nvim/colors
cp vim-neovim/halo2.vim ~/.config/nvim/colors/
cp vim-neovim/init.lua ~/.config/nvim/init.lua

# Vim
mkdir -p ~/.vim/colors
cp vim-neovim/halo2.vim ~/.vim/colors/
cp vim-neovim/vimrc ~/.vimrc
```
These need a terminal with true color support. Ghostty has it.

---

## 7. cava (audio visualizer)
```bash
mkdir -p ~/.config/cava/themes
cp cava/halo2 ~/.config/cava/themes/
```
In `~/.config/cava/config`, under `[color]`, set:
```
theme = 'halo2'
```
(Change the commented `; theme = 'none'` line to that.) If `~/.config/cava/config` doesn't exist yet, run cava once to create it.

cava versions before 0.10 (Ubuntu 24.04 ships 0.7.4) don't support themes. Put the colors in the config directly instead. If your config already has a `[color]` section, paste the `gradient` lines from `cava/halo2` into it along with `gradient_count = 8`. If the config is empty or has no `[color]` section:
```bash
{ echo "[color]"; echo "gradient_count = 8"; grep '^gradient' cava/halo2; } >> ~/.config/cava/config
```

---

## 8. spotify_player (terminal Spotify client)
**Overwrites:** `~/.config/spotify-player/theme.toml`
```bash
mkdir -p ~/.config/spotify-player
cp spotify-player/theme.toml ~/.config/spotify-player/
```
In `~/.config/spotify-player/app.toml`, set:
```
theme = "halo2"
```

---

## 9. nano
**Overwrites:** `~/.config/nano/nanorc`
```bash
mkdir -p ~/.config/nano
cp nano/nanorc ~/.config/nano/
```
This also turns on nano's built-in syntax highlighting. If you'd rather not have it, delete the `include` line.

---

## 10. fzf
Add the color setting to the end of `~/.bashrc`, then open a new terminal:
```bash
cat fzf/fzf-colors.sh >> ~/.bashrc
```
For zsh, add it to `~/.zshrc` instead. For fish, use `set -Ux FZF_DEFAULT_OPTS "..."` with the same value.

---

## 11. lsd (`ls` replacement)
**Overwrites:** `~/.config/lsd/config.yaml` and `colors.yaml`. If you already have a `config.yaml`, add `color: theme: custom` to it instead of replacing it.
```bash
mkdir -p ~/.config/lsd
cp lsd/config.yaml lsd/colors.yaml ~/.config/lsd/
```

---

## 12. fastfetch
**Overwrites:** `~/.config/fastfetch/config.jsonc`. It sets the colors and lists fastfetch's default info modules. The list is required: a config without one shows only the logo.
```bash
mkdir -p ~/.config/fastfetch
cp fastfetch/config.jsonc ~/.config/fastfetch/
```

---

## 13. mpv (on-screen display only)
Changes mpv's on-screen text color, not subtitles.
```bash
mkdir -p ~/.config/mpv
cat mpv/mpv.conf >> ~/.config/mpv/mpv.conf
```
This appends to any existing `mpv.conf` instead of replacing it.

---

## 14. Tilix
This script adds a new **Halo 2** profile and makes it the default. Your other profiles stay as they are, and running it again updates the same profile.
```bash
./tilix/halo2-profile.sh
```
Tilix's window and menus get their colors from the GTK3 files in section 1. New terminals open with the Halo 2 profile. To switch an open terminal, click its title and choose **Profiles → Halo 2**.

To pick the colors yourself from Tilix's color scheme list instead, copy the scheme file:
```bash
mkdir -p ~/.config/tilix/schemes
cp tilix/Halo2.json ~/.config/tilix/schemes/
```
Then open **Preferences → Profiles → (your profile) → Color** and choose **Halo 2 Menu**.

---

## 15. GNOME Terminal
This script adds a new **Halo 2** profile and makes it the default. Your other profiles stay as they are.
```bash
./gnome-terminal/halo2-profile.sh
```
New windows use it. To switch an open one, use the menu: **Profile → Halo 2**.

---

## 16. neofetch
Appends the color settings to your existing config, so nothing else changes. If you don't have a config yet, run `neofetch` once to create it.
```bash
cat neofetch/halo2.conf >> ~/.config/neofetch/config.conf
```
neofetch uses the terminal's 16 palette colors rather than hex codes, so it looks right with the Halo 2 Ghostty, Tilix or GNOME Terminal theme.

---

## 17. Blender
Adds a **Halo2** theme preset. It was made with Blender 4.0. Change `4.0` in the path to your version (run `blender --version` to check).
```bash
mkdir -p ~/.config/blender/4.0/scripts/presets/interface_theme
cp blender/Halo2.xml ~/.config/blender/4.0/scripts/presets/interface_theme/
```
Then open **Edit → Preferences → Themes**, choose **Halo2** from the preset menu at the top, and save your preferences.

---

## 18. Brave / Chromium
A browser theme for Brave, and also Chromium and Google Chrome. The browser loads it from the folder you pick, so copy it somewhere it can stay:
```bash
mkdir -p ~/.local/share/halo2-brave-theme
cp brave/halo2-theme/manifest.json ~/.local/share/halo2-brave-theme/
```
**Flatpak Brave** can't read `~/.local/share`. Copy the theme into Brave's own Flatpak folder instead:
```bash
mkdir -p ~/.var/app/com.brave.Browser/halo2-brave-theme
cp brave/halo2-theme/manifest.json ~/.var/app/com.brave.Browser/halo2-brave-theme/
```
Then:
1. Go to `brave://extensions` (or `chrome://extensions`).
2. Turn on **Developer mode** in the top right corner.
3. Click **Load unpacked** and choose the folder you copied the theme to. Press **Ctrl+H** in the file picker to show hidden folders like `.local` and `.var`, or press **Ctrl+L** and type the path.
4. In Brave, go to `brave://settings/appearance` and set **Brave colors** to **Dark**.

To remove it, go to **Settings → Appearance** and click **Reset to default** next to the theme.

---

## 19. aider
aider's default code theme draws code blocks and edits on a white background. This adds a `halo2` Pygments style and sets aider's text colors. Install the style into aider's environment (this assumes you installed aider with `uv tool`; `--with` keeps it there through `uv tool upgrade`):
```bash
uv tool install --force --python 3.12 aider-chat --with pip --with ./aider/pygments-halo2
```
Then copy the config. This overwrites `~/.aider.conf.yml`, so if you already have one, add the lines from `aider/aider.conf.yml` to it instead:
```bash
cp aider/aider.conf.yml ~/.aider.conf.yml
```
Don't pass `--dark-mode` or `--light-mode`. Those flags replace these colors with aider's built-in ones.

---

## Undoing it
Delete the files you copied and reset the settings you changed. For example:
```bash
rm ~/.config/gtk-4.0/gtk.css ~/.config/gtk-3.0/gtk.css ~/.config/gtk-3.0/settings.ini
gsettings reset org.gnome.shell.extensions.user-theme name
gsettings reset org.gnome.desktop.interface accent-color
gsettings reset org.gnome.TextEditor style-scheme
gsettings reset org.gnome.desktop.interface gtk-theme
gsettings reset org.gnome.shell.extensions.dash-to-dock custom-background-color
```
For Tilix and GNOME Terminal, choose a different default profile in Preferences and delete the **Halo 2** profile there.
Then remove or change the `theme` lines you edited in each app's config.

---

*Fan-made project. Not affiliated with or endorsed by Microsoft, Xbox Game Studios, Halo Studios or Bungie. Halo is a trademark of Microsoft Corporation.*
