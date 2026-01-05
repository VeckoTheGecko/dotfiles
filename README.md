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

If on NixOS ([install](https://nixos.org/download/#nix-install-linux)):
- Symlink OS config into right place `sudo ln -s ~/dotfiles/nixos /etc/nixos`
- `sudo nixos rebuild switch`


tmp measure:
- `ln -s ~/dotiles/nvim ~/.config/nvim`. This is for now until home manager is configured with nvim

Install packages and dotfiles:

```
nix run home-manager/release-25.11 -- switch --flake .#home
```

This will run home manager in an isolated environment, which will be used to install
the rest of the packages and dotfiles on the system. The resulting installation will
have home manager available.

### 3. Common commands

- `make` - run home manager to apply changes
- `make clean` - clean up home manager cache
- `make format` - format nix files

# Resources


- [Ultimate Nix flakes guide | Vimjoyer](https://yewtu.be/watch?v=JCeYq72Sko0)
- [Nix Wiki on Flakes](https://wiki.nixos.org/wiki/Flakes)

