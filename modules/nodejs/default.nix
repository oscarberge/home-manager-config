{ config, pkgs, ... }:

{
  programs.npm = {
    enable = true;
    package = pkgs.nodejs;
    settings = {
      cache = "${config.xdg.cacheHome}/npm";
      prefix = "${config.xdg.dataHome}/npm";
    };
  };
}
