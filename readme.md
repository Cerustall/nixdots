# Nixdots
The setup that I use on all of my devices, managed declaratively with Nix!

## Usage

Mac (Apple Silicon, nix-darwin):
```
  $ git clone https://github.com/Cerustall/nixdots
  $ cd nixdots
  $ sudo darwin-rebuild switch --flake .
```

NixOS:
```
  $ git clone https://github.com/Cerustall/nixdots
  $ cd nixdots
  $ sudo nixos-rebuild switch --flake .
```
Note: This will not work right now! There is no config for NixOS yet.

nix-run:
```
  $ nix run github:Cerustall/nixdots
```

Unfinished though usable in its current state. Suggestions welcome!

## Roadmap:
- [x] Basic readme
- [x] Set up term/devtools
- [x] Set up Yabai/SKHD
- [ ] Helix LSPs
- [x] Config for Mac
- [ ] Config for desktop
- [ ] Config for Raspberry Pi
- [ ] Multiple colourschemes
