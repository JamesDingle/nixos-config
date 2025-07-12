# James' NixOS Config

Started trying NixOS July 2025 and as of today (12th July) this is my first attempt at a fully modular Flake based NixOS setup. This will gradually grow with me over time as I explore different

### Useful snippets

Since I am new to NixOS I am using this to store some useful commands so I don't forget them and have to keep searching my shell history.


`sudo nixos-rebuild --flake .#tiamat dry-run`

`sudo nixos-rebuild --flake .#tiamat switch`

`nix flake update --flake .`
