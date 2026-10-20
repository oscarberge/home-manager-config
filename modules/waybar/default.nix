{ pkgs, ... }:

let
  design = {
    barHeight = 24;
    fontFamily = "JetBrainsMono Nerd Font Propo";
    fontSize = 12;
    gap = 14;
    edgeInset = 14;
    hoverBrightness = 0.7;

    colors = {
      background = "#242424";
      foreground = "#e8edf3";
      muted = "#aab5c1";
      alert = "#f55e64";
      accent = "#ffb454";
      success = "#26a65b";
      power_saver = "#a8c686";
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

  colorDefinitions = builtins.concatStringsSep "\n" (
    builtins.concatLists (
      map (name: [
        "@define-color ${name} ${design.colors.${name}};"
        "@define-color ${name}_hover ${hoverColor design.colors.${name}};"
      ]) (builtins.attrNames design.colors)
    )
  );

  stylesheet =
    builtins.replaceStrings
      [ "@BAR_HEIGHT @px" "@EDGE_INSET @px" "@FONT_FAMILY @" "@FONT_SIZE @px" ]
      [
        "${toString design.barHeight}px"
        "${toString design.edgeInset}px"
        "\"${design.fontFamily}\""
        "${toString design.fontSize}px"
      ]
      (builtins.readFile ./style.css);
in

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    package = pkgs.waybar.overrideAttrs (old: {
      # Sway workspaces are a nested GtkBox; use the same configured gap as the outer module rows.
      postPatch = (old.postPatch or "") + ''
        substituteInPlace src/modules/sway/workspaces.cpp \
          --replace-fail 'box_(bar.orientation, 0)' 'box_(bar.orientation, config["spacing"].asInt())'
      '';
    });
    style = builtins.toFile "waybar.css" "${colorDefinitions}\n${stylesheet}";
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        exclusive = true;
        height = design.barHeight;
        spacing = design.gap;
        reload_style_on_change = true;

        "modules-left" = [
          "custom/launcher"
          "clock"
        ];

        "modules-center" = [
          "sway/workspaces"
        ];

        "modules-right" = [
          "pulseaudio"
          "bluetooth"
          "network"
          "power-profiles-daemon"
          "battery"
        ];

        "sway/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
          spacing = design.gap;
          format = "{name}";
          "persistent-workspaces" = {
            "*" = [
              1
              2
              3
              4
              5
            ];
          };
        };

        "custom/launcher" = {
          format = "";
          tooltip = false;
          "on-click" = "fuzzel";
        };

        clock = {
          format = "{:%H:%M:%S}";
          interval = 1;
          "tooltip-format" = "<tt>{calendar}</tt>";
          calendar = {
            format = {
              today = "<span color='${design.colors.foreground}'><b>{}</b></span>";
            };
          };
          actions = {
            "on-click-right" = "shift_down";
            "on-click" = "shift_up";
          };
        };

        network = {
          "format-wifi" = "";
          "format-ethernet" = "";
          "format-disconnected" = "󰪎";
          "tooltip-format-disconnected" = "Disconnected";
          "tooltip-format-wifi" = "{essid} ({signalStrength}%)";
          "tooltip-format-ethernet" = "{ifname}";
          "on-click" = "ghostty -e nmtui";
        };

        pulseaudio = {
          format = "<span alpha='70%'>{volume}%</span> {icon}";
          "format-muted" = "";
          "format-icons" = {
            headphone = "";
            headset = "󰋎";
            default = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pavucontrol";
        };

        bluetooth = {
          "format-disabled" = "󰂲";
          "format-off" = "󰂲";
          "format-on" = "󰂯";
          "format-connected" = "󰂱";
          "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          "tooltip-format-connected" =
            "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\n{device_address}";
          "tooltip-format-enumerate-connected-battery" =
            "{device_alias}\n{device_address}\n{device_battery_percentage}%";
          "on-click" = "ghostty -e bluetui";
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{capacity}% {icon}";
          "format-charging" = "{capacity}% 󰂄";
          "format-not-charging" = "{capacity}% 󱞜";
          "format-alt" = "{time} {icon}";
          "format-icons" = [
            "󰁻"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰂂"
            "󰁹"
          ];
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          "tooltip-format" = "Power profile: {profile}";
          "format-icons" = {
            default = "";
            performance = "";
            balanced = "";
            "power-saver" = "";
          };
        };
      };
    };
  };
}
