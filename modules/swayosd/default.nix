{ pkgs, lib, ... }:

{
  services.swayosd = {
    enable = true;
    topMargin = 0.95;
    #stylePath = ./style.css;
  };

  wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault {
    "--locked XF86AudioRaiseVolume" = "exec swayosd-client --output-volume raise --max-volume 120";
    "--locked XF86AudioLowerVolume" = "exec swayosd-client --output-volume lower --max-volume 120";

    "--locked XF86AudioMute" = "exec swayosd-client --output-volume mute-toggle";
    "--locked XF86AudioMicMute" = "exec swayosd-client --input-volume mute-toggle";

    "--locked --release Caps_Lock" = "exec swayosd-client --caps-lock";

    "--locked XF86MonBrightnessUp" = "exec swayosd-client --brightness raise";
    "--locked XF86MonBrightnessDown" = "exec swayosd-client --brightness lower";
  };
}
