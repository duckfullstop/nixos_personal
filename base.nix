{ pkgs, ... }:

let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    ref = "release-20.09";
  };
in
{
  imports = [
    "${home-manager}/nixos"
    ./dotfiles.nix
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
