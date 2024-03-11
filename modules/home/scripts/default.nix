{pkgs, ...}: let
  script-names = builtins.map (x: builtins.replaceStrings [".sh"] [""] x) (builtins.attrNames (builtins.readDir ./scripts));
in {
  home.packages = builtins.map (name: pkgs.writeScriptBin name (builtins.readFile ./scripts/${name}.sh)) script-names;
}
