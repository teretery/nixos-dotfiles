{ config, pkgs, ... }:

{
  # --- ГРАФИЧЕСКАЯ ОБОЛОЧКА (KDE Plasma 6 + Wayland) ---
  services.xserver.enable = false; # Полное отключение X11 сессии
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # --- ЗВУК И ПЕЧАТЬ ---
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
