{pkgs, ...}: {
    home.packages = with pkgs; [
        (nitch.overrideAttrs (finalAttrs: previousAttrs: {
            patches = previousAttrs.patches ++ [./desktop_info.patch];
        }))
    ];
}
