{ ... }:

{
  services.swayidle = {
    enable = true;
    events = {
      before-sleep = "lock-screen";
    };
    timeouts = [
      { timeout = 300; command = "lock-screen"; }
      {
        timeout = 600;
        command = ''swaymsg "output * power off"'';
        resumeCommand = ''swaymsg "output * power on"'';
      }
    ];
  };
}
