{ config, pkgs, lib, ... }:

{
  users.users.duck =
  {
    packages = with pkgs;
    [
      ## Security
      pinentry
      gnupg
      pass
      keepassx-community

      ## Editing
      nano

      ## Internet stuff
      firefox
      filezilla
      keybase
      nextcloud-client
      transmission-remote-gtk

      ## Development
      go
      python3
      atom
      jetbrains.goland
      gnome3.ghex

      ## Ops
      virtmanager
      wireguard
      pgmanage
      container-linux-config-transpiler
      kubectl

      # Utility
      parted gparted
      guake
      sshfsFuse
      taskwarrior
      tasksh
      yubikey-manager

      ## Music
      #cmus
      mpd
      pavucontrol

      ## Chat
      signal-desktop
      discord

      ## Gaming
      #steam

      ## Creative
      krita
      calibre
      cura
      # davinci?
    ];
  };
}
