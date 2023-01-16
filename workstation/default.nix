{ pkgs, lib, ... }:

{
  imports = [
    ../base
  ];
  home-manager.users.duck = {
    home.packages = with pkgs; [
        ## Security
        pinentry
        gnupg
        pass

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
        gitg
        gitAndTools.gitAnnex

        ## Ops
        virtmanager
        wireguard
        pgmanage
        kubectl

        # Utility
        parted gparted
        sshfsFuse
        taskwarrior
        tasksh
        yubikey-manager

        ## Music
        #cmus
        mpd
        pavucontrol
        playerctl

        ## Chat
        signal-desktop
        discord

        ## Gaming
        #steam
        openttd

        ## Creative
        krita
        calibre
        cura
        # davinci?
      ];

    programs.firefox = {
      enable = true;
    };

    programs.vscode = {
      enable = true;
    };

    services.gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };

  };
}
