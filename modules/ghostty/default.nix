{ ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Darkside";
      window-width = 120;
      window-height = 35;
      bell-features = "no-title";
      mouse-hide-while-typing = true;
    };
  };
}
