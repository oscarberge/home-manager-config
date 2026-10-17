{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      userSettings = {
        # Appearance
        "workbench.colorTheme" = "Kanagawa Wave";
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.startupEditor" = "none";
        "editor.cursorBlinking" = "solid";
        "editor.lineNumbers" = "relative";
        "editor.stickyScroll.enabled" = false;
        "terminal.integrated.stickyScroll.enabled" = false;

        # Formatting
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[python]"."editor.defaultFormatter" = "charliermarsh.ruff";
        "[xml]"."editor.defaultFormatter" = "redhat.vscode-xml";
        "[java]"."editor.defaultFormatter" = "redhat.java";

        # Git
        "git.autofetch" = true;

        # Telemetry / extension first-run prompts
        "telemetry.feedback.enabled" = false;
        "redhat.telemetry.enabled" = false;
        "intellij.region" = "europe";
        "intellij.dataSharing" = "none";

        # Hex editor
        "hexeditor.columnWidth" = 16;
        "hexeditor.showDecodedText" = true;
        "hexeditor.defaultEndianness" = "little";
        "hexeditor.inspectorType" = "aside";

        # Vim
        "vim.highlightedyank.enable" = true;
        "vim.useSystemClipboard" = true;
        "vim.insertModeKeyBindingsNonRecursive" = [
          {
            before = [ "j" "k" ];
            after = [ "<Esc>" ];
          }
          {
            before = [ "k" "j" ];
            after = [ "<Esc>" ];
          }
        ];
        "vim.normalModeKeyBindingsNonRecursive" = [
          {
            before = [ "K" ];
            commands = [ "editor.action.showHover" ];
          }
        ];
      };

      extensions = with pkgs.open-vsx; [
        charliermarsh.ruff
        dbaeumer.vscode-eslint
        editorconfig.editorconfig
        esbenp.prettier-vscode
        fwcd.kotlin
        jnoortheen.nix-ide
        meta.pyrefly
        metaphore.kanagawa-vscode-color-theme
        ms-azuretools.vscode-containers
        ms-vscode.hexeditor
        pkief.material-icon-theme
        redhat.java
        redhat.vscode-xml
        redhat.vscode-yaml
        vscodevim.vim
      ];
    };
  };
}
