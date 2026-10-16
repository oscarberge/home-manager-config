{ pkgs, ... }:

{
  imports = [
    ./modules/sway
    ./modules/swayidle
    ./modules/waylock
    ./modules/waybar
    ./modules/fonts
    ./modules/cursor
    ./modules/gtk
    ./modules/git
    ./modules/bun
    ./modules/nodejs
    ./modules/bat
    ./modules/btop
    ./modules/nvim
    ./modules/ghostty
    ./modules/fuzzel
    ./modules/vscodium
    ./modules/starship
    ./modules/xdg
    ./modules/wlsunset
    ./modules/batsignal
    ./modules/swaync
    ./modules/bash
    ./modules/java
  ];

  home.username = "osbe";
  home.homeDirectory = "/home/osbe";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    wl-clipboard
    grim
    slurp
    libnotify
    pavucontrol
    bluetui
    python3
    spotify
    brightnessctl
    pulseaudio
    networkmanager
  ];

  programs.uv.enable = true;
  programs.firefox.enable = true;
  programs.yazi.enable = true;
  programs.opencode.enable = true;
  programs.prismlauncher.enable = true;

  services.cliphist.enable = true;

  programs.home-manager.enable = true;
}
