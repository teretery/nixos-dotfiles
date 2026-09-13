{ pkgs, ... }:

{
  # --- СИСТЕМНАЯ ЗАГРУЗКА И ЯДРО ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.blacklistedKernelModules = [ "uvcvideo" ];

  boot.kernel.sysctl = {
    "net.ipv4.ip_default_ttl" = 65; # Фиксация ttl для обхода раздачи
  };

  # --- СЕТЬ И ЛОКАЛИЗАЦИЯ ---
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking = {
    resolvconf.enable = false;
    networkmanager.dns = "none";
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
  };

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # --- ОЧИСТКА СИСТЕМЫ ---
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };
  
  # CUDA кеш (что бы не билдить с нуля)
  nix.settings = {
    substituters = [ "https://cache.nixos-cuda.org" ];
    trusted-public-keys = [ "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M=" ];
  };


  # --- ХАРАКТЕРИСТИКИ NIX ---
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
