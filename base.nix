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
    # My preferred SSH keys are provided here.
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDc5qNi2ZwN0ptEtc5HNy7hJygUnwvpg5OTRPqbqVFt/b1TI/mqsz8MINSz5mYCz+SbisirbMeB1ZVCPDli4GP7giHgicSnzoO/PZ89s9IjymW1OslZq6BRFAO/PrKPTegPgHd3ubItbQ7O/s2vg2qKIYqkomxbUDg1ab/hNWLnH91IGzasH2f+vKVybMsgxyupdHX01CmYHQfxDzlYldvTTGPT6de6WFcseY34giAkvE5PXi1ENtYEo+ccgvTDBQbV1iEcY8ZHT7U+iY5j2zVlEc5IlE/l84/HqvF5UQ6SIvhi/JACRUVxEMkCE3B6sSOPlmwqAPk8FCux7BIjRPi6aYXDhILcMiXvGDs+MwqW3SXW7otwUqJwEbjiABXcAS1mvBgYAwfM3xrC8X1NZRMmxgSIzpy41+TaN4Gi6mghy+oIa7XMhz41vuNmCPSHYeX+J9R197YhpgT1t6lRRoGjc54UmTbcFI7+GfCEC0qJzegxEO/4Pi9pizHdxl3P1ecnNevRffZtBQayeB/UY9mm6hxKS+Yo2ihb2WPrNp3m53RHFYqAlP2pOxu5N8JvbKSq5Wjvy6lfYJ1UWOlNdjHkzxLpuvmAOPFmf39OI/PRDnz9K26PDTZngbGmoU9mrcBuLBikYDj6732PvT1V9Mtea5gHzLcTO5GSJHGIAixGDQ== duck.yubi4.7306248.gpg"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCiyNA+a0qlwfO94UC10ZclyT3bQPGth23p9wArVMJts/EzHtNXeVBuWGtALNwlhEijBnj28OmHur3fZnqn6DD96jKdZYGl0W3h6UR5czMEn8RjsXvepA++2b7lPQHV9x2QrU4YhseStb13K9VvBByMCKjXsPblbcRu3UshsgW6V+cdHu03+qtWYMyfz5LTMuw+LZ9xSkRGkMCBZLYbc1k+cZ3sqkstiXlfjHt6Xm5K+bWdOjratDqhOjl03iMJUYyieW+zePm602zlh7t/pnHg0Jc0rnKUy/akZro5U+t9rks09SAvfrso0SZDv0pdD6/FupVyAMA4w0/W7lsIjY3l duck.yubi4.7306248.pkcs11"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPbHEZYB9Lrd5y4IK7AiS8n4byo/OgumH2uP8Y6KHgIg iphone.duck."
    ];
  };
}
