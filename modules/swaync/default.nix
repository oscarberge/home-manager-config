{ pkgs, ... }:

let
  design = {
    fontFamily = "JetBrainsMono Nerd Font Propo";
    fontSize = 12;
    outerInset = 8;
    contentPaddingHorizontal = 16;
    contentPaddingVertical = 12;
    innerPadding = 8;
    elementGap = 14;
    controlRowHeight = 28;
    hoverBrightness = 0.7;
    transitionDuration = "0.15";
    selectionColor = "#aab5c126";
    notificationIconSize = 42;
    notificationAppIconSize = 16;
    notificationGroupIconSize = 20;
    closeIconSize = 12;
    dndSwitchWidth = 56;
    dndSwitchHeight = 28;
    dndSwitchThumbSize = 14;
    dndSwitchThumbInset = 7;
    dndSwitchIconSize = 14;

    colors = {
      background = "#242424";
      foreground = "#e8edf3";
      muted = "#aab5c1";
      alert = "#f55e64";
      accent = "#ffb454";
      success = "#26a65b";
      "power-saver" = "#a8c686";
    };
  };

  hexDigits = "0123456789abcdef";
  hexToInt = value: (builtins.fromTOML "value = 0x${value}").value;
  toHex =
    value:
    "${builtins.substring (builtins.div value 16) 1 hexDigits}${
      builtins.substring (value - (builtins.div value 16 * 16)) 1 hexDigits
    }";
  hoverColor =
    color:
    let
      channel =
        offset:
        builtins.floor (hexToInt (builtins.substring offset 2 color) * design.hoverBrightness + 0.5);
    in
    "#${toHex (channel 1)}${toHex (channel 3)}${toHex (channel 5)}";

  colorVariables = builtins.concatStringsSep "\n" (
    map (
      name:
      "  --${name}: ${design.colors.${name}};\n  --${name}-hover: ${hoverColor design.colors.${name}};"
    ) (builtins.attrNames design.colors)
  );

  stylesheet =
    builtins.replaceStrings
      [
        "@COLOR_VARIABLES@"
        "@FONT_FAMILY@"
        "@FONT_SIZE@"
        "@OUTER_INSET@"
        "@CONTENT_PADDING_HORIZONTAL@"
        "@CONTENT_PADDING_VERTICAL@"
        "@INNER_PADDING@"
        "@ELEMENT_GAP@"
        "@CONTROL_ROW_HEIGHT@"
        "@TRANSITION_DURATION@"
        "@SELECTION_COLOR@"
        "@NOTIFICATION_ICON_SIZE@"
        "@NOTIFICATION_APP_ICON_SIZE@"
        "@NOTIFICATION_GROUP_ICON_SIZE@"
        "@CLOSE_ICON_SIZE@"
        "@DND_SWITCH_WIDTH@"
        "@DND_SWITCH_HEIGHT@"
        "@DND_SWITCH_THUMB_SIZE@"
        "@DND_SWITCH_THUMB_INSET@"
        "@DND_SWITCH_ICON_SIZE@"
      ]
      [
        colorVariables
        design.fontFamily
        (toString design.fontSize)
        (toString design.outerInset)
        (toString design.contentPaddingHorizontal)
        (toString design.contentPaddingVertical)
        (toString design.innerPadding)
        (toString design.elementGap)
        (toString design.controlRowHeight)
        design.transitionDuration
        design.selectionColor
        (toString design.notificationIconSize)
        (toString design.notificationAppIconSize)
        (toString design.notificationGroupIconSize)
        (toString design.closeIconSize)
        (toString design.dndSwitchWidth)
        (toString design.dndSwitchHeight)
        (toString design.dndSwitchThumbSize)
        (toString design.dndSwitchThumbInset)
        (toString design.dndSwitchIconSize)
      ]
      (builtins.readFile ./style.css);
in
{
  services.swaync = {
    enable = true;
    style = builtins.toFile "swaync.css" stylesheet;

    settings = {
      "$schema" = "${pkgs.swaynotificationcenter}/etc/xdg/swaync/configSchema.json";

      "control-center-margin-top" = design.outerInset;
      "control-center-margin-bottom" = design.outerInset;
      "control-center-margin-right" = design.outerInset;
      "control-center-margin-left" = design.outerInset;
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
