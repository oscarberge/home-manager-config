{ config, lib, ... }:

let
  mod = "Mod4";
in
{
  wayland.windowManager.sway = {
    enable = true;
    package = null;
    systemd.variables = lib.mkAfter [ "XDG_SESSION_ID" ];

    config = {
      modifier = mod;
      terminal = "ghostty";
      menu = "fuzzel";
      left = "h";
      down = "j";
      up = "k";
      right = "l";

      bars = [ ];

      output."*".bg = "${config.home.homeDirectory}/pictures/bear-friends-autumn.jpg fill";

      # Look
      gaps = {
        inner = 5;
        smartGaps = true;
      };

      window = {
        border = 0;
        hideEdgeBorders = "smart";
        titlebar = false;
      };

      floating.border = 0;

      colors = {
        focused = {
          border = "#d8d8d8";
          background = "#d8d8d8";
          text = "#000000";
          indicator = "#d8d8d8";
          childBorder = "#d8d8d8";
        };
        focusedInactive = {
          border = "#333333";
          background = "#333333";
          text = "#888888";
          indicator = "#333333";
          childBorder = "#333333";
        };
        unfocused = {
          border = "#222222";
          background = "#222222";
          text = "#888888";
          indicator = "#222222";
          childBorder = "#222222";
        };
        urgent = {
          border = "#ffffff";
          background = "#ffffff";
          text = "#000000";
          indicator = "#ffffff";
          childBorder = "#ffffff";
        };
      };

      # Input
      input = {
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
        };

        "type:keyboard" = {
          xkb_layout = "no";
          xkb_variant = "nodeadkeys";
        };
      };

      # Keybindings
      keybindings = lib.mkOptionDefault {
        "${mod}+Shift+v" = "exec cliphist list | fuzzel --dmenu | cliphist decode | wl-copy";
        "${mod}+Shift+n" = "exec swaync-client -t -sw";

        "${mod}+p" = ''exec grim -g "$(slurp)" - | wl-copy'';
        "${mod}+Shift+p" = "exec grim - | wl-copy";

        "--locked XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "--locked XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "--locked XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "--locked XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "--locked XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "--locked XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
      };

      # Window rules
      window.commands = [
        {
          criteria.class = "^steam_app_";
          command = "inhibit_idle visible";
        }
        {
          criteria.app_id = "pavucontrol";
          command = "floating enable";
        }
        {
          criteria.app_id = "org.prismlauncher.PrismLauncher";
          command = "floating enable";
        }
        {
          criteria.app_id = "localsend_app";
          command = "floating enable";
        }
        {
          criteria = {
            class = "steam";
            title = "Friends List";
          };
          command = "floating enable";
        }
      ];
    };

    extraConfig = "include /etc/sway/config.d/*";
  };
}
