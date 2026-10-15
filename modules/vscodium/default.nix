{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      userSettings = {
	"git.autofetch" = true;
        "telemetry.feedback.enabled" = false;
        "workbench.iconTheme" = "material-icon-theme";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.lineNumbers" = "relative";
        "editor.formatOnSave" = true;
        "editor.stickyScroll.enabled" = false;
        "terminal.integrated.stickyScroll.enabled" = false;
        "redhat.telemetry.enabled" = false;
        "vim.highlightedyank.enable" = true;
        "vim.useSystemClipboard" = true;
        "vim.insertModeKeyBindingsNonRecursive" = [
          {
            before = [
              "j"
              "k"
            ];
            after = [ "<Esc>" ];
          }
          {
            before = [
              "k"
              "j"
            ];
            after = [ "<Esc>" ];
          }
        ];
        "vim.normalModeKeyBindingsNonRecursive" = [
          {
            before = [ "K" ];
            commands = [ "editor.action.showHover" ];
          }
        ];
        "editor.cursorBlinking" = "solid";
        "intellij.region" = "europe";
        "intellij.dataSharing" = "none";
        "workbench.startupEditor" = "none";
        "python.languageServer" = "Default";
        "[xml]" = {
          "editor.defaultFormatter" = "redhat.vscode-xml";
        };
        "hexeditor.columnWidth" = 16;
        "hexeditor.showDecodedText" = true;
        "hexeditor.defaultEndianness" = "little";
        "hexeditor.inspectorType" = "aside";
        "[java]" = {
          "editor.defaultFormatter" = "redhat.java";
        };
      };

      extensions = with pkgs.vscode-extensions; [
        esbenp.prettier-vscode
        pkief.material-icon-theme
        redhat.java
        redhat.vscode-xml
        vscodevim.vim
      ];
    };
  };
}
