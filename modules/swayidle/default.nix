{ pkgs, lib, ... }:

let
  swaymsg = lib.getExe' pkgs.sway "swaymsg";
in
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 600;
        command = ''${swaymsg} "output * power off"'';
        resumeCommand = ''${swaymsg} "output * power on"'';
      }
    ];
  };
}
