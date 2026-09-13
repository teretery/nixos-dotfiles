{ pkgs, inputs, ... }:

{
  # --- СИСТЕМНЫЕ СЛУЖБЫ ---
  services.zerotierone.enable = true;
  services.flatpak.enable = true;

  # --- ВИРТУАЛИЗАЦИЯ ---
  virtualisation.waydroid.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables;
  virtualisation.libvirtd.enable = true;

  # --- НАСТРОЙКА ПРОГРАММ (Через модули) ---
  programs.virt-manager.enable = true;   
  programs.steam.enable = true;
  programs.throne.enable = true;
  programs.throne.tunMode.enable = true;
  programs.kdeconnect.enable = true;
  
  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  virtualisation.docker = {
    enable = true;
  };

  # --- SPICETIFY ---
  programs.spicetify =
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
  {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
    ];

    theme = spicePkgs.themes.catppuccin;
  };

  # --- SUNSHINE ---
  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
  };
  
  services.sunshine.package = pkgs.sunshine.override {
    cudaSupport = true;
    cudaPackages = pkgs.cudaPackages;
  };
  
  # --- СИСТЕМНЫЕ ПАКЕТЫ ---
  environment.systemPackages = with pkgs; [ 
    cudatoolkit 
    wineWow64Packages.stableFull 
    wine 
    (wine.override { wineBuild = "wine64"; }) 
    wine64 
    wineWow64Packages.staging 
    winetricks 
    wineWow64Packages.waylandFull 
  ];
}
