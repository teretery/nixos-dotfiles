{
  description = "Моя системная конфигурация с поддержкой Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pipewire-soundpad = {
      url = "path:/home/teretery/pipewire-soundpad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, spicetify-nix, helium, pipewire-soundpad, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      
      # Передаем inputs во все модули
      specialArgs = { inherit inputs; }; 
      
      modules = [
        # Импортируем сам модуль spicetify напрямую из inputs:
        spicetify-nix.nixosModules.default

        ./hardware-configuration.nix
        ./configuration.nix
      ];
    };
  };
}
