{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ...";
      gs = "git status";
      "ga." = "git add .";
      gcm = "git commit -m";
      hms = "home-manager switch --flake /home/osbe/.config/home-manager#osbe";
      nrs = "sudo nixos-rebuild switch --flake /home/osbe/nixos-config";
    };
  };
}
