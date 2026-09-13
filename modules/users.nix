{ config, pkgs, ... }:

{
  # --- НАСТРОЙКА FISH ---
  programs.fish = {
    enable = true;
    
    # Отключаем приветствие "Welcome to fish..."
    interactiveShellInit = ''
      set fish_greeting ""
    '';

    # Удобные сокращения для управления системой
    shellAliases = {
      # Умный rebuild: сохраняет твою текущую папку, идет в /etc/nixos, делает работу и возвращает обратно
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/";

      # Быстрое редактирование конфигов
      conf-main     = "sudo vim /etc/nixos/configuration.nix";
      conf-system   = "sudo vim /etc/nixos/modules/system.nix";
      conf-nvidia   = "sudo vim /etc/nixos/modules/nvidia.nix";
      conf-desktop  = "sudo vim /etc/nixos/modules/desktop.nix";
      conf-users    = "sudo vim /etc/nixos/modules/users.nix";
      conf-apps     = "sudo vim /etc/nixos/modules/apps.nix";
      conf-packages = "sudo vim /etc/nixos/modules/packages.nix";
      
      stopzerotier = "sudo systemctl stop zerotierone";
    };
  };

  # --- ПОЛЬЗОВАТЕЛИ ---
  users.users."teretery" = {
    isNormalUser = true;
    description = "teretery";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
    shell = pkgs.fish;
  };
}
