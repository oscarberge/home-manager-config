{ config, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ...";
      gs = "git status";
      "ga." = "git add .";
      gcm = "git commit -m";
      hms = "home-manager switch --flake ${config.home.homeDirectory}/.config/home-manager#${config.home.username}";
      nrs = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/nixos-config";
    };
  };
}
