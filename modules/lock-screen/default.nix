{ pkgs, lib, ... }:

let
  lockScreen = pkgs.writeShellApplication {
    name = "lock-screen";
    runtimeInputs = [ pkgs.waylock ];
    text = ''
      exec waylock \
        -fork-on-lock \
        -ignore-empty-password \
        -init-color 0x1e232a \
        -input-color 0x292f38 \
        -input-alt-color 0x303741 \
        -fail-color 0xf55e64 \
        "$@"
    '';
  };

  lock = lib.getExe lockScreen;
in
{
  home.packages = [ lockScreen ];

  wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault {
    "Mod4+Escape" = "exec ${lock}";
  };

  services.swayidle = {
    events.before-sleep = lock;
    timeouts = [
      {
        timeout = 300;
        command = lock;
      }
    ];
  };
}
