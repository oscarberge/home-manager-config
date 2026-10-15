{ pkgs, ... }:

{
  imports = [
    ./modules/sway
    ./modules/swayidle
    ./modules/waylock
    ./modules/waybar
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
    ./modules/user-dirs
    ./modules/wlsunset
    ./modules/batsignal
    ./modules/swaync
  ];

  home.username = "osbe";
  home.homeDirectory = "/home/osbe";
  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;

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
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    inter
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  programs.bash.enable = true;
  programs.uv.enable = true;
  programs.firefox.enable = true;
  programs.yazi.enable = true;
  programs.opencode.enable = true;
  programs.prismlauncher.enable = true;

  services.cliphist.enable = true;

  programs.home-manager.enable = true;
}
