{pkgs, ...}: {
    home.packages =
        builtins.readDir ./scripts
        |> builtins.attrNames
        |> builtins.map (fileName: builtins.replaceStrings [".sh"] [""] fileName)
        |> builtins.map (scriptName: builtins.readFile ./scripts/${scriptName}.sh |> pkgs.writeScriptBin scriptName);
}
