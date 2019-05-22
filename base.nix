{ pkgs, ... }:

let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    ref = "release-19.03";
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
    ];

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
    # My preferred password and SSH keys are provided here.
    initialHashedPassword = "$6$e6L8g9KU79$Hnff13WyTshJ.XV180YGTLkyaRQwblewo2r5GEDE26F0bIKMeK/8faX4yAWnUSkVrFBlgnCjO8zVG29YFX.ke1";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDc5qNi2ZwN0ptEtc5HNy7hJygUnwvpg5OTRPqbqVFt/b1TI/mqsz8MINSz5mYCz+SbisirbMeB1ZVCPDli4GP7giHgicSnzoO/PZ89s9IjymW1OslZq6BRFAO/PrKPTegPgHd3ubItbQ7O/s2vg2qKIYqkomxbUDg1ab/hNWLnH91IGzasH2f+vKVybMsgxyupdHX01CmYHQfxDzlYldvTTGPT6de6WFcseY34giAkvE5PXi1ENtYEo+ccgvTDBQbV1iEcY8ZHT7U+iY5j2zVlEc5IlE/l84/HqvF5UQ6SIvhi/JACRUVxEMkCE3B6sSOPlmwqAPk8FCux7BIjRPi6aYXDhILcMiXvGDs+MwqW3SXW7otwUqJwEbjiABXcAS1mvBgYAwfM3xrC8X1NZRMmxgSIzpy41+TaN4Gi6mghy+oIa7XMhz41vuNmCPSHYeX+J9R197YhpgT1t6lRRoGjc54UmTbcFI7+GfCEC0qJzegxEO/4Pi9pizHdxl3P1ecnNevRffZtBQayeB/UY9mm6hxKS+Yo2ihb2WPrNp3m53RHFYqAlP2pOxu5N8JvbKSq5Wjvy6lfYJ1UWOlNdjHkzxLpuvmAOPFmf39OI/PRDnz9K26PDTZngbGmoU9mrcBuLBikYDj6732PvT1V9Mtea5gHzLcTO5GSJHGIAixGDQ== duck.yubi4.7306248.gpg"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCk1V0TnsPYmBpU64Flhg2dpfdRvS/5Fvi36VMIOlyS6zgmW8iOVQNTZyjjq/gSLWhaihXq3PV6R/aK5wJONqWQAS3tX++kkqU0B4QODFfd2jIMpHua28TOlA0bIlASy877B7Hy0G6RMpgBKENM7q/lZw8NeJq5X0Y4ZDxEHa4nV/UUe/UvsSIrH/ALxbGAdR46dfJPqyzSNkNgN+LVe3J75h7uCyEpBcuZfZTEw3SblPYj/7g1PWxw3D7Ri/ttGRwaV//sDg/pJnOt3xEiKYnMGDFJO33YjWEWS1xSjtqg66ugO2Cbxr8dIpxsfDfxMSfye5x+EST0TDLfeoGfNbrr duck.yubi4.7306248.pkcs11"
    ];
  };
}
