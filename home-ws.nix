{ pkgs, lib, ... }:

{
  imports = [
    ./home-base.nix
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
    # Starting with the i3 WM.
    xsession.windowManager.i3 = {
      enable = true;

      config = {

        # Disable all i3bars (we use polybar).
        bars = [];

        keybindings = let modifier = "Mod4";
          in lib.mkOptionDefault {
          "${modifier}+Return" = "exec urxvt";
          "${modifier}+Shift+q" = "kill";
          "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -sidebar-mode -show combi";
          "${modifier}+Shift+e" = "exec i3-nagbar -t warning -m 'End session? This will close all applications.' -b 'End session' 'exec ~/.bin/end-session'";
          "${modifier}+u" = "border pixel 1";
          "${modifier}+y" = "border pixel 1";
          "${modifier}+n" = "border pixel 1";

          "${modifier}+l" = "exec i3lock -n -c 000000";
          #"Print" = "exec --no-startup-id i3-scrot";
          #"${modifier}+Print" = "exec --no-startup-id i3-scrot -w";
          #"${modifier}+Shift+Print" = "exec --no-startup-id i3-scrot";

          #"${modifier}+Shift+Left" = "move left";
          #"${modifier}+Shift+Right" = "move right";
          #"${modifier}+Shift+Up" = "move up";
          #"${modifier}+Shift+Down" = "move down";

          #"${modifier}+h" = "split h;exec notify-send 'tile horizontally'";
          #"${modifier}+v" = "split v;exec notify-send 'tile vertically'";
          #"${modifier}+q" = "split toggle";

          #"${modifier}+f" = "fullscreen toggle";

          #"${modifier}+s" = "layout stacking";
          #"${modifier}+w" = "layout tabbed";
          #"${modifier}+e" = "layout toggle split";

          #"${modifier}+Shift+space" = "floating toggle";

          #"${modifier}+space" = "focus mode_toggle";

          #"${modifier}+Shift+s" = "sticky toggle";

          #"${modifier}+a" = "focus parent";

          #"${modifier}+Shift+minus" = "move scratchpad";

          #"${modifier}+F9" = "scratchpad show";

          #"${modifier}+Ctrl+Right" = "workspace next";
          #"${modifier}+Ctrl+Left" = "workspace prev";

          # Volume Control
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume 0 +5%";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume 0 -5%";
          "XF86AudioMute" = "exec pactl set-sink-mute 0 toggle";
          "XF86AudioPlay" = "exec playerctl play-pause";
          "XF86AudioStop" = "exec playerctl stop";
          "XF86AudioNext" = "exec playerctl next";
          "XF86AudioPrev" = "exec playerctl previous";

        };
        fonts = ["xft:Hack 10"];

        gaps = {
          inner = 8;
          outer = -4;
          smartGaps = true;
        };

        modifier = "Mod4";

        startup = [
          {
            # Launch Polybar.
            command = "--no-startup-id $HOME/.config/polybar/launch.sh";
            always = true;
          }
        ];

        window = {
          hideEdgeBorders = "none";
          commands = [
            {
              criteria = { class = "^\*";};
              command = "floating enable";
            }
          ];
        };
      };
    };
    xresources.properties = {
      "Xft.dpi" = 96;
      "Xft.antialias" = true;
      "Xft.hinting" = true;
      "Xft.rgba" = "rgb";
      "Xft.autohint" = false;
      "Xft.hintstyle" = "hintslight";
      "Xft.lcdfilter" = "lcddefault";
      "XTerm*background" = "#2b2b2b";
      "XTerm*foreground" = "#e7e7e7";
      "XTerm*pointerColor" = "#16A085";
      "XTerm*faceName" = "Fixed";
      "XTerm*faceSize" = 11;

      "*background" = "#272827";
      "*foreground" = "#657b83";
      "*fading" = 15;
      "*faceColor" = "black";
      "*cursorColor" = "#16A085";
      "#pointerColorBackground" = "#2B2C2B";
      "#pointerColorForeground" = "#16A085";

      "URxvt.internalBorder" = 6;

      "*.color254" = "#3e646f";
      "*.color255" = "#3e646f";

      "*.borderColor" = "#1c1c22";
      "*.background" = "#1c1c22";
      "*.foreground" = "#b0aba8";
      "*.cursorColor" = "#b0aba8";

      # black
      "*.color0" = "#313131";
      "*.color8" = "#434343";

      # red
      "*.color1" = "#7e6565";
      "*.color9" = "#807171";

      # green
      "*.color2" = "#85aab6";
      "*.color10" = "#3e646f";

      # yellow
      "*.color3" = "#90a996";
      "*.color11" = "#badbc2";

      # blue
      "*.color4" = "#3e646f";
      "*.color12" = "#5c828d";

      # magenta
      "*.color5" = "#817f98";
      "*.color13" = "#9b98b7";

      # cyan
      "*.color6" = "#9aa7c0";
      "*.color14" = "#b2b7c0";

      # white
      "*.color7" = "#b0aba8";
      "*.color15" = "#d9d6ca";

      # xcursor
      "Xcursor.theme" = "Breeze";
      "Xcursor.size" = 0;

      # urxvt styling
      "URxvt.font" = "xft:Hack:size=10";
      "URxvt.depth" = 32;
      "URxvt.background" = "[100]#1c1c22";
      "URxvt*scrollBar" = false;
      "URxvt*mouseWheelScrollPage" = false;
      "URxvt*cursorBlink" = true;
      # "!URxvt*.background" = "#1c1c22";
      "URxvt*.foreground" = "#b0aba8";
      "URxvt*cursorColor" =	"#b0aba8";
      "URxvt*saveLines" = 5000;
    };
    services.polybar = {
      enable = true;
      package = pkgs.polybar.override {
        i3GapsSupport = true;
        alsaSupport = true;
        # iwSupport = true;
        githubSupport = true;
      };
      script = ''
        polybar main_bar & polybar secondary_bar &
      '';
      config = {
        "colors" = {
          my_background = "\${xrdb:background}";
          my_foreground = "\${xrdb:foreground}";
          my_color0	= "\${xrdb:color0}";
          my_color1	= "\${xrdb:color1}";
          my_color2	= "\${xrdb:color2}";
          my_color3	= "\${xrdb:color3}";
          my_color4	= "\${xrdb:color4}";
          my_color5	= "\${xrdb:color5}";
          my_color6	= "\${xrdb:color6}";
          my_color7	= "\${xrdb:color7}";
          my_color8	= "\${xrdb:color8}";
          my_color9	= "\${xrdb:color9}";
          my_color10 = "\${xrdb:color10}";
          my_color11 = "\${xrdb:color11}";
          my_color12 = "\${xrdb:color12}";
          my_color13 = "\${xrdb:color13}";
          my_color14 = "\${xrdb:color14}";
          my_color15 = "\${xrdb:color15}";
        };
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


        # Modules
        "module/i3" = {
          type = "internal/i3";
          pin-workspaces = true;
          label-unfocused-background = "\${colors.my_background}";
          label-unfocused-foreground = "\${colors.my_foreground}";
          label-mode = "%mode%";
          label-mode-padding = 2;
          label-mode-background = "\${colors.my_color4}";
          label-focused = "%index%";
          label-focused-foreground = "\${colors.my_foreground}";
          label-focused-background = "\${colors.my_background}";
          label-focused-underline = "\${colors.my_color4}";
          label-focused-padding = 2;
          label-unfocused = "%index%";
          label-unfocused-padding = 2;
          label-visible = "%index%";
          label-visible-underline = "\${colors.my_foreground}";
          label-visible-padding = 4;
          label-urgent = "%index%";
          label-urgent-foreground = "\${colors.my_foreground}";
          label-urgent-background = "\${colors.my_background}";
          label-urgent-underline = "\${colors.my_color8}";
          label-urgent-padding = 2;
        };
        "module/date" = {
          type = "internal/date";
          interval = 5;

          date = "";
          date-alt = "%d/%m/%Y";

          time = "%a %b %d, %H:%M ";

          time-alt = "%H:%M";

          format-prefix-foreground = "\${colors.my_foreground}";
          format-underline = "\${colors.my_color4}";

          label = "%date% %time%";
        };
        "module/volume" = {
          type = "internal/pulseaudio";
          # Comment to use default sink
          # sink = pacmd list-sinks
          use-ui-max = true;
          interval = 5;
          format-muted-background = "\${colors.my_color4}";
          format-volume-background = "\${colors.my_background}";
          format-underline = "\${colors.my_color4}";
          format-volume = "<ramp-volume> <label-volume>";
          label-muted = "M";
          ramp-volume-0 = "";
          ramp-volume-1 = "";
          ramp-volume-2 = "";
        };
        "module/powermenu" = {
          type = "custom/menu";
          format-spacing = 1;
          label-open = "";
          label-open-background = "\${colors.my_background}";
          label-open-foreground = "\${colors.my_color2}";
          label-close = " cancel";
          label-close-background = "\${colors.my_background}";
          label-close-foreground = "\${colors.my_color2}";
          label-separator = " ";
          label-separator-foreground = "\${colors.my_foreground}";

          menu-0-0 = "reboot";
          menu-0-0-exec = "menu-open-1";
          menu-0-1 = "power off";
          menu-0-1-exec = "menu-open-2";
          menu-0-2 = "suspend";
          menu-0-2-exec = "systemctl suspend";

          menu-1-0 = "cancel";
          menu-1-0-exec = "menu-open-0";
          menu-1-1 = "reboot";
          menu-1-1-exec = "systemctl reboot";

          menu-2-0 = "power off";
          menu-2-0-exec = "systemctl poweroff";
          menu-2-1 = "cancel";
          menu-2-1-exec = "menu-open-0";

        };
        "module/cpu" = {
          type = "internal/cpu";
          interval = 1;
          format = "<label> <ramp-load>";
          label = "CPU %percentage%";
          ramp-load-0 = "▁";
          ramp-load-1 = "▂";
          ramp-load-2 = "▃";
          ramp-load-3 = "▄";
          ramp-load-4 = "▅";
          ramp-load-5 = "▆";
          ramp-load-6 = "▇";
          ramp-load-7 = "█";
        };
        "module/memory" = {
          type = "internal/memory";
          interval = 5;
          format = "<label> <bar-used>";
          label = "MEM %gb_used%/%gb_free%";
          bar-used-indicator = " ";
          bar-used-width = 10;
          bar-used-foreground-0 = "\${colors.my_color1}";
          bar-used-foreground-1 = "\${colors.my_color2}";
          bar-used-foreground-2 = "\${colors.my_color3}";
          bar-used-foreground-3 = "\${colors.my_color4}";
          bar-used-fill = "▐";
          bar-used-empty = "▐";
          bar-used-empty-foreground = "\${colors.my_color5}";
        };

        "module/xwindow" = {
          type = "internal/xwindow";
          label = "%title:0:30:...%";
          label-padding = 10;
          label-foreground = "\${colors.my_color6}";
        };

        # WM settings
        "global/wm" = {
          margin-top = 5;
          margin-bottom = 5;
        };
      };
    };

    # Compton composites for us.
    services.compton = {
      enable = true;

      # Nvidia driver shenanigans
      vSync = "opengl";

      # shadows
      shadow = true;
      noDockShadow = true;
      shadowOffsets = [ -7 -7 ];
      shadowOpacity = "0.7";
      shadowExclude = [
        	"name = 'Notification'"
          # workaround for conky until it provides window properties:
          "override_redirect = 1 && !WM_CLASS@:s"
          #	"class_g ?= 'Dunst'", 
          # disable shadows for hidden windows:
          "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
          "_GTK_FRAME_EXTENTS@:c"
          # disables shadows on sticky windows:
          #	"_NET_WM_STATE@:32a *= '_NET_WM_STATE_STICKY'",
          # disables shadows on i3 frames
          "class_g ?= 'i3-frame'"
      ];

      # opacities
      menuOpacity = "0.8";
      inactiveOpacity = "1";
      activeOpacity = "1";
      opacityRule = [
        "99:name *?= 'Call'"
        "99:name *?= 'Conky'"
        "99:class_g = 'Darktable'"
        "50:class_g = 'Dmenu'"
        "99:name *?= 'Event'"
        "99:class_g = 'Firefox'"
        "99:class_g = 'GIMP'"
        "99:name *?= 'Image'"
        "99:class_g = 'Lazpaint'"
        "99:class_g = 'Midori'"
        "99:name *?= 'Minitube'"
        "99:class_g = 'Mousepad'"
        "99:name *?= 'MuseScore'"
        "90:name *?= 'Page Info'"
        "99:name *?= 'Pale Moon'"
        "90:name *?= 'Panel'"
        "99:class_g = 'Pinta'"
        "90:name *?= 'Restart'"
        "50:class_g = 'rofi'"
        "99:name *?= 'sudo'"
        "99:name *?= 'Screenshot'" 
        "99:class_g = 'Viewnior'"
        "99:class_g = 'VirtualBox'"
        "99:name *?= 'VLC'"
        "99:name *?= 'Write'"
        "99:name *?= 'rofi'"
        #"100:class_g = 'URxvt' && !_NET_WM_STATE@:32a" 
        "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
        "96:_NET_WM_STATE@:32a *= '_NET_WM_STATE_STICKY'"
      ];

      
      # fading
      fade = false;
      fadeDelta = 1;
      fadeSteps = [ 0.03 0.03 ];

      # extra options
      extraOptions = ''
        unredir-if-possible = false;
        wintypes : 
        {
          tooltip : 
          {
            fade = true;
            shadow = false;
            opacity = 0.85;
            focus = true;
          };
          fullscreen : 
          {
            fade = true;
            shadow = false;
            opacity = 1;
            focus = true;
          };
        };
      '';
    }

    # Screen locker.
    services.screen-locker = {
      enable = true;
      inactiveInterval = 5; # In minutes.
      lockCmd = "\${pkgs.i3lock}/bin/i3lock -n -c 000000" ;
    };
    # Rofi is a dmenu replacement.
    programs.rofi = {
      enable = true;
      font = "Hack Regular 12";

      colors = {
        window = {
          background = "#1c1c22";
          border = "#3e646f";
          separator = "#3e646f";
        };
        rows = {
          normal = {
            background = "#1c1c22";
            foreground = "#bcbcbc";
            backgroundAlt = "#1c1c22";
            highlight = {
              background = "#3e646f";
              foreground = "#bcbcbc";
            };
          };
          active = {
            background = "#1c1c22";
            foreground = "#bcbcbc";
            backgroundAlt = "#1c1c22";
            highlight = {
              background = "#3e646f";
              foreground = "#bcbcbc";
            };
          };
          urgent = {
            background = "#1c1c22";
            foreground = "#bcbcbc";
            backgroundAlt = "#1c1c22";
            highlight = {
              background = "#3e646f";
              foreground = "#bcbcbc";
            };
          };
        };
      };
      separator = "solid";
      lines = 5;
      scrollbar = false;
      terminal = "urxvt";
      extraConfig = ''
        combi-modi: window,drun,ssh;
      '';
    };


    # urxvt is the terminal emulator of choice.
    programs.urxvt = {
      enable = true;
      # fonts = [""];
      keybindings = {
        "Control-C" = "eval:selection_to_clipboard";
        "Control-V" = "eval:paste_clipboard";
      };
    };

  };
}
