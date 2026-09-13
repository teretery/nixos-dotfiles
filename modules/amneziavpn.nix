{ pkgs, ... }:

{
  # Добавляем пакет в систему
  environment.systemPackages = [
    pkgs.amnezia-vpn
  ];

  # Объявляем системный сервис systemd (по умолчанию работает от root)
  systemd.services.amneziavpn-service = {
    description = "AmneziaVPN Background Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.amnezia-vpn}/bin/AmneziaVPN-service";
      Restart = "always";
      RestartSec = "3s";

      # Пробрасываем системные утилиты для работы с сетью и правилами маршрутизации
      Environment = "PATH=${pkgs.lib.makeBinPath [
        pkgs.iproute2
        pkgs.iptables
        pkgs.procps
      ]}";
    };
  };
}
