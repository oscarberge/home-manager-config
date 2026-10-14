{ ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font Propo:size=11";
        width = 44;
        lines = 8;
        horizontal-pad = 18;
        vertical-pad = 14;
        inner-pad = 10;
        line-height = 30;
        icons-enabled = "yes";
        terminal = "ghostty -e";
        prompt = "›  ";
        placeholder = "Search applications";
      };

      colors = {
        background = "1e232af5";
        text = "e8edf3ff";
        prompt = "ffb454ff";
        placeholder = "aab5c1cc";
        message = "e8edf3ff";
        input = "e8edf3ff";
        match = "ffb454ff";
        selection = "ffb45430";
        selection-text = "e8edf3ff";
        selection-match = "ffb454ff";
        border = "e0e9f21a";
      };

      border = {
        width = 1;
        radius = 8;
        selection-radius = 6;
      };
    };
  };
}
