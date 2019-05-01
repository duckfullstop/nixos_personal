{ config, pkgs, lib, ... }:

{
  users.users.duck =
  {
    packages = with pkgs;
    [
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
  };
}
