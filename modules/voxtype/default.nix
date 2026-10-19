{ lib, ... }:

{
  programs.voxtype = {
    enable = true;
    engine = "whisper";
    model.name = "base.en";
    service.enable = true;

    settings = {
      hotkey.enabled = false;
      whisper.language = "en";
      output.mode = "type";
      output.fallback_to_clipboard = true;
      output.notification.on_transcription = false;
      osd.frontend = "gtk4";
    };
  };

  wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault {
    "--no-repeat Mod4+t" = "exec voxtype record start";
    "--release Mod4+t" = "exec voxtype record stop";
  };
}
