# Halo 2 Main Menu Theme Linux App Configs

Dark navy and steel-blue colors inspired by the Halo 2 main menu, for a GNOME desktop on Arch Linux. Each section below is independent, so set up only the apps the laptop has. Every step copies a file into place or changes one setting. Nothing needs a special launcher or a client mod.

Run the commands from inside this folder (`cd halo2-theme`). Paths start with `~`, so they work for any username. Restart an app after changing it to see the new colors.

**Before you start:** if the laptop already has any of these config files, back them up first. Several steps overwrite a whole file, as noted in each section.

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

### Dark mode and blue accent
```bash
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface accent-color 'blue'
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
**Overwrites:** `~/.config/nvim/init.lua` and `~/.vimrc`. If you already have either one, don't copy it. Add the `colorscheme halo2` and `termguicolors` lines from this folder's copy to your own file instead.
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

## Apps that already match
- **Terminal apps** like htop, `ls`, git and less get their colors from Ghostty.
- **GNOME apps** get theirs from the GTK files in section 1.

## Skipped on purpose
- **Discord, Spotify, Steam:** need client mods.
- **Mullvad Browser and Tor Browser:** customizing them makes you easier to fingerprint.
- **OpenSCAD:** its Snap needs a custom launcher.
- **Signal, PrusaSlicer and similar:** only offer built-in light/dark themes.

## Undoing it
Delete the files you copied and reset the settings you changed. For example:
```bash
rm ~/.config/gtk-4.0/gtk.css ~/.config/gtk-3.0/gtk.css ~/.config/gtk-3.0/settings.ini
gsettings reset org.gnome.shell.extensions.user-theme name
gsettings reset org.gnome.desktop.interface accent-color
gsettings reset org.gnome.TextEditor style-scheme
```
Then remove or change the `theme` lines you edited in each app's config.
