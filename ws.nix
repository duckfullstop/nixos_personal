{ pkgs, lib, ... }:

{
  imports = [
    ./base.nix
  ];
  home-manager.users.duck = {
    home.packages = with pkgs; [
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

    programs.taskwarrior = {
      enable = true;
      dataLocation = ".task";
      colorTheme = "dark-256";
      config = {
        rc.dateformat="d/m/y";

        default.command="next -BLOCKED";
        verbose="blank,label";
        taskd.certificate="~\/.task\/duck.cert.pem";
        taskd.key="~\/.task\/duck.key.pem";
        taskd.ca="~\/.task\/ca.cert.pem";
        taskd.server="tasks.duck.moe:53589";
        taskd.credentials="Labcoats\/duck\/43a644d3-3e56-417b-b14e-2fd788e5a600";
        taskd.trust="ignore hostname";
      };
    };

    services.gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };

    # Graphical and UX.

  };
}
