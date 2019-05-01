{ pkgs, ... }:

{
  imports = [
    ../../cfg/home-manager.nix
    ./home-dotfiles.nix
  ];
    home-manager.users.duck = {
      home.packages = with pkgs; [
        ## Security
        gnupg
        pass

        ## Editing
        nano

        ## Ops
        wireguard

        # Utility
        parted
      ];

      programs.home-manager = {
        enable = true;
      };
      xdg.enable = true;
    };
}
