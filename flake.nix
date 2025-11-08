{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      sitranto-machine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

	modules = [
          ./hosts/sitranto-machine

	  home-manager.nixosModules.home-manager 
	  {
	    home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.sitranto = import ./home;
	  }
	];
      };

      vm-arm = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        
        modules = [
           ./hosts/vm-arm

           home-manager.nixosModules.home-manager
           {
	     home-manager.useGlobalPkgs = true;
	     home-manager.useUserPackages = true;

	     home-manager.extraSpecialArgs = inputs;
	     home-manager.users.alice = import ./home;
           }
        ];
      };
    };
  };
}
