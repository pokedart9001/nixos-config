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
        owner = "Bartholomew125";
        repo = "liquid-glass-plugin-hyprpm";
        rev = "main";
        hash = "sha256-I7l7fE7jhzSpHZQW3i9zD2IMovGLaN0/qW8rtXvrwIM=";
    };

    # any nativeBuildInputs required for the plugin
    nativeBuildInputs = [cmake];

    # set any buildInputs that are not already included in Hyprland
    # by default, Hyprland and its dependencies are included
    buildInputs = [];

    dontUseCmakeConfigure = true;
    installPhase = ''
        runHook preInstall

        mkdir -p $out/lib
        mv liquid-glass.so $out/lib/libhypr-liquid-glass.so

        runHook postInstall
    '';

    meta = {
        homepage = "https://github.com/Bartholomew125/liquid-glass-plugin-hyprpm";
        description = "Apple-style Liquid Glass effect for Hyprland windows with refraction, chromatic aberration, and Fresnel highlights";
        platforms = lib.platforms.linux;
    };
}
