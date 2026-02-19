{
    lib,
    fetchFromGitHub,
    cmake,
    hyprlandPlugins,
}:
hyprlandPlugins.mkHyprlandPlugin {
    pluginName = "hyprglass";
    version = "0.1";

    src = fetchFromGitHub {
        owner = "purple-lines";
        repo = "Hypr-GlassWindow-fix";
        rev = "master";
        hash = "sha256-lI7q32bxIAyIZOIZUrzM9V2iTR++258JaZ9A9AOYaW0=";
    };

    # any nativeBuildInputs required for the plugin
    nativeBuildInputs = [cmake];

    # set any buildInputs that are not already included in Hyprland
    # by default, Hyprland and its dependencies are included
    buildInputs = [];

    installPhase = ''
        runHook preInstall

        mkdir -p $out/lib
        mv glasswindow.so $out/lib/libglasswindow.so

        runHook postInstall
    '';

    meta = {
        homepage = "https://github.com/purple-lines/Hypr-GlassWindow-fix";
        description = "Glass-like Hyprland plugin";
        license = lib.licenses.mit;
        platforms = lib.platforms.linux;
    };
}
