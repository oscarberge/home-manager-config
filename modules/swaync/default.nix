{ pkgs, ... }:

{
  services.swaync = {
    enable = true;
    style = ./style.css;

    settings = {
      "$schema" = "${pkgs.swaynotificationcenter}/etc/xdg/swaync/configSchema.json";

      "control-center-margin-top" = 8;
      "control-center-margin-bottom" = 8;
      "control-center-margin-right" = 8;
      "control-center-margin-left" = 8;
      "control-center-height" = -1;
      "fit-to-screen" = false;
      "control-center-layer" = "overlay";
      cssPriority = "user";
      "notification-inline-replies" = true;
      "hide-on-clear" = true;

      widgets = [
        "inhibitors"
        "dnd"
        "mpris"
        "notifications"
      ];
      "widget-config" = {
        notifications = {
          vexpand = false;
        };
        inhibitors = {
          "button-text" = "Clear all";
        };
        dnd = {
          text = "Do not disturb";
        };
        mpris = {
          autohide = true;
        };
      };
    };
  };
}
