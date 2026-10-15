{ config, ... }:

{
  programs.bun = {
    enable = true;
    settings.install = {
      globalDir = "${config.xdg.dataHome}/bun/install/global";
      globalBinDir = config.xdg.binHome;
      cache.dir = "${config.xdg.cacheHome}/bun/install/cache";
    };
  };
}
