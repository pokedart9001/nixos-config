{pkgs, ...}: {
    home.packages = with pkgs; [famistudio];

    xdg.desktopEntries.famistudio = {
        name = "FamiStudio";
        genericName = "NES Music Editor";
        comment = "A very simple music editor for the Nintendo Entertainment System or Famicom.";
        icon = builtins.fetchurl {
            url = "https://famistudio.org/famistudio.png";
            sha256 = "sha256:020n10vp1i9n62cxy7dkbrd5z9a15yql8sf7hvzr4xclw7r7gj9a";
        };

        exec = "FamiStudio";
        terminal = false;
        categories = ["AudioVideo" "Audio"];
    };
}
