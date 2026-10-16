{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        exclusive = true;
        reload_style_on_change = true;

        "modules-left" = [
          "custom/launcher"
          "custom/separator"
          "clock"
        ];

        "modules-center" = [
          "sway/workspaces"
        ];

        "modules-right" = [
          "group/expand"
          "pulseaudio"
          "bluetooth"
          "network"
          "power-profiles-daemon"
          "battery"
        ];

        "sway/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
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

        "custom/separator" = {
          format = "|";
          tooltip = false;
        };

        clock = {
          format = "{:%H:%M:%S}";
          interval = 1;
          "tooltip-format" = "<tt>{calendar}</tt>";
          calendar = {
            format = {
              today = "<span color='#e8edf3'><b>{}</b></span>";
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

        "custom/expand" = {
          format = "";
          tooltip = false;
        };

        "custom/endpoint" = {
          format = "|";
          tooltip = false;
        };

        "group/expand" = {
          orientation = "horizontal";
          drawer = {
            "transition-duration" = 600;
            "transition-to-left" = true;
            "click-to-reveal" = true;
          };
          modules = [
            "custom/expand"
            "cpu"
            "memory"
            "temperature"
            "custom/endpoint"
          ];
        };

        cpu = {
          format = "";
          tooltip = true;
        };

        memory = {
          format = "";
        };

        temperature = {
          "critical-threshold" = 80;
          format = "";
        };

      };
    };
  };
}
