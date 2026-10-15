{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      gs = "git status";
      hms = "home-manager switch --flake /home/osbe/.config/home-manager#osbe";
      nrs = "sudo nixos-rebuild switch --flake /home/osbe/nixos-config";
    };
  };
}
