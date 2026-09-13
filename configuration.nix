{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system.nix
    ./modules/nvidia.nix
    ./modules/desktop.nix
    ./modules/users.nix
    ./modules/apps.nix
    ./modules/packages.nix
    ./modules/soundpad.nix
    ./modules/amneziavpn.nix
  ];

  # Базовая версия состояния системы. НЕ менять при обновлении пакетов.
  system.stateVersion = "26.05";
}
