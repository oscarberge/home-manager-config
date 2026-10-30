{ ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font Propo:size=12";
        width = 40;
        lines = 7;
        horizontal-pad = 16;
        vertical-pad = 12;
        inner-pad = 8;
        line-height = 28;
        icons-enabled = "no";
        terminal = "ghostty -e";
        prompt = "›  ";
      };

      colors = {
        background = "242424ff";
        text = "e8edf3ff";
        prompt = "e8edf3ff";
        placeholder = "aab5c1cc";
        message = "e8edf3ff";
        input = "e8edf3ff";
        match = "e8edf3ff";
        selection = "aab5c126";
        selection-text = "e8edf3ff";
        selection-match = "e8edf3ff";
        border = "242424ff";
      };

      border = {
        width = 0;
        radius = 0;
        selection-radius = 0;
      };
    };
  };
}
