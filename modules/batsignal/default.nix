{ ... }:

{
  services.batsignal = {
    enable = true;
    extraArgs = [
      "-I"
      "battery-low-symbolic"
    ];
  };
}
