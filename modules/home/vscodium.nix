{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # nix language
        bbenoist.nix
        # python
        ms-python.vscode-pylance
        # C/C++
        ms-vscode.cpptools

        # Color theme
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons

        # Vim motions
        vscodevim.vim
      ];
      userSettings = {
        "update.mode" = "none";
        "extensions.autoUpdate" = false; # This stuff fixes vscode freaking out when heres an updatet
        "window.titleBarStyle" = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509

        "window.menuBarVisibility" = "toggle";
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont', 'monospace', monospace";
        "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont'";
        "editor.fontSize" = 14;
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
        "vsicons.dontShowNewVersionMessage" = true;
        "explorer.confirmDragAndDrop" = false;
        "editor.fontLigatures" = true;
        "editor.minimap.enabled" = false;
        "workbench.startupEditor" = "none";

        "editor.formatOnType" = true;

        "workbench.layoutControl.type" = "menu";
        "workbench.editor.limit.enabled" = true;
        "workbench.editor.limit.value" = 5;
        "workbench.editor.limit.perEditorGroup" = true;
        "workbench.editor.showTabs" = "single";
        "files.autoSave" = "onWindowChange";
        "explorer.openEditors.visible" = 0;
        "breadcrumbs.enabled" = false;
        "editor.renderControlCharacters" = false;
        "workbench.activityBar.location" = "visible";
        "workbench.statusBar.visible" = false;
        "editor.scrollbar.vertical" = "auto";
        "editor.scrollbar.horizontal" = "auto";
        "workbench.layoutControl.enabled" = false;

        "editor.mouseWheelZoom" = true;

        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };

        "C_Cpp.intelliSenseUpdateDelay" = 500;
        "C_Cpp.codeAnalysis.updateDelay" = 500;
        "C_Cpp.autocompleteAddParentheses" = true;
        "C_Cpp.formatting" = "vcFormat";
        "C_Cpp.vcFormat.newLine.beforeOpenBrace.block" = "sameLine";
        "C_Cpp.vcFormat.newLine.beforeOpenBrace.function" = "sameLine";
        "C_Cpp.vcFormat.newLine.beforeOpenBrace.lambda" = "sameLine";
        "C_Cpp.vcFormat.newLine.beforeOpenBrace.namespace" = "sameLine";
        "C_Cpp.vcFormat.newLine.beforeOpenBrace.type" = "sameLine";
        "C_Cpp.vcFormat.space.pointerReferenceAlignment" = "right";
        "C_Cpp.vcFormat.newLine.beforeElse" = false;
        "C_Cpp.vcFormat.newLine.beforeCatch" = false;
        "C_Cpp.vcFormat.indent.caseLabels" = true;
        "C_Cpp.clang_format_fallbackStyle" = "{ BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 0}";
      };
      # Keybindings
      keybindings = [
        {
          key = "ctrl+q";
          command = "editor.action.commentLine";
          when = "editorTextFocus && !editorReadonly";
        }
        {
          key = "ctrl+s";
          command = "workbench.action.files.saveFiles";
        }
      ];
    };
  };
}
