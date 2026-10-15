{ config, ... }:

{
  xdg = {
    enable = true;
    localBinInPath = true;

    userDirs = {
      enable = true;
      desktop = "${config.home.homeDirectory}/desktop";
      download = "${config.home.homeDirectory}/downloads";
      templates = "${config.home.homeDirectory}/templates";
      publicShare = "${config.home.homeDirectory}/public";
      documents = "${config.home.homeDirectory}/documents";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pictures";
      videos = "${config.home.homeDirectory}/videos";
      projects = null;
    };
  };

  home.preferXdgDirectories = true;
}
