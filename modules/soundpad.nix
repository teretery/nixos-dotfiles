{ pkgs, inputs, ... }:

let
  pwsp = inputs.pipewire-soundpad.packages.${pkgs.system}.default;

  desktopItem = pkgs.makeDesktopItem {
    name = "pwsp-gui";
    desktopName = "PipeWire Soundpad";
    comment = "PipeWire soundpad audio engine and GUI";
    exec = "${pwsp}/bin/pwsp-gui";
    icon = "audio-card"; # Стандартная иконка звука
    terminal = false;
    categories = [ "AudioVideo" "Audio" ];
  };
in
{
  # 1. Добавляем бинарники и ярлык меню
  environment.systemPackages = [
    pwsp
    desktopItem
  ];

  # 2. Включаем GTK XDG Portal для работы окна выбора файлов в Xfce
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  # 3. Автозапуск демона
  systemd.user.services.pwsp-daemon = {
    description = "PipeWire Soundpad Daemon";
    after = [ "pipewire.service" ];
    wants = [ "pipewire.service" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pwsp}/bin/pwsp-daemon";
      Restart = "on-failure";
      RestartSec = 3;
    };

    wantedBy = [ "default.target" ];
  };
}
