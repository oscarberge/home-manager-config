{ ... }:

{
  programs.direnv = {
    enable = true;
    enableGitIntegration = true;
    nix-direnv.enable = true;
  };
}
