{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "*";

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.variables = {
    CUDA_CACHE_PATH = "$XDG_CACHE_HOME/nv";
    GNUPGHOME = "$XDG_DATA_HOME/gnupg";
    XCOMPOSECACHE = "$XDG_CACHE_HOME/X11/xcompose";
    PARALLEL_HOME = "$XDG_CONFIG_HOME/parallel";
  };
}
