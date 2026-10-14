{ ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      shlvl = {
        disabled = false;
        threshold = 2;
      };
      directory.style = "bold green";
    };
    presets = [ "nerd-font-symbols" ];
  };
}
