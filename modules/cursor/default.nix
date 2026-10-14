{ pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
    sway.enable = true;
    gtk.enable = true;
    x11.enable = true;
  };
}
