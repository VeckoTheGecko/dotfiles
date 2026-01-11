# dotfiles

My dotfiles - using Nix for package management (for *nix systems), but also contains
NixOS configuration files.

## Getting started

### 1. Clone down and cd in

```
git clone ... ~/dotfiles
cd ~/dotfiles
```

### 2. Install

If on Mac:
- [install Nix](https://nixos.org/download/)
- `home-manager switch --flake .#macbook`

(first time might need `nix run home-manager/release-25.11 -- switch --flake .#macbook`)

If on NixOS ([install](https://nixos.org/download/#nix-install-linux)):
- `sudo nixos rebuild switch --flake .#nixos`


tmp measure:
- `cp -r ~/dotiles/nvim ~/.config/nvim`. This is for now until home manager is configured with nvim

### 3. macOS-specific setup

For macOS users, set up automatic work hour tracking:

```bash
# Copy Launch Agent to enable automatic tracking on startup
cp ~/dotfiles/hosts/macbook/com.hodgs004.screenlockmonitor.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/com.hodgs004.screenlockmonitor.plist

# View your work hours
~/dotfiles/scripts/parse-work-hours.py
```

See `hosts/macbook/README.md` for details.

### 4. Other commands

- `make clean` - clean up home manager cache
- `make format` - format nix files

## Resources


- [Ultimate Nix flakes guide | Vimjoyer](https://yewtu.be/watch?v=JCeYq72Sko0)
- [Nix Wiki on Flakes](https://wiki.nixos.org/wiki/Flakes)

- [Setting up Wezterm terminal multiplexing](https://www.florianbellmann.com/blog/switch-from-tmux-to-wezterm)
https://discourse.nixos.org/t/boot-partition-is-too-small-and-becoming-full/32194/10

