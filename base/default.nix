{ pkgs, ... }:

{
  imports = [
    ./dotfiles.nix
  ];
  home-manager.users.duck = {
    home.packages = with pkgs; [
      ## Security
      gnupg
      pass

      ## Editing
      nano

      # Utility
      parted
      iperf3
      speedtest-cli
    ];

    # idgaf about free software sorry
    nixpkgs.config.allowUnfree = true;

    programs.home-manager = {
      enable = true;
    };
    xdg.enable = true;

    programs.htop = {
      enable = true;
      cpuCountFromZero = true;
    };
  };
  users.users.duck = {
    # Pull active SSH keys from github.
    openssh.authorizedKeys.keyFiles =
      let
        keysFile = builtins.fetchurl "https://github.com/duckfullstop.keys";
      in
      [ keysFile ];
  };
}
