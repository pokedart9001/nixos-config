{
  inputs,
  pkgs,
  ...
}: {
  programs.cava = {
    enable = true;
    catppuccin.enable = true;
  };
}
