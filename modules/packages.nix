{ pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # -------------------------------------------------------------------------
    # Системные и CLI утилиты
    # -------------------------------------------------------------------------
    binutils
    btop
    fastfetch
    git
    kitty
    unrar
    unzip
    vim
    wget
    wl-clipboard
    zip

    # -------------------------------------------------------------------------
    # Интернет, браузеры и коммуникация
    # -------------------------------------------------------------------------
    ayugram-desktop
    element-desktop
    exodus
    feishin
    inputs.helium.packages.${pkgs.system}.default
    librewolf
    tor-browser
    vesktop

    # -------------------------------------------------------------------------
    # Мультимедиа и работа с контентом
    # -------------------------------------------------------------------------
    kdePackages.kdenlive
    krita
    libreoffice
    mpv
    obs-studio
    vlc
    poedit
    haruna

    # -------------------------------------------------------------------------
    # Сеть, удаленный доступ и торренты
    # -------------------------------------------------------------------------
    filezilla
    moonlight-qt
    nicotine-plus
    qbittorrent
    remmina

    # -------------------------------------------------------------------------
    # Разработка, компиляторы и сборка
    # -------------------------------------------------------------------------
    clang
    cmake
    gcc
    gnumake
    javaPackages.compiler.openjdk11-bootstrap
    jetbrains-toolbox
    meson
    ninja
    python3
    python313Packages.pip
    rustup
    stdenv.cc.cc.lib
    zlib
    luau    
    opencode-desktop
    opencode
    protobuf
    nodejs_26    
    pkg-config    
    glib
    gtk3
    webkitgtk_4_1
    pnpm
    dbus
    openssl
    cairo
    pango
    recaf-launcher
    claude-code
    discordchatexporter-desktop  
    arti
    obfs4
    jadx
    alacritty
    materialgram
    # -------------------------------------------------------------------------
    # Анализ трафика и специфичные утилиты
    # -------------------------------------------------------------------------
    charles
    devin-cli
    devin-desktop
    mitmproxy
    mitmproxy2swagger
    waydroid-helper

    # -------------------------------------------------------------------------
    # Безопасность и менеджеры паролей
    # -------------------------------------------------------------------------
    bitwarden-cli
    bitwarden-menu

    # -------------------------------------------------------------------------
    # Игры и эмуляторы
    # -------------------------------------------------------------------------
    fceux
    prismlauncher
    protontricks
    xclicker
  ];
}
