# Nixdots
The setup that I use on all of my devices, managed declaratively with Nix.
Unfinished though usable in its current state. Suggestions welcome!

## Usage

Nix Darwin (Mac/Apple Silicon):
```
  $ git clone https://github.com/Cerustall/nixdots
  $ cd nixdots
  $ sudo darwin-rebuild switch --flake .#osx
```

NixOS:
```
  $ git clone https://github.com/Cerustall/nixdots
  $ cd nixdots
  $ sudo nixos-rebuild switch --flake .#desktop
```
Note: This will not work right now as there is no config for NixOS yet.

nix-run:
```
  $ nix run github:Cerustall/nixdots
```
If you change networking.hostname for whichever platform you use, make sure your rebuild command reflects it:
```
  sudo darwin-rebuild switch --flake .#${your-new-hostname}
  //
  sudo nixos-rebuild switch --flake .#${your-new-hostname}
```


## Roadmap:
- [x] Basic readme
- [x] Set up term/devtools
- [x] Set up Yabai/SKHD
- [ ] Helix LSPs
- [x] Config for Mac
- [ ] Config for desktop
- [ ] Set up hypr tools
- [ ] Config for Raspberry Pi
- [ ] Multiple colourschemes
