{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations.sitranto-machine = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
