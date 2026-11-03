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
          border = "#7b858e";
          background = "#3a3d40";
          text = "#d0d2d4";
          indicator = "#7b858e";
          childBorder = "#7b858e";
        };
        focusedInactive = {
          border = "#48433a";
          background = "#303030";
          text = "#aab5c1";
          indicator = "#48433a";
          childBorder = "#48433a";
        };
        unfocused = {
          border = "#343434";
          background = "#292929";
          text = "#aab5c1";
          indicator = "#343434";
          childBorder = "#343434";
        };
        urgent = {
          border = "#f55e64";
          background = "#4a2929";
          text = "#f55e64";
          indicator = "#f55e64";
          childBorder = "#f55e64";
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

        "Print" = ''exec grim -g "$(slurp)" - | wl-copy'';
        "Shift+Print" = "exec grim - | wl-copy";
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
