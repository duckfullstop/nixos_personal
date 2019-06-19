{ pkgs, lib, ... }:

{
  imports = [
    ./ws.nix
  ];
  home-manager.users.duck = {
    # Polybar overrides i3bars to provide, well, uh, bars.
    services.polybar = {
        "bar/main_bar" = {
          # Appears on the Displayport monitor.
          monitor = "\${env:MONITOR:DP-1}";
          bottom = false;
          width = "100%";
          height = 20;
          #offset-x = "5%";
          #offset-y = "1%";
          radius = 0;
          fixed-center = true;


          background = "\${colors.my_background}";
          foreground = "\${colors.my_foreground}";

          line-size = 4;
          line-color = "\${colors.my_color4}";

          border-size = 0;
          border-color = "\${colors.my_color4}";

          padding-left = 0;
          padding-right = 0;

          module-margin-left = 0;
          module-margin-right = 2;

          font-0 = "Hack:fontformat=truetype:size=9;1";
          font-1 = "Hack:fontformat=truetype:size=9;1";
          font-2 = "FontAwesome:fontformat=truetype:size=9;1";

          modules-left = "i3 xwindow";
          modules-center = "date";
          modules-right = "cpu memory";

          tray-position = "right";
          tray-padding = 9;
          tray-transparent = false;
          tray-offset-y = "0%";
          tray-offset-x = "0%";
          tray-maxsize = 18;
          tray-detached = false;
          tray-background = "\${colors.my_background}";
          #tray-underline = "${colors.my_color4}";

          wm-restack = "i3";

          override-redirect = false;
        };

        "bar/secondary_bar" = {
          # Appears on the DVI monitor.
          monitor = "\${env:MONITOR:DVI-I-1}";
          bottom = false;
          width = "100%";
          height = 20;
          #offset-x = "5%";
          #offset-y = "1%";
          radius = 0;
          fixed-center = true;


          background = "\${colors.my_background}";
          foreground = "\${colors.my_foreground}";

          line-size = 4;
          line-color = "\${colors.my_color4}";

          border-size = 0;
          border-color = "\${colors.my_color4}";

          padding-left = 0;
          padding-right = 0;

          module-margin-left = 0;
          module-margin-right = 2;

          font-0 = "Hack:fontformat=truetype:size=9;1";
          font-1 = "Hack:fontformat=truetype:size=9;1";
          font-2 = "FontAwesome:fontformat=truetype:size=9;1";

          modules-left = "i3";
          modules-right = "volume powermenu";

          tray-position = "right";
          tray-padding = 9;
          tray-transparent = false;
          tray-offset-y = "0%";
          tray-offset-x = "0%";
          tray-maxsize = 18;
          tray-detached = false;
          tray-background = "\${colors.my_background}";
          #tray-underline = "${colors.my_color4}";

          wm-restack = "i3";

          override-redirect = false;
        };
    };
  };
}
